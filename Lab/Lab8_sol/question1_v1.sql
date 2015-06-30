SET serveroutput ON;

CREATE OR REPLACE PROCEDURE ajouterVolAF1120 IS
		heure1  CHAR(5) := '21-40';      
		heure2  CHAR(5) := '23-10';     
		ville1  VARCHAR2(20) := 'Paris';      
		ville2  VARCHAR2(20) := 'Dublin'; 
	BEGIN      
		INSERT INTO Vol VALUES ('AF1120', heure1, heure2, ville1, ville2); 
		dbms_output.put_line('Enregistre :)');
	EXCEPTION
		WHEN no_data_found THEN
			dbms_output.put_line('Erreur de reference');
		WHEN OTHERS THEN
			dbms_output.put_line('Erreur inconnue');
	END; 
/

EXECUTE ajouterVolAF1120;

SELECT * 
FROM vol;