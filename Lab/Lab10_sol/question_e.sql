CREATE OR REPLACE TRIGGER apresModificationPrix
AFTER UPDATE OF prixUnitaire ON Article
FOR EACH ROW
DECLARE
vieuxTotal, NUMBER(10,2);
nouveauTotal NUMBER(10,2);
/* curseur avec un paramètre qui est le numéro d'article dont les lignes sont à modifier*/
	CURSOR ligneCursor (noA INTEGER) IS
		SELECT * FROM LigneCommande 
WHERE noArticle = noA
FOR UPDATE OF totalLigne;

BEGIN
	FOR uneLigne IN ligneCursor(:OLD:noArticle) LOOP
		vieuxTotal:= uneLigne.totalLigne;
		nouveauTotal:=uneLigne.quantite*:NEW.prixUnitaire;
		UPDATE LigneCommande
		SET totalLigne = nouveauTotal
		WHERE  CURRENT OF ligneCursor;
		UPDATE Commande
		SET totalCommande = totalCommande + nouveauTotal-vieuxTotal
		WHERE noCommande = uneLigne.noCommande ;
	END LOOP;
END;
/