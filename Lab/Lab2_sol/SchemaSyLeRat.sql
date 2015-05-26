SET ECHO ON
-- Script Oracle SQL*plus de cr�ation du sch�ma SyLeRat 
-- Les TRIGGER ne sont pas tous impl�ment�s

-- Cr�ation des tables
CREATE TABLE Utilisateur
(idUtilisateur 			VARCHAR(10),
 motPasse	 			VARCHAR(10)	NOT NULL,
 nom 					VARCHAR(10)	NOT NULL,
 pr�nom 				VARCHAR(10)	NOT NULL,
 PRIMARY KEY (idUtilisateur)
)
/
CREATE TABLE Employ�
(idUtilisateur 			VARCHAR(10)	NOT NULL,
 codeMatricule	 		CHAR(6)	NOT NULL,
 cat�gorieEmploy�			VARCHAR(15) NOT NULL,
 PRIMARY KEY (idUtilisateur),
 UNIQUE (codeMatricule),
 FOREIGN KEY (idUtilisateur) REFERENCES Utilisateur
)
/
CREATE TABLE Membre
(idUtilisateur 			VARCHAR(10)	NOT NULL,
 t�l�phoneR�sidence	 	VARCHAR(15)	NOT NULL,
 PRIMARY KEY (idUtilisateur),
 FOREIGN KEY (idUtilisateur) REFERENCES Utilisateur
)
/
CREATE TABLE MembreG�n�ral
(noSequence 			NUMBER(10)		NOT NULL,
 nbMaxPr�ts	 			NUMBER(10)		DEFAULT 5 NOT NULL,
 dur�eMaxPr�ts			NUMBER(10)		DEFAULT 7 NOT NULL,
 PRIMARY KEY (noSequence)
)
/
CREATE TABLE Editeur
(nomEditeur 			VARCHAR(20)	NOT NULL,
 ville 				VARCHAR(20)	NOT NULL,
 PRIMARY KEY (nomEditeur)
)
/
CREATE TABLE Cat�gorie
(code					VARCHAR(10)	NOT NULL,
 descripteur 			VARCHAR(20)	NOT NULL,
 codeParent				VARCHAR(10),
 PRIMARY KEY (code),
 FOREIGN KEY (codeParent) REFERENCES Cat�gorie
)
/
CREATE TABLE Livre
(ISBN 				CHAR(13)		NOT NULL,
 titre 				VARCHAR(50)		NOT NULL,
 ann�eParution 			NUMBER(4)		NOT NULL
CHECK(ann�eParution > 0),
 nomEditeur 			VARCHAR(20)	NOT NULL,
 code					VARCHAR(10)	NOT NULL,
 PRIMARY KEY (ISBN),
 FOREIGN KEY (nomEditeur) REFERENCES Editeur,
 FOREIGN KEY (code) REFERENCES Cat�gorie
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
CREATE TABLE Pr�tEnCours
(idExemplaire 			VARCHAR(10)	NOT NULL,
 datePr�t 				DATE	DEFAULT SYSDATE NOT NULL,
 idUtilisateur 			VARCHAR(10)	NOT NULL,
 PRIMARY KEY (idExemplaire),
 FOREIGN KEY (idUtilisateur) REFERENCES Utilisateur,
 FOREIGN KEY (idExemplaire) REFERENCES Exemplaire
)
/
CREATE TABLE Pr�tArchiv�
(noSequence				NUMBER(10)		NOT NULL,
 datePr�t 				DATE			NOT NULL,
 dateRetour 			DATE			NOT NULL,
 idUtilisateur 			VARCHAR(10)		NOT NULL,
 idExemplaire 			VARCHAR(10)		NOT NULL,
 PRIMARY KEY (noSequence),
 FOREIGN KEY (idUtilisateur) REFERENCES Utilisateur,
 FOREIGN KEY (idExemplaire) REFERENCES Exemplaire,
 CHECK (dateRetour >= datePr�t)
)
/
CREATE TABLE Auteur
(noSequence				NUMBER(10)		NOT NULL,
 nom	 				VARCHAR(20)		NOT NULL,
 pr�nom 				VARCHAR(20)		NOT NULL,
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
PROMPT Quelques exemples de manipulations de donn�es
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY'
/
ALTER SESSION SET NLS_DATE_LANGUAGE = ENGLISH
/

INSERT INTO Cat�gorie VALUES('10','Sciences',NULL)
/
INSERT INTO Cat�gorie VALUES('20','Philosophie',NULL)
/
INSERT INTO Cat�gorie VALUES('30','Histoire', NULL)
/
INSERT INTO Cat�gorie VALUES('40','Arts', NULL)
/
INSERT INTO Cat�gorie VALUES('50','Litt�rature', NULL) 
/
INSERT INTO Cat�gorie VALUES('101','Informatique','10')
/
INSERT INTO Cat�gorie VALUES('102','Math�matiques','10')
/
INSERT INTO Cat�gorie VALUES('103','Chimie','10')
/
INSERT INTO Cat�gorie VALUES('501','Roman','50') 
/
INSERT INTO Cat�gorie VALUES('502','Po�sie','50')
/
COMMIT
/
SELECT * FROM Cat�gorie
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
INSERT INTO Livre VALUES('0-394-74502-7', 'G�del, Escher, Bach : An Eternal Golden Braid', 1980, 'Random House', '20')
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

INSERT INTO MembreG�n�ral VALUES(1, 2, 7)
/
COMMIT
/
SELECT * FROM MembreG�n�ral
/

INSERT INTO Utilisateur VALUES(1,'cocorico','Marshal', 'Amanda', 'membre')
/
INSERT INTO Membre VALUES(1,'(111)111-1111')
/

INSERT INTO Utilisateur VALUES(2,'cocorico','Degas', 'Edgar', 'membre')
/
INSERT INTO Membre VALUES(2,'(222)222-2222')
/

INSERT INTO Utilisateur VALUES(3,'cocorico','Lecommis', 'Coco', 'employ�')
/
INSERT INTO Employ� VALUES(3,'LECC01','commis')
/
INSERT INTO Utilisateur VALUES(4,'cocorico','Lecommis', 'Toto', 'employ�')
/
INSERT INTO Employ� VALUES(4,'LECT01','commis')
/
SELECT * FROM Utilisateur
/
COMMIT
/
