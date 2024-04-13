/*==============================================================*/
/* DBMS name:      PostgreSQL 14.x                              */
/* Created on:     09.05.2023 11:11:18                          */
/*==============================================================*/

DROP SCHEMA IF EXISTS STREAMING CASCADE;
CREATE SCHEMA IF NOT EXISTS STREAMING;
SET SEARCH_PATH TO STREAMING;


/*==============================================================*/
/* Table: Ausstrahlung                                          */
/*==============================================================*/
create table STREAMING.Ausstrahlung (
   serie_pk             integer              not null,
   episode_pk           integer              not null,
   Staffel              integer              not null,
   sender_pk            integer              not null,
   Ausstahlungsnummer   integer              not null,
   Startzeit            timestamp                 not null,
   Endzeit              timestamp                 not null,
   constraint PK_AUSSTRAHLUNG primary key (serie_pk, episode_pk, Staffel, sender_pk, Ausstahlungsnummer)
);

/*==============================================================*/
/* Index: AUSSTRAHLUNG_PK                                       */
/*==============================================================*/
create unique index AUSSTRAHLUNG_PK on STREAMING.Ausstrahlung (
serie_pk,
episode_pk,
Staffel,
sender_pk,
Ausstahlungsnummer
);

/*==============================================================*/
/* Index: ASSOCIATION_8_FK                                      */
/*==============================================================*/
create  index ASSOCIATION_8_FK on STREAMING.Ausstrahlung (
serie_pk,
episode_pk,
Staffel
);

/*==============================================================*/
/* Index: ASSOCIATION_9_FK                                      */
/*==============================================================*/
create  index ASSOCIATION_9_FK on STREAMING.Ausstrahlung (
sender_pk
);

/*==============================================================*/
/* Table: Episode                                               */
/*==============================================================*/
create table STREAMING.Episode (
   serie_pk             integer              not null,
   episode_pk           integer              not null,
   Staffel              integer              not null,
   Titel                varchar(254)         not null,
   IMDB_Rating          integer,
   constraint PK_EPISODE primary key (serie_pk, episode_pk, Staffel)
);

/*==============================================================*/
/* Index: EPISODE_PK                                            */
/*==============================================================*/
create unique index EPISODE_PK on STREAMING.Episode (
serie_pk,
episode_pk,
Staffel
);

/*==============================================================*/
/* Index: ASSOCIATION_7_FK                                      */
/*==============================================================*/
create  index ASSOCIATION_7_FK on STREAMING.Episode (
serie_pk
);

/*==============================================================*/
/* Table: Kunde                                                 */
/*==============================================================*/
create table STREAMING.Kunde (
   eMail                varchar(254)         not null,
   isBusiness           boolean,
   constraint PK_KUNDE primary key (eMail)
);

/*==============================================================*/
/* Index: KUNDE_PK                                              */
/*==============================================================*/
create unique index KUNDE_PK on STREAMING.Kunde (
eMail
);

/*==============================================================*/
/* Table: Kunstler                                              */
/*==============================================================*/
create table STREAMING.Kunstler (
   kuenstler_pk         integer              not null,
   Vorname              varchar(254)         not null,
   Nachname             varchar(254)         not null,
   constraint PK_KUNSTLER primary key (kuenstler_pk)
);

/*==============================================================*/
/* Index: KUNSTLER_PK                                           */
/*==============================================================*/
create unique index KUNSTLER_PK on STREAMING.Kunstler (
kuenstler_pk
);

/*==============================================================*/
/* Table: Sender                                                */
/*==============================================================*/
create table STREAMING.Sender (
   sender_pk            integer              not null,
   Sendername           varchar(254)         not null,
   constraint PK_SENDER primary key (sender_pk)
);

/*==============================================================*/
/* Index: SENDER_PK                                             */
/*==============================================================*/
create unique index SENDER_PK on STREAMING.Sender (
sender_pk
);

/*==============================================================*/
/* Table: Serie                                                 */
/*==============================================================*/
create table STREAMING.Serie (
   serie_pk             integer              not null,
   kuenstler_fk         integer              not null,
   Serienname           varchar(254)         not null,
   constraint PK_SERIE primary key (serie_pk)
);

/*==============================================================*/
/* Index: SERIE_PK                                              */
/*==============================================================*/
create unique index SERIE_PK on STREAMING.Serie (
serie_pk
);

/*==============================================================*/
/* Index: ASSOCIATION_1_FK                                      */
/*==============================================================*/
create  index ASSOCIATION_1_FK on STREAMING.Serie (
kuenstler_fk
);

/*==============================================================*/
/* Table: SerieHauptschauspielerXref                            */
/*==============================================================*/
create table STREAMING.SerieHauptschauspielerXref (
   kuenstler_fk         integer              not null,
   serie_fk             integer              not null,
   constraint PK_SERIEHAUPTSCHAUSPIELERXREF primary key (kuenstler_fk, serie_fk)
);

/*==============================================================*/
/* Index: ASSOCIATION_3_PK                                      */
/*==============================================================*/
create unique index ASSOCIATION_3_PK on STREAMING.SerieHauptschauspielerXref (
kuenstler_fk,
serie_fk
);

/*==============================================================*/
/* Index: ASSOCIATION_3_FK                                      */
/*==============================================================*/
create  index ASSOCIATION_3_FK on STREAMING.SerieHauptschauspielerXref (
kuenstler_fk
);

