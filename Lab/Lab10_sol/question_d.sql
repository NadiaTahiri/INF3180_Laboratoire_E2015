CREATE OR REPLACE TRIGGER initialiser_total_commande
BEFORE INSERT ON Commande
FOR EACH ROW BEGIN
	:NEW.total_commande:=0.0;
END;
/

CREATE OR REPLACE TRIGGER initialiserTotalLigne
BEFORE INSERT ON LigneCommande
FOR EACH ROW
DECLARE totalLigne NUMBER(10,2);
BEGIN
	LOCK TABLE Article IN ROW SHARE MODE;
SELECT prixUnirtaire*:NEW.quantite INTO totalLigne 
FROM Article WHERE noArticle = :NEW.noArticle;
	:NEW.totalLigne:=totalLigne;
END;
/

CREATE OR REPLACE TRIGGER modifierTotalLigne
BEFORE UPDATE of noCommande, quantite, noArticle ON LigneCommande
/*On ne peut intercepter les tentatives de modification de totalLigne car lorsque déclenché par
le TRIGGER aprèsModificationPrix, il est interdit ici d'accéder au prix en cours de modification!*/

FOR EACH ROW
DECLARE 
totalLigne NUMBER(10,2);
nbLivraison INTEGER;
BEGIN
	LOCK TABLE DetailLivraison IN SHARE MODE;
	SELECT COUNT(*) INTO nbLivraison FROM DetailLivraison 
	WHERE noCommande = :OLD.noCommande AND
noArticle = :OLD.noArticle ;
	IF nbLivraison = 0 THEN
		LOCK TABLE Article IN ROW SHARE MODE;
SELECT prixUnitaire*:NEW.quantite INTO totalLigne 
FROM Article WHERE noArticle = :NEW.noArticle;
		:NEW.totalLigne:=totalLigne;
	ELSE
		raise_application_error(-20100, 'il est interdit de modifier une ligne de commande
lorsque des produits ont été livrés pour cette ligne');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER apresMajLignes
AFTER DELETE OR INSERT OR UPDATE OF totalLigne, noCommande ON LigneCommande
FOR EACH ROW
BEGIN
	IF DELETING OR (UPDATING AND :OLD.noCommande != :NEW.noCommande) THEN 
		UPDATE Commande
		SET totalCommande = totalCommande – :OLD.totalLigne
		WHERE noCommande  = :OLD.noCommande ;
	END IF;
	IF INSERTING OR (UPDATING AND :OLD.noCommande != :NEW.noCommande) THEN 
		UPDATE Commande
		SET totalCommande = totalCommande + :NEW.totalLigne
		WHERE noCommande = :NEW.noCommande ;
	END IF;
	IF (UPDATING AND  :OLD.noCommande = :NEW.noCommande AND :OLD.totalLigne != :NEW.totalLigne) THEN
		UPDATE Commande
		SET totalCommande = totalCommande – :OLD.totalLigne +:NEW.totalLigne
		WHERE noCommande  = :NEW.noCommande ;
	END IF;
END;
/

CREATE OR REPLACE TRIGGER apresModificationPrix
AFTER UPDATE OF prixUnitaire ON Article
FOR EACH ROW
DECLARE
BEGIN
		UPDATE LigneCommande
		SET totalLigne = quantite*:NEW.prixUnitaire
		WHERE  noArticle = :OLD.noArticle;
END;
/