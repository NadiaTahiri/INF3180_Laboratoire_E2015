-- On ne traite ici que le cas de l'insertion d'un DetailLivraison
CREATE OR REPLACE TRIGGER BIDetLivMemeClient
BEFORE INSERT ON DetailLivraison
REFERENCING
	OLD AS ligneAvant
	NEW AS ligneApres
FOR EACH ROW
DECLARE
	leNouveauNoClient	INTEGER;
	leNoClient		INTEGER;
	CURSOR curseurLesNoClient(leNoLivraison DetailLivraison.noLivraison%TYPE)IS
		SELECT DISTINCT noClient
		FROM DetailLivraison D, Commande C
		WHERE C.noCommande = D.noCommande AND
			D.noLivraison = leNoLivraison;
BEGIN
	LOCK TABLE Commande IN SHARE MODE;
	LOCK TABLE DetailLivraison IN SHARE MODE;
	OPEN curseurLesNoClient(:ligneApres.noLivraison);
	FETCH curseurLesNoClient INTO leNoClient;
	IF curseurLesNoClient%FOUND THEN
		CLOSE curseurLesNoClient;
		SELECT noClient
		INTO leNouveauNoClient
		FROM Commande C
		WHERE C.noCommande = :ligneApres.noCommande;
		IF leNoClient <> leNouveauNoClient THEN
			raise_application_error(-20100, 'pas le même client pour les commandes');
		END IF;
	ELSE
		CLOSE curseurLesNoClient;
	END IF;
END;
/