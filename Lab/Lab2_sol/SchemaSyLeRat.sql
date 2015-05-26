SET ECHO ON
-- Script Oracle SQL*plus de création du schéma SyLeRat 
-- Les TRIGGER ne sont pas tous implémentés

-- Création des tables
CREATE TABLE Utilisateur
(idUtilisateur 			VARCHAR(10),
 motPasse	 			VARCHAR(10)	NOT NULL,
 nom 					VARCHAR(10)	NOT NULL,
 prénom 				VARCHAR(10)	NOT NULL,
 PRIMARY KEY (idUtilisateur)
)
/
CREATE TABLE Employé
(idUtilisateur 			VARCHAR(10)	NOT NULL,
 codeMatricule	 		CHAR(6)	NOT NULL,
 catégorieEmployé			VARCHAR(15) NOT NULL,
 PRIMARY KEY (idUtilisateur),
 UNIQUE (codeMatricule),
 FOREIGN KEY (idUtilisateur) REFERENCES Utilisateur
)
/
CREATE TABLE Membre
(idUtilisateur 			VARCHAR(10)	NOT NULL,
 téléphoneRésidence	 	VARCHAR(15)	NOT NULL,
 PRIMARY KEY (idUtilisateur),
 FOREIGN KEY (idUtilisateur) REFERENCES Utilisateur
)
/
CREATE TABLE MembreGénéral
(noSequence 			NUMBER(10)		NOT NULL,
 nbMaxPrêts	 			NUMBER(10)		DEFAULT 5 NOT NULL,
 duréeMaxPrêts			NUMBER(10)		DEFAULT 7 NOT NULL,
 PRIMARY KEY (noSequence)
)
/
CREATE TABLE Editeur
(nomEditeur 			VARCHAR(20)	NOT NULL,
 ville 				VARCHAR(20)	NOT NULL,
 PRIMARY KEY (nomEditeur)
)
/
CREATE TABLE Catégorie
(code					VARCHAR(10)	NOT NULL,
 descripteur 			VARCHAR(20)	NOT NULL,
 codeParent				VARCHAR(10),
 PRIMARY KEY (code),
 FOREIGN KEY (codeParent) REFERENCES Catégorie
)
/
CREATE TABLE Livre
(ISBN 				CHAR(13)		NOT NULL,
 titre 				VARCHAR(50)		NOT NULL,
 annéeParution 			NUMBER(4)		NOT NULL
CHECK(annéeParution > 0),
 nomEditeur 			VARCHAR(20)	NOT NULL,
 code					VARCHAR(10)	NOT NULL,
 PRIMARY KEY (ISBN),
 FOREIGN KEY (nomEditeur) REFERENCES Editeur,
 FOREIGN KEY (code) REFERENCES Catégorie
)
/
CREATE TABLE Exemplaire
(idExemplaire 			VARCHAR(10)		NOT NULL,
 dateAchat 				DATE			NOT NULL,
 statut 				VARCHAR(15)		NOT NULL,
 ISBN 				CHAR(13)		NOT NULL,
 PRIMARY KEY (idExemplaire),
 FOREIGN KEY (ISBN) REFERENCES Livre
)
/
CREATE TABLE PrêtEnCours
(idExemplaire 			VARCHAR(10)	NOT NULL,
 datePrêt 				DATE	DEFAULT SYSDATE NOT NULL,
 idUtilisateur 			VARCHAR(10)	NOT NULL,
 PRIMARY KEY (idExemplaire),
 FOREIGN KEY (idUtilisateur) REFERENCES Utilisateur,
 FOREIGN KEY (idExemplaire) REFERENCES Exemplaire
)
/
CREATE TABLE PrêtArchivé
(noSequence				NUMBER(10)		NOT NULL,
 datePrêt 				DATE			NOT NULL,
 dateRetour 			DATE			NOT NULL,
 idUtilisateur 			VARCHAR(10)		NOT NULL,
 idExemplaire 			VARCHAR(10)		NOT NULL,
 PRIMARY KEY (noSequence),
 FOREIGN KEY (idUtilisateur) REFERENCES Utilisateur,
 FOREIGN KEY (idExemplaire) REFERENCES Exemplaire,
 CHECK (dateRetour >= datePrêt)
)
/
CREATE TABLE Auteur
(noSequence				NUMBER(10)		NOT NULL,
 nom	 				VARCHAR(20)		NOT NULL,
 prénom 				VARCHAR(20)		NOT NULL,
 PRIMARY KEY (noSequence)
)
/
CREATE TABLE AuteurLivre
(noSequence				NUMBER(10)		NOT NULL,
 ISBN 				CHAR(13)		NOT NULL,
 ordreAuteur 			NUMBER(10)		NOT NULL,
 PRIMARY KEY (noSequence, ISBN),
 UNIQUE (ISBN, ordreAuteur),
 FOREIGN KEY (noSequence) REFERENCES Auteur,
 FOREIGN KEY (ISBN) REFERENCES Livre
)
/
PROMPT Quelques exemples de manipulations de données
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY'
/
ALTER SESSION SET NLS_DATE_LANGUAGE = ENGLISH
/

