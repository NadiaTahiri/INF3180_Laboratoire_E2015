DROP TABLE reservation;
DROP TABLE depart;
DROP TABLE vol;
DROP TABLE passager;
DROP TABLE pilote;
DROP TABLE avion;
DROP TABLE escale;

CREATE TABLE avion(
	numav INTEGER,
	capacite INTEGER,
	modele VARCHAR2(5),
	entrepot VARCHAR2(20),
	CONSTRAINT pk_avion PRIMARY KEY (numav)
)
/
CREATE TABLE pilote(
	matricule INTEGER,
	nom VARCHAR2(20),
	ville VARCHAR2(20),
	age INTEGER,
	salaire INTEGER,
	CONSTRAINT pk_pilote PRIMARY KEY (matricule)
)
/
CREATE TABLE passager(
	numab INTEGER,
	nomab VARCHAR2(20),
	CONSTRAINT pk_passager PRIMARY KEY (numab)
)
/
CREATE TABLE vol(
	numvol VARCHAR2(5),
	heure_depart VARCHAR2(10),
	heure_arrivee VARCHAR2(10),
	ville_depart VARCHAR2(10),
	ville_arrivee VARCHAR2(10),
	CONSTRAINT pk_vol PRIMARY KEY (numvol)
)
/
CREATE TABLE depart(
	numvol VARCHAR2(5),
	date_dep VARCHAR2(10),
	numav INTEGER,
	matricule INTEGER,
	CONSTRAINT fk_numvol FOREIGN KEY(numvol) REFERENCES vol(numvol),
	CONSTRAINT pk_numav FOREIGN KEY(numav) REFERENCES avion(numav),
	CONSTRAINT pk_matricule FOREIGN KEY(matricule) REFERENCES pilote(matricule),
	CONSTRAINT pk_depart PRIMARY KEY (numvol,numav,matricule)
)
/
CREATE TABLE reservation(
	numab INTEGER,
	numvol VARCHAR2(5),
	date_dep VARCHAR2(10),
	CONSTRAINT pk_numab FOREIGN KEY(numab) REFERENCES passager(numab),
	CONSTRAINT fk_numvol_res FOREIGN KEY(numvol) REFERENCES vol(numvol),
	CONSTRAINT pk_res PRIMARY KEY (numab,numvol)
)
/
CREATE TABLE escale(
	numescale INTEGER,
	ville_escale VARCHAR2(20),
	duree_escale VARCHAR2(10),
	CONSTRAINT pk_escale PRIMARY KEY (numescale)
)
/