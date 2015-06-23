DELETE FROM Types;
DELETE FROM Installer;
DELETE FROM Poste;
DELETE FROM Salle;
DELETE FROM Segment;
DELETE FROM Logiciel;

INSERT INTO Segment VALUES (sequenceSeg.NEXTVAL,'130.120.80','Brin RDC',NULL);
INSERT INTO Segment VALUES (sequenceSeg.NEXTVAL,'130.120.81','Brin 1er  etage',NULL);
INSERT INTO Segment VALUES (sequenceSeg.NEXTVAL,'130.120.82','Brin 2eme etage',NULL);

INSERT INTO Salle VALUES (sequenceSalle.NEXTVAL,'s01','Salle 1',3,'130.120.80');
INSERT INTO Salle VALUES (sequenceSalle.NEXTVAL,'s02','Salle 2',2,'130.120.80');
INSERT INTO Salle VALUES (sequenceSalle.NEXTVAL,'s03','Salle 3',2,'130.120.80');
INSERT INTO Salle VALUES (sequenceSalle.NEXTVAL,'s11','Salle 11',2,'130.120.81');
INSERT INTO Salle VALUES (sequenceSalle.NEXTVAL,'s12','Salle 12',1,'130.120.81');
INSERT INTO Salle VALUES (sequenceSalle.NEXTVAL,'s21','Salle 21',2,'130.120.82');
INSERT INTO Salle VALUES (sequenceSalle.NEXTVAL,'s22','Salle 22',0,'130.120.83');
INSERT INTO Salle VALUES (sequenceSalle.NEXTVAL,'s23','Salle 23',0,'130.120.83');

INSERT INTO poste VALUES (sequencePoste.NEXTVAL,'p1','Poste 1','130.120.80','01','TX','s01');
INSERT INTO poste VALUES (sequencePoste.NEXTVAL,'p2','Poste 2','130.120.80','02','UNIX','s01');
INSERT INTO poste VALUES (sequencePoste.NEXTVAL,'p3','Poste 3','130.120.80','03','TX','s01');
INSERT INTO poste VALUES (sequencePoste.NEXTVAL,'p4','Poste 4','130.120.80','04','PCWS','s02');
INSERT INTO poste VALUES (sequencePoste.NEXTVAL,'p5','Poste 5','130.120.80','05','PCWS','s02');
INSERT INTO poste VALUES (sequencePoste.NEXTVAL,'p6','Poste 6','130.120.80','06','UNIX','s03');
INSERT INTO poste VALUES (sequencePoste.NEXTVAL,'p7','Poste 7','130.120.80','07','TX','s03');
INSERT INTO poste VALUES (sequencePoste.NEXTVAL,'p8','Poste 8','130.120.81','01','UNIX','s11');
INSERT INTO poste VALUES (sequencePoste.NEXTVAL,'p9','Poste 9','130.120.81','02','TX','s11');
INSERT INTO poste VALUES (sequencePoste.NEXTVAL,'p10','Poste 10','130.120.81','03','UNIX','s12');
INSERT INTO poste VALUES (sequencePoste.NEXTVAL,'p11','Poste 11','130.120.82','01','PCNT','s21');
INSERT INTO poste VALUES (sequencePoste.NEXTVAL,'p12','Poste 12','130.120.82','02','PCWS','s21');

INSERT INTO logiciel VALUES (sequenceLog.NEXTVAL,'log1','Oracle 6',   to_date('13/05/1995','dd/mm/yyyy'),'6.2','UNIX',3000);
INSERT INTO logiciel VALUES (sequenceLog.NEXTVAL,'log2','Oracle 8',   to_date('15/09/1999','dd/mm/yyyy'),'8i','UNIX',5600);
INSERT INTO logiciel VALUES (sequenceLog.NEXTVAL,'log3','SQL Server', to_date('12/04/1998','dd/mm/yyyy'),'7','PCNT',3000);
INSERT INTO logiciel VALUES (sequenceLog.NEXTVAL,'log4','Front Page', to_date('03/06/1997','dd/mm/yyyy'),'5','PCWS',500);
INSERT INTO logiciel VALUES (sequenceLog.NEXTVAL,'log5','WinDev',     to_date('12/05/1997','dd/mm/yyyy'),'5','PCWS',750);
INSERT INTO logiciel VALUES (sequenceLog.NEXTVAL,'log6','SQL*Net', NULL, '2.0','UNIX',500);
INSERT INTO logiciel VALUES (sequenceLog.NEXTVAL,'log7','I. I. S.',   to_date('12/04/2002','dd/mm/yyyy'),'2','PCNT',900);
INSERT INTO logiciel VALUES (sequenceLog.NEXTVAL,'log8','DreamWeaver',to_date('21/09/2003','dd/mm/yyyy'),'2.0','BeOS',1400);


INSERT INTO Types VALUES (sequenceTyp.NEXTVAL,'TX',  'Terminal X-Window');
INSERT INTO Types VALUES (sequenceTyp.NEXTVAL,'UNIX','Système Unix');
INSERT INTO Types VALUES (sequenceTyp.NEXTVAL,'PCNT','PC Windows  NT');
INSERT INTO Types VALUES (sequenceTyp.NEXTVAL,'PCWS','PC Windows');
INSERT INTO Types VALUES (sequenceTyp.NEXTVAL,'NC',  'Network Computer');

INSERT INTO installer VALUES ('p2', 'log1', sequenceIns.NEXTVAL,to_date('15/05/2003','dd/mm/yyyy'),NULL);
INSERT INTO installer VALUES ('p2', 'log2', sequenceIns.NEXTVAL,to_date('17/09/2003','dd/mm/yyyy'),NULL);
INSERT INTO installer VALUES ('p4', 'log5', sequenceIns.NEXTVAL, NULL,NULL);
INSERT INTO installer VALUES ('p6', 'log6', sequenceIns.NEXTVAL,to_date('20/05/2003','dd/mm/yyyy'),NULL);
INSERT INTO installer VALUES ('p6', 'log1', sequenceIns.NEXTVAL,to_date('20/05/2003','dd/mm/yyyy'),NULL);
INSERT INTO installer VALUES ('p8', 'log2', sequenceIns.NEXTVAL,to_date('19/05/2003','dd/mm/yyyy'),NULL);
INSERT INTO installer VALUES ('p8', 'log6', sequenceIns.NEXTVAL,to_date('20/05/2003','dd/mm/yyyy'),NULL);
INSERT INTO installer VALUES ('p11','log3', sequenceIns.NEXTVAL,to_date('20/04/2003','dd/mm/yyyy'),NULL);
INSERT INTO installer VALUES ('p12','log4', sequenceIns.NEXTVAL,to_date('20/04/2003','dd/mm/yyyy'),NULL);
INSERT INTO installer VALUES ('p11','log7', sequenceIns.NEXTVAL,to_date('20/04/2003','dd/mm/yyyy'),NULL);
INSERT INTO installer VALUES ('p7', 'log7', sequenceIns.NEXTVAL,to_date('01/04/2002','dd/mm/yyyy'),NULL);

COMMIT;

SELECT * FROM Segment;

SELECT * FROM Salle;

SELECT * FROM Poste;

SELECT * FROM Logiciel;

SELECT * FROM Installer;

SELECT * FROM Types;


