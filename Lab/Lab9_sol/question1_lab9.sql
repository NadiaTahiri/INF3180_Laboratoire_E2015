SET serveroutput ON;

CREATE OR REPLACE PROCEDURE moySalaire IS
	CURSOR curseur1 IS 
		SELECT salaire 
		FROM pilote 
		WHERE (age >= 30 AND age <=40); 
	salairePilote  Pilote.salaire%TYPE; 
	sommeSalaires  NUMBER(11,2) := 0; 
	moyenneSalaires  NUMBER(11,2); 
	BEGIN 
		OPEN curseur1; 
		LOOP 
			FETCH curseur1 INTO salairePilote; 
			EXIT WHEN (curseur1%NOTFOUND); 
			sommeSalaires := sommeSalaires + salairePilote; 
		END LOOP; 
		moyenneSalaires := sommeSalaires / curseur1%ROWCOUNT; 
		CLOSE curseur1; 
		DBMS_OUTPUT.PUT_LINE('Moyenne salaires (pilotes de 30 a 40 ans) : ' ||  
		  moyenneSalaires); 
	END;
/
execute moySalaire;