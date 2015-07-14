spool /home/votre_code_MS/INF3180/Insert-VentesPleinDeFoin-resultat.txt
set echo on

INSERT INTO Client
 	VALUES(10,'Luc Sansom','(999)999-9999')
/
INSERT INTO Client
 	VALUES(20,'Dollard Tremblay','(888)888-8888')
/
INSERT INTO Client
 	VALUES(30,'Lin Bô','(777)777-7777')
/
INSERT INTO Client
 	VALUES(40,'Jean Leconte','(666)666-6666')
/
INSERT INTO Client
 	VALUES(50,'Hafed Alaoui','(555)555-5555')
/
INSERT INTO Client
 	VALUES(60,'Marie Leconte','(666)666-6666')
/
INSERT INTO Client
 	VALUES(70,'Simon Lecoq','(444)444-4419')
/
INSERT INTO Client
 	VALUES(80,'Dollard Tremblay','(333)333-3333')
/
INSERT INTO Article
 	VALUES(10,'Cèdre en boule',10.99,10)
/
INSERT INTO Article
 	VALUES(20,'Sapin',12.99,10)
/
INSERT INTO Article
 	VALUES(40,'Épinette bleue',25.99,10)
/
INSERT INTO Article
 	VALUES(50,'Chêne',22.99,10)
/
INSERT INTO Article
 	VALUES(60,'Érable argenté',15.99,10)
/
INSERT INTO Article
 	VALUES(70,'Herbe à puce',10.99,10)
/
INSERT INTO Article
 	VALUES(80,'Poirier',26.99,10)
/
INSERT INTO Article
 	VALUES(81,'Catalpa',25.99,10)
/
INSERT INTO Article
 	VALUES(90,'Pommier',25.99,10)
/
INSERT INTO Article
 	VALUES(95,'Génévrier',15.99,10)
/
INSERT INTO Commande 
 	VALUES(1,'2000-06-01',10)
/
INSERT INTO Commande 
 	VALUES(2,'2000-06-02',20)
/
INSERT INTO Commande 
 	VALUES(3,'2000-06-02',10)
/
INSERT INTO Commande 
 	VALUES(4,'2000-07-05',10)
/
INSERT INTO Commande 
 	VALUES(5,'2000-07-09',30)
/
INSERT INTO Commande 
 	VALUES(6,'2000-07-09',20)
/
INSERT INTO Commande 
 	VALUES(7,'2000-07-15',40)
/
INSERT INTO Commande 
 	VALUES(8,'2000-07-15',40)
/
INSERT INTO LigneCommande 
 	VALUES(1,10,10)
/
INSERT INTO LigneCommande 
 	VALUES(1,70,5)
/
INSERT INTO LigneCommande 
 	VALUES(1,90,1)
/
INSERT INTO LigneCommande 
 	VALUES(2,40,2)
/
INSERT INTO LigneCommande 
 	VALUES(2,95,3)
/
INSERT INTO LigneCommande 
 	VALUES(3,20,1)
/
INSERT INTO LigneCommande 
 	VALUES(4,40,1)
/
INSERT INTO LigneCommande 
 	VALUES(4,50,1)
/
INSERT INTO LigneCommande 
 	VALUES(5,70,3)
/
INSERT INTO LigneCommande 
 	VALUES(5,10,5)
/
INSERT INTO LigneCommande 
 	VALUES(5,20,5)
/
INSERT INTO LigneCommande 
 	VALUES(6,10,5)
/
INSERT INTO LigneCommande 
 	VALUES(6,40,1)
/
INSERT INTO LigneCommande 
 	VALUES(7,50,1)
/
INSERT INTO LigneCommande
 	VALUES(8,20,3)
/
INSERT INTO Livraison
 	VALUES(100,'2000-06-03')
/
INSERT INTO Livraison
 	VALUES(101,'2000-06-04')
/
INSERT INTO Livraison
 	VALUES(102,'2000-06-04')
/
INSERT INTO Livraison
 	VALUES(103,'2000-06-05')
/
INSERT INTO Livraison
 	VALUES(104,'2000-07-07')
/
INSERT INTO Livraison
 	VALUES(105,'2000-07-08')
/
INSERT INTO DetailLivraison
 	VALUES(100,1,10,7)
/
INSERT INTO DetailLivraison
 	VALUES(100,1,70,5)
/
INSERT INTO DetailLivraison
 	VALUES(101,1,10,3)
/
INSERT INTO DetailLivraison
 	VALUES(102,2,40,2)
/
INSERT INTO DetailLivraison
 	VALUES(102,2,95,1)
/
INSERT INTO DetailLivraison
 	VALUES(100,3,20,1)
/
INSERT INTO DetailLivraison
 	VALUES(103,1,90,1)
/
INSERT INTO DetailLivraison
 	VALUES(104,4,40,1)
/
INSERT INTO DetailLivraison
 	VALUES(105,5,70,2)
/

set echo off
spool off
