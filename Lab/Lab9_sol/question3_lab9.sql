SET serveroutput ON;

CREATE OR REPLACE PROCEDURE tourMonde
(volDepart vol.ville_depart%TYPE) IS 
	CURSOR curseur3 IS 
		SELECT ville_depart, ville_arrivee
		FROM vol;
	volCourant vol.ville_depart%TYPE:=volDepart;
	iter integer :=1;
BEGIN
	DBMS_OUTPUT.PUT_LINE('VOTRE ITENERAIRE:');
	FOR ligne IN curseur3 LOOP
		IF (ligne.ville_depart=volCourant) THEN
			DBMS_OUTPUT.PUT_LINE('Vol '|| iter ||': de ' ||ligne.ville_depart ||' vers ' || ligne.ville_arrivee ||'.');
			volCourant:=ligne.ville_arrivee;	
			iter := iter + 1;
		END IF;
	END LOOP;

	DBMS_OUTPUT.PUT_LINE('FIN ITENERAIRE DU TOUR DU MONDE. BON VOYAGE!');
END;
/

CREATE OR REPLACE FUNCTION obtenirListeVilleD 
(volDepart vol.ville_depart%TYPE) RETURN SYS_REFCURSOR IS
cur SYS_REFCURSOR;

BEGIN
	OPEN cur FOR 
				SELECT ville_depart, ville_arrivee
				FROM vol
				WHERE ville_depart=volDepart;
	RETURN cur;
END;
/
execute tourMonde('Montreal');