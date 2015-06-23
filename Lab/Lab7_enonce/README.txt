
								LABORATOIRE 7
								
1) Vous devez créer des séquences (create sequence), pour chacune des tables.


2) Ensuite, vous devez modifier le script des insertions 
pour ajouter le numéro de séquence de façon adéquate(sequence.nextVal).


3) Puis, vous allez lister toutes les séquences 
(
//POUR MYSQL
SELECT * 
FROM information_schema.sequences 

ou  
//POUR ORACLE
select * from user_sequences;

).
Pour connaître toutes informations relatives pour chaque séquence desc user_sequences.


4) Enfin, vous allez supprimer  la dernière séquence  (drop sequence).

NB: .CURVAL
MINVALUE

