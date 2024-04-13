SET SEARCH_PATH TO STREAMING;

-- 1. Fügen Sie der Tabelle Vertrageinen CHECKConstraint hinzu, so dass Abopreise niemals kleiner werden können als 10€. Verwenden Sie hierfür eine ALTER TABLE Anweisung
alter table STREAMING.vertrag add constraint check_monatspreis check (monatspreis >= 10);
-- 2. Fügen Sie einen Constraint hinzu, der verbietet, dass negative Ratings für Episoden eingetragen werden. Benennen Sie den Constraint mit „keine_negativen_rating“
alter table STREAMING.episode add constraint keine_negativen_rating check (imdb_rating >= 0);
-- 3. Fügen Sie weiterhin einen DEFAULT-Wert von 8 für die Ratings hinzu. Verwenden Sie hierfür jeweils ALTER TABLE Anweisungen.
alter table STREAMING.episode alter column imdb_rating set default 8;

-- Should fail
insert into STREAMING.Vertrag
    (streamingdienst_fk, email_fk, Monatspreis, Vertragslaufzeit) values
    (4, 'peter.feldmann@awo.de', 9, '2024-01-01');
-- Should fail
insert into STREAMING.episode
    (serie_pk, episode_pk, staffel, titel, IMDB_Rating) values
    (1, 17, 5, 'Live Free or Die', -1);

-- Should work
insert into STREAMING.episode
    (serie_pk, episode_pk, staffel, titel) values
    (1, 17, 5, 'Live Free or Die');
select * from STREAMING.episode where serie_pk = 1 and episode_pk = 17;