INSERT INTO Catégorie VALUES('10','Sciences',NULL)
/
INSERT INTO Catégorie VALUES('20','Philosophie',NULL)
/
INSERT INTO Catégorie VALUES('30','Histoire', NULL)
/
INSERT INTO Catégorie VALUES('40','Arts', NULL)
/
INSERT INTO Catégorie VALUES('50','Littérature', NULL) 
/
INSERT INTO Catégorie VALUES('101','Informatique','10')
/
INSERT INTO Catégorie VALUES('102','Mathématiques','10')
/
INSERT INTO Catégorie VALUES('103','Chimie','10')
/
INSERT INTO Catégorie VALUES('501','Roman','50') 
/
INSERT INTO Catégorie VALUES('502','Poésie','50')
/
COMMIT
/
SELECT * FROM Catégorie
/

INSERT INTO Auteur VALUES(1,'Knuth','Donald') 
/
INSERT INTO Auteur VALUES(2,'Salton','Gerard') 
/
INSERT INTO Auteur VALUES(3,'Blaha','Michael') 
/
INSERT INTO Auteur VALUES(4,'Premerlani','Henry F.') 
/
INSERT INTO Auteur VALUES(5,'Hofstadter','Douglas,R.')
/
COMMIT
/
SELECT * FROM Auteur
/

INSERT INTO Livre VALUES('3-333-3333333', 'The Art of Computer Programming',1973, 'Addison Wesley', '101') 
/
INSERT INTO Livre VALUES('0-201-12227-8','Automatic Text Processing',1989, 'Addison Wesley', '101') 
/
INSERT INTO Livre VALUES('0-13-123829-9','Object-Oriented Modeling and Design for DB App.',1998, 'Prentice Hall', '101') 
/
INSERT INTO Livre VALUES('0-394-74502-7', 'Gödel, Escher, Bach : An Eternal Golden Braid', 1980, 'Random House', '20')
/
SELECT * FROM Livre
/

INSERT INTO Editeur VALUES ('Addison Wesley', 'Reading,MA')
/
INSERT INTO Editeur VALUES ('Prentice Hall', 'U.Sad.Riv.')
/
INSERT INTO Editeur VALUES ('Random House', 'NewYork,NY')
/
COMMIT
/
SELECT * FROM Editeur
/

INSERT INTO AuteurLivre VALUES(1, '3-333-3333333', 1)
/
INSERT INTO AuteurLivre VALUES(2, '0-201-12227-8', 1)
/
INSERT INTO AuteurLivre VALUES(3, '0-13-123829-9', 1)
/
INSERT INTO AuteurLivre VALUES(4, '0-13-123829-9', 2)
/
INSERT INTO AuteurLivre VALUES(5, '0-394-74502-7', 1)
/
COMMIT
/

INSERT INTO Exemplaire VALUES(1, '10-dec-1975', 'disponible','3-333-3333333')
/
INSERT INTO Exemplaire VALUES(2, '10-dec-1975', 'disponible','3-333-3333333')
/
INSERT INTO Exemplaire VALUES(3, '15-jan-1990', 'disponible','0-201-12227-8')
/
INSERT INTO Exemplaire VALUES(4, '20-mar-1999', 'disponible', '0-13-123829-9')
/
INSERT INTO Exemplaire VALUES(5, '22-mar-1999', 'disponible', '0-13-123829-9')
/
INSERT INTO Exemplaire VALUES(6, '12-sep-1982', 'disponible', '0-394-74502-7')
/
COMMIT
/
SELECT * FROM Exemplaire;
/

INSERT INTO MembreGénéral VALUES(1, 2, 7)
/
COMMIT
/
SELECT * FROM MembreGénéral
/

INSERT INTO Utilisateur VALUES(1,'cocorico','Marshal', 'Amanda', 'membre')
/
INSERT INTO Membre VALUES(1,'(111)111-1111')
/

INSERT INTO Utilisateur VALUES(2,'cocorico','Degas', 'Edgar', 'membre')
/
INSERT INTO Membre VALUES(2,'(222)222-2222')
/

INSERT INTO Utilisateur VALUES(3,'cocorico','Lecommis', 'Coco', 'employé')
/
INSERT INTO Employé VALUES(3,'LECC01','commis')
/
INSERT INTO Utilisateur VALUES(4,'cocorico','Lecommis', 'Toto', 'employé')
/
INSERT INTO Employé VALUES(4,'LECT01','commis')
/
SELECT * FROM Utilisateur
/
COMMIT
/
