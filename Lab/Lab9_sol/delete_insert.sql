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

INSERT INTO vol VALUES('AF305','08-18','09-12','Montreal','Toronto');
INSERT INTO vol VALUES('AF306','08-18','09-12','Toronto','New York');
INSERT INTO vol VALUES('AF307','08-18','09-12','New York','Seattle');
INSERT INTO vol VALUES('AF308','08-18','09-12','Seattle','Vancouver');
INSERT INTO vol VALUES('AF309','08-18','09-12','Vancouver','Tokyo');
INSERT INTO vol VALUES('AF310','08-18','09-12','Tokyo','Hong Kong');
INSERT INTO vol VALUES('AF311','08-18','09-12','Hong Kong','New Delhi');
INSERT INTO vol VALUES('AF312','08-18','09-12','New Delhi','Ankara');
INSERT INTO vol VALUES('AF313','08-18','09-12','Ankara','Paris');
INSERT INTO vol VALUES('AF314','08-18','09-12','Lille','Montreal');
INSERT INTO vol VALUES('AF315','11-20','23-54','Paris', 'Bordeaux');
INSERT INTO vol VALUES('AF316','11-20','23-54', 'Bordeaux','Montreal');


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
