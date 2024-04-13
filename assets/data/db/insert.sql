SET SEARCH_PATH TO STREAMING;

/*==============================================================*/
/* Delete all data                                              */
/*==============================================================*/
delete from STREAMING.Ausstrahlung;
delete from STREAMING.Sender;
delete from STREAMING.Streamingangebotxref;
delete from STREAMING.Episode;
delete from STREAMING.SerieHauptschauspielerXref;
delete from STREAMING.Vertrag;
delete from STREAMING.Kunde;
delete from STREAMING.Streamingdienst;
delete from STREAMING.Serie;
delete from STREAMING.Kunstler;

/*==============================================================*/
/* Streamingdienst                                             */
/* Netflix, Disney+, Amazon Prime, Paramount+, Joyn                  */
/*==============================================================*/
insert into STREAMING.Streamingdienst 
    (streamingdienst_pk, Anbieter) values 
        (1, 'Netflix'),
        (2, 'Disney+'),
        (3, 'Amazon Prime'),
        (4, 'Paramount+'),
        (5, 'Joyn');

/*==============================================================*/
/* Kunde                                                        */
/*==============================================================*/
insert into STREAMING.Kunde 
    (eMail, isBusiness) values 
        ('pilsstubeherkules@darmstadt.de', false),
        ('peter.feldmann@awo.de', false),
('fbi@h-da.de', true),
('mark.zuckerberg@facebook.com', true);

/*==============================================================*/
/* Vertrag                                                      */
/*==============================================================*/
insert into STREAMING.Vertrag 
    (streamingdienst_fk, email_fk, Monatspreis, Vertragslaufzeit) values 
        (1, 'peter.feldmann@awo.de', 25, '2024-01-01'),
        (2, 'peter.feldmann@awo.de', 25, '2024-01-01'),
        (3, 'peter.feldmann@awo.de', 25, '2024-01-01'),
        (1, 'fbi@h-da.de', 12, '2023-06-01'),
        (5, 'fbi@h-da.de', 12, '2023-06-01'),
        (1, 'mark.zuckerberg@facebook.com', 12, '2023-06-01'),
        (4, 'mark.zuckerberg@facebook.com', 12, '2023-06-01'),
        (5, 'mark.zuckerberg@facebook.com', 12, '2023-06-01');


/*==============================================================*/
/* Sender                                                       */
/* ARD, ZDF, RTL, PRO7, SAT1                                   */
/*==============================================================*/
insert into STREAMING.Sender 
    (sender_pk, Sendername) values 
        (1,'ARD'),
        (2, 'ZDF'),
        (3,'RTL'),
        (4, 'PRO7'),
        (5, 'SAT1');



/*==============================================================*/
/* Kunstler                                                     */
/*==============================================================*/
insert into STREAMING.Kunstler 
    (kuenstler_pk, Vorname, Nachname) values 
        (1, 'Bryan', 'Cranston'),
        (2, 'Aaron', 'Paul'),
        (3, 'Anna', 'Gunn'),
        (4, 'Vince', 'Gilligan'), -- Stoffentwickler
        (5, 'Seth', 'MacFarlane'), -- Stoffentwickler
        (6, 'Adrianne', 'Palicki'),
        (7, 'Penny', 'Johnson Jerald'),
        (8, 'Omar', 'Sy'),
        (9, 'Ludivine', 'Sagnier'),
        (10, 'George', 'Kay'), -- Stoffentwickler
        (11, 'Aaron', 'Paul'),
        (12, 'Michelle', 'Monaghan'),
        (13, 'Jessica', 'Goldberg'); -- Stoffentwickler




/*==============================================================*/
/* Serie                                                        
*/
insert into STREAMING.serie 
    (serie_pk, kuenstler_fk, serienname) values 
        (1, 4, 'Breaking Bad'),
        (2, 5, 'The Orville'),
        (3, 10, 'Lupin'),
        (4, 13, 'The Path');

/* Hauptdarsteller */
insert into STREAMING.SerieHauptschauspielerXref 
    (kuenstler_fk, serie_fk) values 
        (1, 1),
        (2, 1),
        (3, 1),
        (5, 2),
        (6, 2),
        (7, 2),
        (8, 3),
        (9, 3),
        (10, 3),
        (11, 4),
        (12, 4),
        (13, 4);


