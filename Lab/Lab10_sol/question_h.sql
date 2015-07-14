-- TRIGGER qui fait la vérification à l'insertion d'un DétailLivraison
-- NB il faut aussi vérifier les cas de modifications ...
CREATE OR REPLACE TRIGGER BIDetLivDateLivApresDatComm
BEFORE INSERT ON DetailLivraison
REFERENCING
	NEW AS ligneApres
FOR EACH ROW
DECLARE
	laDateCommande		Commande.dateCommande%TYPE;
	laDateLivraison		Livraison.dateLivraison%TYPE;
BEGIN
	SELECT dateCommande INTO laDateCommande
	FROM Commande
	WHERE noCommande = :ligneApres.noCommande;
	SELECT dateLivraison INTO laDateLivraison
	FROM Livraison
	WHERE noLivraison = :ligneApres.noLivraison;
	IF laDateLivraison < laDateCommande THEN
		raise_application_error(-20100, 'la date de livraison ne peut précéder la date de la commande');
	END IF;
END;
/