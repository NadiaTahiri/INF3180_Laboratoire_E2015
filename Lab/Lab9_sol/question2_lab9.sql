SET serveroutput ON;

CREATE OR REPLACE PROCEDURE conItenCurs
(derniereEscale escale.numescale%TYPE) IS 
	CURSOR curseur2 IS 
		SELECT ville_escale, duree_escale
		FROM escale WHERE numescale<=derniereEscale;
     numEscaleCourante escale.numescale%TYPE;
     escaleCourante escale.ville_escale%TYPE;
     dureeEscaleCourante escale.duree_escale%TYPE;
BEGIN
     OPEN curseur2; 
     IF (derniereEscale > 8) THEN
          DBMS_OUTPUT.PUT_LINE('Au maximum 8 escales !');
     ELSIF (derniereEscale < 1) THEN
          DBMS_OUTPUT.PUT_LINE('Au minimum 1 escale !');
     ELSE
		  DBMS_OUTPUT.PUT_LINE('VOTRE ITENERAIRE:');
		  LOOP 
			FETCH curseur2 INTO escaleCourante, dureeEscaleCourante; 
			EXIT WHEN (curseur2%NOTFOUND); 
			DBMS_OUTPUT.PUT_LINE('A partir de ' || escaleCourante ||
                              ' (duree' || dureeEscaleCourante ||
                              ' jours) prendre vol ');
		END LOOP; 
     END IF;
	 CLOSE curseur2; 
		DBMS_OUTPUT.PUT_LINE('FIN ITENERAIRE. BON VOYAGE!');
END;
/

EXECUTE conItenCurs(5);