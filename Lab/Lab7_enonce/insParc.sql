--

DELETE FROM Types;
DELETE FROM Installer;
DELETE FROM Poste;
DELETE FROM Salle;
DELETE FROM Segment;
DELETE FROM Logiciel;


INSERT INTO Segment VALUES ('130.120.80','Brin RDC',NULL);
INSERT INTO Segment VALUES ('130.120.81','Brin 1er  étage',NULL);
INSERT INTO Segment VALUES ('130.120.82','Brin 2ème étage',NULL);

INSERT INTO Salle VALUES ('s01','Salle 1',3,'130.120.80');
INSERT INTO Salle VALUES ('s02','Salle 2',2,'130.120.80');
INSERT INTO Salle VALUES ('s03','Salle 3',2,'130.120.80');
INSERT INTO Salle VALUES ('s11','Salle 11',2,'130.120.81');
INSERT INTO Salle VALUES ('s12','Salle 12',1,'130.120.81');
INSERT INTO Salle VALUES ('s21','Salle 21',2,'130.120.82');
INSERT INTO Salle VALUES ('s22','Salle 22',0,'130.120.83');
INSERT INTO Salle VALUES ('s23','Salle 23',0,'130.120.83');

INSERT INTO poste VALUES ('p1','Poste 1','130.120.80','01','TX','s01');
INSERT INTO poste VALUES ('p2','Poste 2','130.120.80','02','UNIX','s01');
INSERT INTO poste VALUES ('p3','Poste 3','130.120.80','03','TX','s01');
INSERT INTO poste VALUES ('p4','Poste 4','130.120.80','04','PCWS','s02');
INSERT INTO poste VALUES ('p5','Poste 5','130.120.80','05','PCWS','s02');
INSERT INTO poste VALUES ('p6','Poste 6','130.120.80','06','UNIX','s03');
INSERT INTO poste VALUES ('p7','Poste 7','130.120.80','07','TX','s03');
INSERT INTO poste VALUES ('p8','Poste 8','130.120.81','01','UNIX','s11');
INSERT INTO poste VALUES ('p9','Poste 9','130.120.81','02','TX','s11');
INSERT INTO poste VALUES ('p10','Poste 10','130.120.81','03','UNIX','s12');
INSERT INTO poste VALUES ('p11','Poste 11','130.120.82','01','PCNT','s21');
INSERT INTO poste VALUES ('p12','Poste 12','130.120.82','02','PCWS','s21');

INSERT INTO logiciel VALUES ('log1','Oracle 6',   '13-05-1995','6.2','UNIX',3000);
INSERT INTO logiciel VALUES ('log2','Oracle 8',   '15-09-1999','8i','UNIX',5600);
INSERT INTO logiciel VALUES ('log3','SQL Server', '12-04-1998','7','PCNT',3000);
INSERT INTO logiciel VALUES ('log4','Front Page', '03-06-1997','5','PCWS',500);
INSERT INTO logiciel VALUES ('log5','WinDev',     '12-05-1997','5','PCWS',750);
INSERT INTO logiciel VALUES ('log6','SQL*Net', NULL, '2.0','UNIX',500);
INSERT INTO logiciel VALUES ('log7','I. I. S.',   '12-04-2002','2','PCNT',900);
INSERT INTO logiciel VALUES ('log8','DreamWeaver','21-09-2003','2.0','BeOS',1400);


INSERT INTO Types VALUES ('TX',  'Terminal X-Window');
INSERT INTO Types VALUES ('UNIX','Système Unix');
INSERT INTO Types VALUES ('PCNT','PC Windows  NT');
INSERT INTO Types VALUES ('PCWS','PC Windows');
INSERT INTO Types VALUES ('NC',  'Network Computer');

INSERT INTO installer VALUES ('p2', 'log1', 1,'15-05-2003',NULL);
INSERT INTO installer VALUES ('p2', 'log2', 2,'17-09-2003',NULL);
INSERT INTO installer VALUES ('p4', 'log5', 3, NULL,NULL);
INSERT INTO installer VALUES ('p6', 'log6', 4,'20-05-2003',NULL);
INSERT INTO installer VALUES ('p6', 'log1', 5,'20-05-2003',NULL);
INSERT INTO installer VALUES ('p8', 'log2', 6,'19-05-2003',NULL);
INSERT INTO installer VALUES ('p8', 'log6', 7,'20-05-2003',NULL);
INSERT INTO installer VALUES ('p11','log3', 8,'20-04-2003',NULL);
INSERT INTO installer VALUES ('p12','log4', 9,'20-04-2003',NULL);
INSERT INTO installer VALUES ('p11','log7', 10,'20-04-2003',NULL);
INSERT INTO installer VALUES ('p7', 'log7', 11,'01-04-2002',NULL);

COMMIT;

SELECT * FROM Segment;

SELECT * FROM Salle;

SELECT * FROM Poste;

SELECT * FROM Logiciel;

SELECT * FROM Installer;

SELECT * FROM Types;


