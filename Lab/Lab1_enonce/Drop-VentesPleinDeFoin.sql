spool /home/votre_code_MS/INF3180/Drop-VentesPleinDeFoin-resultat.txt
set echo on

PROMPT Suppression des tables du schema VentesPleinDeFoin
DROP TABLE DetailLivraison
/
DROP TABLE Livraison
/
DROP TABLE LigneCommande
/
DROP TABLE Commande
/
DROP TABLE Client
/
DROP TABLE Article
/



set echo off
spool off
