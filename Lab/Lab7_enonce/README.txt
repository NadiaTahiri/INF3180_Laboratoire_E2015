Vous devez créer des séquences (create sequence) pour chacune des tables et modifier le script des insertions pour ajouter le numéro de séquence de façon adéquate(sequence.nextVal).
Puis, vous allez lister toutes les séquences (SELECT * FROM information_schema.sequences ou select * from user_sequences).
Pour connaître toutes informations relatives pour chaque séquence (desc user_sequences).
Enfin vous allez supprimer  séquences (drop sequence).