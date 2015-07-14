CREATE OR REPLACE TRIGGER initQteEnAttente
BEFORE INSERT ON LigneCommande
FOR EACH ROW BEGIN
	:NEW.quantiteEnAttente:=:NEW.quantite;
END;
/

/* Vérifier la quantité en stock et en attente */
CREATE TRIGGER verifQtStockAttente
BEFORE INSERT ON DetailLivraison
FOR EACH ROW
DECLARE
qteStock, qteDejaLivree, qteCommandee NUMBER;
BEGIN
     SELECT 	quantiteEnStock INTO qteStock
     FROM	Article
     WHERE 	noArticle = :NEW.noArticle
        FOR UPDATE OF quantiteEnStock;
     IF :NEW.quantiteLivree > qteStock THEN
        raise_application_error(-20100, 'quantité en stock insuffisante');
     END IF;

     LOCK TABLE DetailLivraison IN SHARE MODE;
     SELECT SUM(quantiteLivree) INTO qteDejaLivree
     FROM DetailLivraison
     WHERE noArticle = :NEW.noArticle AND
           noCommande = :NEW.noCommande;
     SELECT quantite INTO qtéCommandee
     FROM LigneCommande
     WHERE noArticle = :NEW.noArticle AND
           noCommande = :NEW.noCommande
           FOR UPDATE;

	IF :NEW.quantiteLivree > qteCommandee- qteDejaLivree THEN
        raise_application_error(-20101, 'quantité livrée supérieure à quantité en attente');
     END IF;
END;
/

CREATE OR REPLACE TRIGGER addQtAttenteStock
AFTER INSERT ON DetailLivraison
FOR EACH ROW
DECLARE
BEGIN
  UPDATE LigneCommande
  SET
     quantiteEnAttente = quantiteEnAttente - :NEW.quantiteLivree
  WHERE
no_commande =:NEW.noCommande AND 
noArticle =:NEW.noArticle ;
  UPDATE Article
  SET
     quantiteEnStock = quantiteEnStock - :NEW.quantiteLivree
  WHERE
    noArticle = :NEW.noArticle;
END;
/