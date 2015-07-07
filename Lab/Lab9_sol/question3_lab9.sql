SET serveroutput ON;

CREATE OR REPLACE PROCEDURE tourMonde
(volDepart vol.ville_depart%TYPE) IS 
	CURSOR curseur3 IS 
		SELECT ville_depart, ville_arrivee
		FROM vol;
	volD vol.ville_depart%TYPE;
	volA vol.ville_arrivee%TYPE;
	volCourant vol.ville_depart%TYPE:=volDepart;
BEGIN
     OPEN curseur3; 
		DBMS_OUTPUT.PUT_LINE('VOTRE ITENERAIRE:');
		FOR ligne IN curseur3 LOOP
			DBMS_OUTPUT.PUT_LINE('A partir de ' ||  ligne.volD ||
							  ' .');
			IF (ligne.ville_depart=volCourant) THEN
			DBMS_OUTPUT.PUT_LINE('A partir de ' || volD ||
							  ' vers' || volA ||
							  ' .');
			volCourant:=ligne.ville_arrivee;			
			END IF;
		END LOOP;

	 CLOSE curseur3; 
		DBMS_OUTPUT.PUT_LINE('FIN ITENERAIRE DU TOUR DU MONDE. BON VOYAGE!');
END;
/
execute tourMonde('Montreal');