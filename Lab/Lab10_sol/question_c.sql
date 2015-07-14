CREATE OR REPLACE TRIGGER prixNePeutDiminuer
BEFORE UPDATE OF prixUnitaire ON Article
FOR EACH ROW 
WHEN (OLD.prixUnitaire > NEW.prixUnitaire)
BEGIN
	raise_application_error(-20100, 'le prix d''un produit ne peut diminuer');
END;
/
