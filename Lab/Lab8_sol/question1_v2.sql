CREATE OR REPLACE PROCEDURE ajouterVol 
  (numvole vol.numvol%type,
   heureDepart vol.heure_depart%type,
   heureArrivee vol.heure_arrivee%type,
   villeDepart vol.ville_depart%type,
   villeArrivee vol.ville_depart%type) IS
BEGIN
  INSERT INTO vol VALUES (numvole, heureDepart, heureArrivee, villeDepart, villeArrivee);
  dbms_output.put_line('Enregistre');
EXCEPTION
  WHEN no_data_found THEN
    dbms_output.put_line('Erreur de reference');
  WHEN OTHERS THEN
    dbms_output.put_line('Erreur inconnue');
END;
/


EXECUTE ajouterVol('AF110','21-40','23-10','Paris','Dublin');


SELECT * 
FROM vol;