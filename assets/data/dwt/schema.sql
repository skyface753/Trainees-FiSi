/*==============================================================*/
/* DWT Praktikum 2												*/
/* tabellenschema.sql                                           */
/*==============================================================*/

drop table if exists VERKAUF;

drop table if exists FAHRZEUG;

drop table if exists KUNDE;

drop table if exists ORT;

drop table if exists VERKAEUFER;

drop table if exists ZEIT;

/*==============================================================*/
/* Table: FAHRZEUG                                              */
/*==============================================================*/
create table FAHRZEUG 
(
   F_ID                 integer                        not null,
   F_BEZEICHNUNG        varchar                        null,
   F_TYP                varchar                        null,
   F_KATEGORIE          varchar                        null,
   constraint PK_FAHRZEUG primary key (F_ID)
);

/*==============================================================*/
/* Table: KUNDE                                                 */
/*==============================================================*/
create table KUNDE 
(
   K_ID                 integer                        not null,
   K_NAME               varchar                        null,
   K_WOHNORT            varchar                        null,
   K_STRASSE            varchar                        null,
   K_GESCHLECHT         varchar                        null,
   K_KUNDENGRUPPE       varchar                        null,
   constraint PK_KUNDE primary key (K_ID)
);

/*==============================================================*/
/* Table: ORT                                                   */
/*==============================================================*/
create table ORT 
(
   O_ID                 integer                        not null,
   O_FILIALE            varchar                        null,
   O_STADT              varchar                        null,
   O_BUNDESLAND         varchar                        null,
   O_LAND               varchar                        null,
   constraint PK_ORT primary key (O_ID)
);

/*==============================================================*/
/* Table: VERKAEUFER                                            */
/*==============================================================*/
create table VERKAEUFER 
(
   V_ID                 integer                        not null,
   V_VERKAEUFER          varchar                        null,
   V_GEBIETSLEITER      varchar                        null,
   V_VERTRIEBSLEITER    varchar                        null,
   constraint PK_VERKAEUFER primary key (V_ID)
);

/*==============================================================*/
/* Table: VERKAUF                                               */
/*==============================================================*/
create table VERKAUF 
(
   VK_ID                integer                        not null,
   O_ID                 integer                        null,
   F_ID                 integer                        null,
   Z_ID                 integer                        null,
   V_ID                 integer                        null,
   K_ID                 integer                        null,
   VK_UMSATZ            float                          null,
   constraint PK_VERKAUF primary key (VK_ID)
);

/*==============================================================*/
/* Table: ZEIT                                                  */
/*==============================================================*/
create table ZEIT 
(
   Z_ID                 integer                        not null,
   Z_TAG                integer                        null,
   Z_MONAT              integer                        null,
   Z_QUARTAL            integer                        null,
   Z_JAHR               integer                        null,
   constraint PK_ZEIT primary key (Z_ID)
);



alter table VERKAUF
   add constraint FK_VERKAUF_REFERENCE_ORT foreign key (O_ID)
      references ORT (O_ID)
      on update restrict
      on delete restrict;

alter table VERKAUF
   add constraint FK_VERKAUF_REFERENCE_FAHRZEUG foreign key (F_ID)
      references FAHRZEUG (F_ID)
      on update restrict
      on delete restrict;

alter table VERKAUF
   add constraint FK_VERKAUF_REFERENCE_ZEIT foreign key (Z_ID)
      references ZEIT (Z_ID)
      on update restrict
      on delete restrict;

alter table VERKAUF
   add constraint FK_VERKAUF_REFERENCE_VERKAEUF foreign key (V_ID)
      references VERKAEUFER (V_ID)
      on update restrict
      on delete restrict;

alter table VERKAUF
   add constraint FK_VERKAUF_REFERENCE_KUNDE foreign key (K_ID)
      references KUNDE (K_ID)
      on update restrict
      on delete restrict;
