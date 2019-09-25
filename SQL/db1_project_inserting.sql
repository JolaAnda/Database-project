/* mannschaft */
INSERT INTO mannschaft VALUES('Deutschland','A', 4);
INSERT INTO mannschaft VALUES('England','A', 1);
INSERT INTO mannschaft VALUES('Schweiz','A', 0);
INSERT INTO mannschaft VALUES('Botswana','B', 0);
INSERT INTO mannschaft VALUES('Island','B', 0);
INSERT INTO mannschaft VALUES('Iran','B', 0);

/* veranstaltungsort */
INSERT INTO veranstaltungsort VALUES('Luzhniki-Stadion', 'Moskau', 81000, 12.99);
INSERT INTO veranstaltungsort VALUES('Sankt-Petersburg-Stadion', 'St. Petersburg', 68000, 23.00);
INSERT INTO veranstaltungsort VALUES('Fisht-Stadion', 'Sotschi', 47659, 9.95);
INSERT INTO veranstaltungsort VALUES('Spartak-Stadion', 'Moskau', 45360, 19.50);

/* spieler */
INSERT INTO spieler VALUES(0,'Volker Vollpfosten','Botswana', 'aktiv');
INSERT INTO spieler VALUES(1,'Torben Torgefahr','Deutschland', 'aktiv');
INSERT INTO spieler VALUES(2,'Mitchel Matchmaker','England', 'aktiv');
INSERT INTO spieler VALUES(3,'Björn Ballson','Island', 'aktiv');
INSERT INTO spieler VALUES(4,'Georg Goaly','Iran', 'aktiv');
INSERT INTO spieler VALUES(5,'Torben Tribbler','Schweiz', 'aktiv');
    
/* spielplan */  
INSERT INTO spielplan VALUES(0, TO_DATE('14.06.2018','DD-MM-YYYY'), 'Luzhniki-Stadion', 'Deutschland', 'England', 0, 0);
INSERT INTO spielplan VALUES(1, TO_DATE('15.06.2018','DD-MM-YYYY'), 'Sankt-Petersburg-Stadion', 'England', 'Schweiz', 0, 0);
INSERT INTO spielplan VALUES(2, TO_DATE('16.06.2018','DD-MM-YYYY'), 'Fisht-Stadion', 'Schweiz', 'Deutschland', 0, 0);
INSERT INTO spielplan VALUES(3, TO_DATE('17.06.2018','DD-MM-YYYY'), 'Spartak-Stadion', 'Iran', 'Botswana', 0, 0);
INSERT INTO spielplan VALUES(4, TO_DATE('18.06.2018','DD-MM-YYYY'), 'Luzhniki-Stadion', 'Island', 'Iran', 0, 0);
INSERT INTO spielplan VALUES(5, TO_DATE('19.06.2018','DD-MM-YYYY'), 'Sankt-Petersburg-Stadion', 'Botswana', 'Island', 0, 0);

/* beteiligte */
INSERT INTO beteiligte VALUES(0, 'Peter Zwegat', 'Schiedsrichter', NULL);
INSERT INTO beteiligte VALUES(1, 'Barbara Salesch', 'Schiedsrichter', NULL);
INSERT INTO beteiligte VALUES(2, 'Jogi Löw', 'Trainer', 'Deutschland');
INSERT INTO beteiligte VALUES(3, 'Ragnar Lodbrok', 'Trainer', 'Island');
INSERT INTO beteiligte VALUES(4, 'Dicker Junge', 'Waterboy', NULL);
INSERT INTO beteiligte VALUES(5, 'Willfred Wiener', 'Würstchenverkäufer', NULL);

/* nutzer */
INSERT INTO nutzer VALUES('admin', 'admin', 'admin');
INSERT INTO nutzer VALUES('schwaebische_zeitung', 'abcde', 'journalisten');
INSERT INTO nutzer VALUES('team_deutschland', '12345', 'teilnehmer');
INSERT INTO nutzer VALUES('nsa_germany', '00000', 'gast');

/* verstoss */
INSERT INTO verstoss VALUES(0, 2, 1, 0, NULL);
INSERT INTO verstoss VALUES(1, 3, 1, 0, NULL);
INSERT INTO verstoss VALUES(2, 1, 0, 1, '2 Spiele gesperrt');
INSERT INTO verstoss VALUES(3, 4, 1, 0, 'Beim Foul selbst verletzt');

COMMIT;
