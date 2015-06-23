DROP TABLE Segment;
DROP TABLE Salle;
DROP TABLE Poste;
DROP TABLE Logiciel;
DROP TABLE Installer;
DROP TABLE Types;

CREATE TABLE Segment
	( seqSeg    NUMBER(5),
	 indIP      VARCHAR2(11),
	 nomSegment VARCHAR2(20) CONSTRAINT nn_nomSegment NOT NULL,
	 etage NUMBER(2),
	 CONSTRAINT pk_Segment PRIMARY KEY (seqSeg));

CREATE TABLE Salle
	(seqSalle   NUMBER(5),
	 nSalle     VARCHAR2(7),
	 nomSalle   VARCHAR2(20) CONSTRAINT nn_nomSalle NOT NULL,
	 nbPoste    NUMBER(2),
	 indIP      VARCHAR2(11),
	 CONSTRAINT pk_salle PRIMARY KEY (seqSalle));

CREATE TABLE Poste
	(sqqPoste   NUMBER(5),
	 nPoste     VARCHAR2(7),
	 nomPoste   VARCHAR2(20) CONSTRAINT nn_nomPoste NOT NULL,
	 indIP      VARCHAR2(11),
	 ad         VARCHAR2(3),
	 typePoste  VARCHAR2(9),
	 nSalle     VARCHAR2(7),
	 CONSTRAINT pk_Poste PRIMARY KEY (sqqPoste),
	 CONSTRAINT ck_ad    CHECK (ad BETWEEN '000' AND '255'));

CREATE TABLE Logiciel
	(seqLog     NUMBER(5),
	 nLog       VARCHAR2(5),
	 nomLog     VARCHAR2(20) CONSTRAINT nn_nomLog NOT NULL,
	 dateAch    DATE,
	 version    VARCHAR2(7),
	 typeLog    VARCHAR2(9),
	 prix       NUMBER(6,2),
	 CONSTRAINT pk_Logiciel PRIMARY KEY (seqLog),
	 CONSTRAINT ck_prix     CHECK (prix >= 0));

CREATE TABLE Installer
	(nPoste     VARCHAR2(7),
	 nLog       VARCHAR2(5),
	 numIns     NUMBER(5),
	 dateIns    DATE DEFAULT SYSDATE,
	 delai      INTERVAL DAY(5) TO SECOND(2),
	 CONSTRAINT pk_Installer PRIMARY KEY(nPoste,nLog));

CREATE TABLE Types
	(seqTyp   NUMBER(5),
	 typeLP   VARCHAR2(9), nomType VARCHAR2(20),
	 CONSTRAINT pk_types PRIMARY KEY(seqTyp));
