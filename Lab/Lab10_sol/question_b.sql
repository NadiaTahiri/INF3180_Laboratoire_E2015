CREATE OR REPLACE TRIGGER initialiserTotalCommande
BEFORE INSERT ON Commande
FOR EACH ROW BEGIN
	:NEW.totalCommande:=0.0;
END;
/

CREATE OR REPLACE TRIGGER modifierTotal
AFTER DELETE OR INSERT ON LigneCommande
FOR EACH ROW
DECLARE prix NUMBER(10,2);
BEGIN
	IF DELETING THEN 
		LOCK TABLE Article IN ROW SHARE MODE;
		SELECT prixUnitaire INTO prix FROM Article
			WHERE noArticle = :OLD.noArticle;
		UPDATE Commande
		SET totalCommande = totalCommande – :OLD.quantite*prix
		WHERE noCommande  = :OLD.noCommande ;
	END IF;
	IF INSERTING THEN 
		LOCK TABLE Article IN ROW SHARE MODE;
		SELECT prixUnitaire INTO prix FROM Article
			WHERE noArticle = :NEW.noArticle;
		UPDATE Commande
		SET totalCommande = totalCommande + :NEW.quantite*prix
		WHERE noCommande = :NEW.noCommande ;
	END IF;
END;
/

CREATE OR REPLACE TRIGGER stopModifLignes
BEFORE UPDATE ON LigneCommande
FOR EACH ROW BEGIN
	raise_application_error(-20100, 'les lignes de commande ne peuvent être modifiées');
END;
/

CREATE OR REPLACE TRIGGER stopModifPrix
BEFORE UPDATE OF prixUnitaire ON Article
FOR EACH ROW BEGIN
	raise_application_error(-20101, 'le prix ne peut être modifié');
END;
/