/*==============================================================*/
/* Index: ASSOCIATION_3_FK2                                     */
/*==============================================================*/
create  index ASSOCIATION_3_FK2 on STREAMING.SerieHauptschauspielerXref (
serie_fk
);

/*==============================================================*/
/* Table: StreamingAngebotXref                                  */
/*==============================================================*/
create table STREAMING.StreamingAngebotXref (
   streamingdienst_fk   integer              not null,
   serie_fk             integer              not null,
   episode_fk           integer              not null,
   Staffel              integer              not null,
   constraint PK_STREAMINGANGEBOTXREF primary key (streamingdienst_fk, serie_fk, episode_fk, Staffel)
);

/*==============================================================*/
/* Index: ASSOCIATION_2_PK                                      */
/*==============================================================*/
create unique index ASSOCIATION_2_PK on STREAMING.StreamingAngebotXref (
streamingdienst_fk,
serie_fk,
episode_fk,
Staffel
);

/*==============================================================*/
/* Index: ASSOCIATION_2_FK                                      */
/*==============================================================*/
create  index ASSOCIATION_2_FK on STREAMING.StreamingAngebotXref (
streamingdienst_fk
);

/*==============================================================*/
/* Index: ASSOCIATION_2_FK2                                     */
/*==============================================================*/
create  index ASSOCIATION_2_FK2 on STREAMING.StreamingAngebotXref (
serie_fk,
episode_fk,
Staffel
);

/*==============================================================*/
/* Table: Streamingdienst                                       */
/*==============================================================*/
create table STREAMING.Streamingdienst (
   streamingdienst_pk   integer              not null,
   Anbieter             varchar(254)         not null,
   constraint PK_STREAMINGDIENST primary key (streamingdienst_pk)
);

/*==============================================================*/
/* Index: STREAMINGDIENST_PK                                    */
/*==============================================================*/
create unique index STREAMINGDIENST_PK on STREAMING.Streamingdienst (
streamingdienst_pk
);

/*==============================================================*/
/* Table: Vertrag                                               */
/*==============================================================*/
create table STREAMING.Vertrag (
   streamingdienst_fk   integer              not null,
   eMail_fk             varchar(254)         not null,
   Monatspreis          real                 not null,
   Vertragslaufzeit     date              not null,
   constraint PK_VERTRAG primary key (streamingdienst_fk, eMail_fk)
);

/*==============================================================*/
/* Index: VERTRAG_PK                                            */
/*==============================================================*/
create unique index VERTRAG_PK on STREAMING.Vertrag (
streamingdienst_fk,
eMail_fk
);

/*==============================================================*/
/* Index: ASSOCIATION_10_FK                                     */
/*==============================================================*/
create  index ASSOCIATION_10_FK on STREAMING.Vertrag (
streamingdienst_fk
);

/*==============================================================*/
/* Index: ASSOCIATION_10_FK2                                    */
/*==============================================================*/
create  index ASSOCIATION_10_FK2 on STREAMING.Vertrag (
eMail_fk
);

alter table STREAMING.Ausstrahlung
   add constraint FK_AUSSTRAH_ASSOCIATI_EPISODE foreign key (serie_pk, episode_pk, Staffel)
      references Episode (serie_pk, episode_pk, Staffel)
      on delete restrict on update restrict;

alter table STREAMING.Ausstrahlung
   add constraint FK_AUSSTRAH_ASSOCIATI_SENDER foreign key (sender_pk)
      references Sender (sender_pk)
      on delete restrict on update restrict;

alter table STREAMING.Episode
   add constraint FK_EPISODE_ASSOCIATI_SERIE foreign key (serie_pk)
      references Serie (serie_pk)
      -- on delete restrict on update restrict;
      on delete cascade on update restrict;

alter table STREAMING.Serie
   add constraint FK_SERIE_ASSOCIATI_KUNSTLER foreign key (kuenstler_fk)
      references Kunstler (kuenstler_pk)
      on delete restrict on update restrict;

alter table STREAMING.SerieHauptschauspielerXref
   add constraint FK_SERIEHAU_ASSOCIATI_KUNSTLER foreign key (kuenstler_fk)
      references Kunstler (kuenstler_pk)
      on delete restrict on update restrict;

alter table STREAMING.SerieHauptschauspielerXref
   add constraint FK_SERIEHAU_ASSOCIATI_SERIE foreign key (serie_fk)
      references Serie (serie_pk)
      -- on delete restrict on update restrict;
      on delete cascade on update restrict;

alter table STREAMING.StreamingAngebotXref
   add constraint FK_STREAMIN_ASSOCIATI_EPISODE foreign key (serie_fk, episode_fk, Staffel)
      references Episode (serie_pk, episode_pk, Staffel)
      -- on delete restrict on update restrict;
      on delete cascade on update restrict;

alter table STREAMING.StreamingAngebotXref
   add constraint FK_STREAMIN_ASSOCIATI_STREAMIN foreign key (streamingdienst_fk)
      references Streamingdienst (streamingdienst_pk)
      on delete restrict on update restrict;

alter table STREAMING.Vertrag
   add constraint FK_VERTRAG_ASSOCIATI_KUNDE foreign key (eMail_fk)
      references Kunde (eMail)
      on delete restrict on update restrict;

alter table STREAMING.Vertrag
   add constraint FK_VERTRAG_ASSOCIATI_STREAMIN foreign key (streamingdienst_fk)
      references Streamingdienst (streamingdienst_pk)
      on delete restrict on update restrict;
