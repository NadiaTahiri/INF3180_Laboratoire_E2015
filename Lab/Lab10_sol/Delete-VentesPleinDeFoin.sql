spool /home/votre_code_MS/INF3180/Drop-VentesPleinDeFoin-resultat.txt
set echo on

PROMPT Suppression des tables du schema VentesPleinDeFoin
DELETE FROM DetailLivraison
/
DELETE FROM Livraison
/
DELETE FROM LigneCommande
/
DELETE FROM Commande
/
DELETE FROM Client
/
DELETE FROM Article
/



set echo off
spool off
