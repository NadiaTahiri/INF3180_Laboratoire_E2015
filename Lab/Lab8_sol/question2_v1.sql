SET serveroutput ON;

CREATE OR REPLACE PROCEDURE connaitreIteneraire
(derniereEscale escale.numescale%TYPE) IS 
     numEscaleCourante escale.numescale%TYPE;
     escaleCourante escale.ville_escale%TYPE;
     dureeEscaleCourante escale.duree_escale%TYPE;
BEGIN
     numEscaleCourante := 1;
     IF (derniereEscale > 8) THEN
          DBMS_OUTPUT.PUT_LINE('Au maximum 8 escales !');
     ELSIF (derniereEscale < 1) THEN
          DBMS_OUTPUT.PUT_LINE('Au minimum 1 escale !');
     ELSE
		  DBMS_OUTPUT.PUT_LINE('VOTRE ITENERAIRE:');
          LOOP
               SELECT ville_escale, duree_escale
                    INTO escaleCourante, dureeEscaleCourante
                    FROM escale WHERE numescale = numEscaleCourante;
               DBMS_OUTPUT.PUT_LINE('A partir de ' || escaleCourante ||
                              ' (duree' || dureeEscaleCourante ||
                              ' jours) prendre vol ');
               numEscaleCourante := numEscaleCourante + 1;
               EXIT WHEN (numEscaleCourante > derniereEscale);
          END LOOP;
		  DBMS_OUTPUT.PUT_LINE('FIN ITENERAIRE. BON VOYAGE!');
     END IF;
END;
/

EXECUTE connaitreIteneraire(5);

