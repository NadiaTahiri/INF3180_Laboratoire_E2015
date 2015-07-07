CREATE OR REPLACE PROCEDURE connaitreIteneraire
(derniereEscale escale.numescale%TYPE) IS 
     numEscaleCourante escale.numescale%TYPE;
     escaleCourante escale.ville_escale%TYPE;
     dureeEscaleCourante escale.duree_escale%TYPE;
     prochaineDestination vol.ville_arrivee%TYPE;
     numeroVol vol.numvol%TYPE;
     heureDepart vol.heure_depart%TYPE;
     destinationFinale vol.ville_arrivee%TYPE := 'Paris';
BEGIN
     numEscaleCourante := 1;
     IF (derniereEscale > 8) THEN
          DBMS_OUTPUT.PUT_LINE('Au maximum 8 escales !');
     ELSIF (derniereEscale < 1) THEN
          DBMS_OUTPUT.PUT_LINE('Au minimum 1 escale !');
     ELSE
          LOOP
               SELECT ville_escale, duree_escale
                    INTO escaleCourante, dureeEscaleCourante
                    FROM escale;
               DBMS_OUTPUT.PUT_LINE('A partir de ' || escaleCourante ||
                              ' (durée' || dureeEscaleCourante ||
                              ' jours) prendre vol ');
               numEscaleCourante := numEscaleCourante + 1;
               EXIT WHEN (numEscaleCourante > derniereEscale);
          END LOOP;
     END IF;
END;

/