/*==============================================================*/
/* Episoden                                                       */
/*==============================================================*/
insert into STREAMING.episode 
    (serie_pk, episode_pk, staffel, titel, IMDB_Rating) values 
        (1, 1, 5, 'Live Free or Die', 9.2),
        (1, 2, 5, 'Madrigal', 8.8),
        (1, 3, 5, 'Hazard Pay', 8.8),
        (1, 4, 5, 'Fifty-One', 8.8),
        (1, 5, 5, 'Dead Freight', 9.7),
        (1, 6, 5, 'Buyout', 9.0),
        (1, 7, 5, 'Say My Name', 9.5),
        (1, 8, 5, 'Gliding Over All', 9.6),
        (1, 9, 5, 'Blood Money', 9.4),
        (1, 10, 5, 'Buried', 9.2),
        (1, 11, 5, 'Confessions', 9.6),
        (1, 12, 5, 'Rabid Dog', 9.1),
        (1, 13, 5, 'To hajiilee', 9.8),
        (1, 14, 5, 'Ozymandias', 10.0),
        (1, 15, 5, 'Granite State', 9.7),
        (1, 16, 5, 'Felina', 9.9),
        (1, 1, 4, 'Box Cutter', 9.2),
        (1, 2, 4, 'Thirty-Eight Snub', 8.2),
        (1, 3, 4, 'Open House', 8.0),
        (1, 4, 4, 'Bullet Points', 8.6),
        (1, 5, 4, 'Shotgun', 8.6),
        (1, 6, 4, 'Cornered', 8.4),
        (1, 7, 4, 'Problem Dog', 8.8),
        (1, 8, 4, 'Hermanos', 9.2),
        (1, 9, 4, 'Bug', 8.8),
        (1, 10, 4, 'Salud', 9.6),
        (1, 11, 4, 'Crawl Space', 9.7),
        (1, 12, 4, 'End Times', 9.5),
        (1, 13, 4, 'Face Off', 9.9),
        (1, 1, 3, 'No Más', 8.5),
        (1, 2, 3, 'Caballo sin Nombre', 8.6),
        (1, 3, 3, 'I.F.T.', 8.4),
        (1, 4, 3, 'Green Light', 8.2),
        (1, 5, 3, 'Más', 8.5),
        (1, 6, 3, 'Sunset', 9.3),
        (1, 7, 3, 'One Minute', 9.6),
        (1, 8, 3, 'I See You', 8.7),
        (1, 9, 3, 'Kafkaesque', 8.4),
        (1, 10, 3, 'Fly', 7.8),
        (1, 11, 3, 'Abiquiu', 8.4),
        (1, 12, 3, 'Half Measures', 9.5),
        (1, 13, 3, 'Full Measure', 9.6),
        (1, 1, 2, 'Seven Thirty-Seven', 8.6),
        (1, 2, 2, 'Grilled', 9.3),
        (1, 3, 2, 'Bit by a Dead Bee', 8.3),
        (1, 4, 2, 'Down', 8.2),
        (1, 5, 2, 'Breakage', 8.3),
        (1, 6, 2, 'Peekaboo', 8.8),
        (1, 7, 2, 'Negro y Azul', 8.6),
        (1, 8, 2, 'Bett Call Saul', 9.2),
        (1, 9, 2, '4 Days Out', 9.1),
        (1, 10, 2, 'Over', 8.5),
        (1, 11, 2, 'Mandala', 8.9),
        (1, 12, 2, 'Phoenix', 9.3),
        (1, 13, 2, 'ABQ', 9.2),
        (1, 1, 1, 'Der Einstieg', 9.0),
        (1, 2, 1, 'Die Katze ist im Sack', 8.6),
        (1, 3, 1, '...And the Bags in the River', 8.7),
        (1, 4, 1, 'Cancer Man', 8.3),
        (1, 5, 1, 'Gray Matter', 8.3),
        (1, 6, 1, 'Crazy Handful of Nothin', 9.3),
        (1, 7, 1, 'A No-Rough-Stuff-Type Deal', 8.8),

        (3, 1, 1, 'Chapter 1', 7.8),
        (3, 2, 1, 'Chapter 2', 7.7),
        (3, 3, 1, 'Chapter 3', 7.5),
        (3, 4, 1, 'Chapter 4', 7.6),
        (3, 5, 1, 'Chapter 5', 7.7),
        (3, 1, 2, 'Chapter 6', 7.1),
        (3, 2, 2, 'Chapter 7', 7.2),
        (3, 3, 2, 'Chapter 8', 7.4),
        (3, 4, 2, 'Chapter 9', 7.7),
        (3, 5, 2, 'Chapter 10', 8.1),

        (2, 1, 1, 'Old Wounds', 7.4),
        (2, 2, 1, 'Command Performance', 7.7),
        (2, 3, 1, 'About a Girl', 7.7),
        (2, 4, 1, 'If the Stars Should Appear', 8.2),
        (2, 5, 1, 'Pria', 7.8),
        (2, 6, 1, 'Krill', 7.9),
        (2, 7, 1, 'Majority Rule', 8.2),
        (2, 8, 1, 'Into the Fold', 7.3),
        (2, 9, 1, 'Cupids Dagger', 7.8),
        (2, 10, 1, 'Firestorm', 8.0),
        (2, 11, 1, 'New Dimensions', 7.9),
        (2, 12, 1, 'Mad Idolatry', 8.4),
        (2, 1, 2, 'Ja loja', 7.1),
        (2, 2, 2, 'Primal Urges', 6.6),
        (2, 3, 2, 'Home', 8.1),
        (2, 4, 2, 'Nothing Left on Earth Excepting Fishes', 8.2),
        (2, 5, 2, 'All the World Is Birthday Cake', 7.3),
        (2, 6, 2, 'A Happy Refrain', 8.1),
        (2, 7, 2, 'Deflectors', 7.5),
        (2, 8, 2, 'Identity', 9.1),
        (2, 9, 2, 'Identity, Part II', 9.0),
        (2, 10, 2, 'Blood of Patriots', 7.8),
        (2, 11, 2, 'Lasting Impressions', 8.8),
        (2, 12, 2, 'Sanctuary', 8.2),
        (2, 13, 2, 'Tomorrow, and Tomorrow, and Tomorrow', 8.2),
        (2, 14, 2, 'The Road Not Taken', 8.5),
        (2, 1, 3, 'Electric Sheep', 7.4),
        (2, 2, 3, 'Shadow Realms', 7.2),
        (2, 3, 3, 'Mortality Paradox', 7.9),
        (2, 4, 3, 'Gently Falling Rain', 8.3),
        (2, 5, 3, 'A Tale of Two Topas', 7.9),
        (2, 6, 3, 'Twice in a Lifetime', 8.8),
        (2, 7, 3, 'From Unknown Graves', 8.5),
        (2, 8, 3, 'Midnight Blue', 8.1),
        (2, 9, 3, 'Domino', 9.2),
        (2, 10, 3, 'Future Unknown', 8.1),

        (4, 1, 1, 'What the Fire Throws', 7.5),
        (4, 2, 1, 'The Era of the Ladder', 7.8),
        (4, 3, 1, 'A Homecoming', 7.8),
        (4, 4, 1, 'The Future', 7.6),
        (4, 5, 1, 'The Hole', 7.7),
        (4, 6, 1, 'Breaking and Entering', 7.8),
        (4, 7, 1, 'Refugees', 8.3),
        (4, 8, 1, 'The Shore', 8.0),
        (4, 9, 1, 'A Room of Ones Own', 8.5),
        (4, 10, 1, 'The Miracle', 8.1),
        (4, 1, 2, 'Liminal Twilight', 7.5),
        (4, 2, 2, 'Dead Moon', 7.4),
        (4, 3, 2, 'The Father and the Son', 7.3),
        (4, 4, 2, 'The Red Wall', 7.5),
        (4, 5, 2, 'Why We Source', 7.7),
        (4, 6, 2, 'For Our Safety', 7.4),
        (4, 7, 2, 'Providence', 7.1),
        (4, 8, 2, 'Return', 7.5),
        (4, 9, 2, 'Oz', 7.8),
        (4, 10, 2, 'Restitution', 7.5),
        (4, 11, 2, 'Defiance', 7.7),
        (4, 12, 2, 'Spiritus Mundi', 8.4),
        (4, 13, 2, 'Mercy', 7.2),
        (4, 1, 3, 'The Beginning', 7.3),
        (4, 2, 3, 'A Beast, No More', 7.6),
        (4, 3, 3, 'Locusts', 7.4),
        (4, 4, 3, 'De Rerum Natura', 7.9),
        (4, 5, 3, 'Pageantry', 7.8),
        (4, 6, 3, 'Messiah', 7.9),
        (4, 7, 3, 'The Gardens at Giverny', 7.8),
        (4, 8, 3, 'The Door', 7.7),
        (4, 9, 3, 'The Veil', 8.0),
        (4, 10, 3, 'The Strongest Souls', 7.7),
        (4, 11, 3, 'Bad Faith', 7.7),
        (4, 12, 3, 'A New American Religion', 8.4),
        (4, 13, 3, 'Blood Moon', 7.7);

