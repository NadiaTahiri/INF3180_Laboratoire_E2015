DELETE reservation;
DELETE depart;
DELETE vol;
DELETE passager;
DELETE pilote;
DELETE avion;
DELETE escale;

INSERT INTO avion VALUES(14,25,'A400','Garche');
INSERT INTO avion VALUES(345,75,'B200','Maubeuge');

INSERT INTO pilote VALUES(1,'Figue','Cannes',45,28004);
INSERT INTO pilote VALUES(2,'Lavande','Touquet',24,11758);

INSERT INTO passager VALUES(1,'Nifrance');
INSERT INTO passager VALUES(8,'Tearice');

INSERT INTO vol VALUES('AF118','08-18','09-12','Paris','Lille');
INSERT INTO vol VALUES('AF8','11-20','23-54','Vaux','Rio');

INSERT INTO depart VALUES('AF118','31-12-95',14,1);
INSERT INTO depart VALUES('AF8','19-12-95',345,2);

INSERT INTO reservation VALUES(1,'AF118','31-12-95');
INSERT INTO reservation VALUES(8,'AF118','31-12-95');

INSERT INTO escale VALUES(1,'Moscou',5);
INSERT INTO escale VALUES(2,'Singapour',4);
INSERT INTO escale VALUES(3,'Sydney',4);
INSERT INTO escale VALUES(4,'Tahiti',4);
INSERT INTO escale VALUES(5,'Honolulu',4);
INSERT INTO escale VALUES(6,'Los Angeles',5);
INSERT INTO escale VALUES(7,'New York',4);
INSERT INTO escale VALUES(8,'Londres',3);