/*==============================================================*/
/* Streamingangebotxref                                          */
/*==============================================================*/

insert into STREAMING.Streamingangebotxref 
    (streamingdienst_fk, serie_fk, episode_fk, staffel) values 
        (1, 1, 1, 1),
        (1, 1, 2, 1),
        (1, 1, 3, 1),

        (5, 2, 1, 1),
        (5, 2, 2, 1),
        (5, 2, 3, 1),

        (3, 3, 1, 1),
        (3, 3, 2, 1),
        (3, 3, 3, 1);



insert into STREAMING.Ausstrahlung 
    (serie_pk, episode_pk, Staffel, sender_pk, Ausstahlungsnummer, Startzeit, Endzeit) values 
        (3, 1, 1, 5, 1, '2023-05-01 15:30', '2023-05-01 16:30'),
        (3, 2, 1, 5, 2, '2023-05-01 16:30', '2023-05-01 17:30'),
        (3, 2, 1, 5, 3, '2023-05-01 17:30', '2023-05-01 18:30'),

        (2, 1, 1, 4, 4, '2023-05-01 16:00', '2023-05-01 17:00'),
        (2, 2, 1, 4, 5, '2023-05-01 17:00', '2023-05-01 18:00'),
        (2, 3, 1, 4, 6, '2023-05-01 18:00', '2023-05-01 19:00');

