-- 1. Afficher la liste des jeux avec le libellé audience
SELECT jeu.titre, audience.libelle 
FROM jeu 
	JOIN audience  ON audience.id = jeu.id_audience;

-- 2. Afficher la liste des jeux du 1. et ajouter les libellés des genres présents sur les jeux
SELECT jeu.titre, audience.libelle, genre.libelle
FROM genre_jeu 
	JOIN genre ON genre.id = genre_jeu.id_genre
	JOIN jeu ON jeu.id = genre_jeu.id_jeu
	JOIN audience  ON audience.id = jeu.id_audience;

-- 3. Afficher les pseudo des joueurs et leurs preferences de jeux (on affiche également les joueurs qui n'ont pas de preference)
SELECT utilisateur.pseudo, genre.libelle as preference 
FROM utilisateur
	LEFT JOIN genre_utilisateur ON utilisateur.id = genre_utilisateur.id_utilisateur
	LEFT JOIN genre ON genre_utilisateur.id_genre = genre.id;

-- 4. Afficher les genres de jeux et le nombre de jeux de chaque genre
SELECT genre.libelle, count(jeu.titre) as nom_jeu 
FROM genre_jeu
	JOIN genre ON genre.id = genre_jeu.id_genre
	JOIN jeu ON genre_jeu.id_jeu = jeu.id
GROUP BY genre.libelle;

SELECT genre.libelle, count(jeu.id) as nom_jeu 
FROM genre_jeu
	JOIN genre ON genre.id = genre_jeu.id_genre
	JOIN jeu ON genre_jeu.id_jeu = jeu.id
GROUP BY genre.libelle;

SELECT genre.libelle, count(genre.id) as nom_jeu 
FROM genre_jeu
	JOIN genre ON genre.id = genre_jeu.id_genre
	JOIN jeu ON genre_jeu.id_jeu = jeu.id
GROUP BY genre.libelle;

-- 5. Afficher les jeux tout public et enfant (titre jeux libelle audience)
SELECT jeu.titre, audience.libelle 
FROM jeu
	JOIN audience ON audience.id = jeu.id_audience
WHERE audience.id = 1 OR audience.id = 4
ORDER BY audience.libelle;

-- 5b. Afficher les jeux de genre action et horreur
SELECT jeu.titre, genre.libelle
FROM jeu
	JOIN genre_jeu ON genre_jeu.id_jeu = jeu.id
	JOIN genre ON genre_jeu.id_genre = genre.id
WHERE genre.id = 1 OR genre.id = 3;

SELECT jeu.titre, genre.libelle
FROM jeu
	JOIN genre_jeu ON genre_jeu.id_jeu = jeu.id
	JOIN genre ON genre_jeu.id_genre = genre.id
WHERE genre.id IN (1, 3);

-- 6. Afficher les suggestions de jeux suivant les genres préférés d'un joueur particulier
-- on sait recuperer les genre préféré d'un joueur
SELECT utilisateur.pseudo, genre.libelle as preference 
FROM utilisateur
	JOIN genre_utilisateur ON utilisateur.id = genre_utilisateur.id_utilisateur
	JOIN genre ON genre_utilisateur.id_genre = genre.id
WHERE utilisateur.id = 7;

-- on sait lister les jeu de genres particulier
SELECT jeu.titre, genre.libelle
FROM jeu
	JOIN genre_jeu ON genre_jeu.id_jeu = jeu.id
	JOIN genre ON genre_jeu.id_genre = genre.id
WHERE genre.id IN (1, 3);

-- on sait recuperer une liste id de genre préféré d'un personne
SELECT genre.id as preference 
FROM utilisateur
	JOIN genre_utilisateur ON utilisateur.id = genre_utilisateur.id_utilisateur
	JOIN genre ON genre_utilisateur.id_genre = genre.id
WHERE utilisateur.id = 4;

SELECT genre_utilisateur.id_genre as preference 
FROM utilisateur
	JOIN genre_utilisateur ON utilisateur.id = genre_utilisateur.id_utilisateur
WHERE utilisateur.id = 4;

-- grace aux requete imbriqué il est possible de combiner les 2 requetes
SELECT jeu.titre, genre.libelle
FROM jeu
	JOIN genre_jeu ON genre_jeu.id_jeu = jeu.id
	JOIN genre ON genre_jeu.id_genre = genre.id
WHERE genre.id IN (	SELECT genre.id as preference 
					FROM utilisateur
						JOIN genre_utilisateur ON utilisateur.id = genre_utilisateur.id_utilisateur
						JOIN genre ON genre_utilisateur.id_genre = genre.id
					WHERE utilisateur.id = 7
				  );
				  
SELECT jeu.titre, genre.libelle
FROM jeu
	JOIN genre_jeu ON genre_jeu.id_jeu = jeu.id
	JOIN genre ON genre_jeu.id_genre = genre.id
WHERE genre.id IN (	SELECT genre_utilisateur.id_genre as preference 
					FROM utilisateur
						JOIN genre_utilisateur ON utilisateur.id = genre_utilisateur.id_utilisateur
					WHERE utilisateur.id = 4
				  );


-- 6b. Afficher les suggestions de jeux suivant les types préférés d'un joueur et qui ne sont pas encore dans sa bibliotheque
INSERT INTO bibliotheque(date_achat, prix_achat, id_utilisateur, id_jeu) VALUES ('2021-01-05', 19, 4, 12);

SELECT jeu.titre, audience.libelle, genre.libelle
FROM genre_jeu 
	JOIN genre ON genre.id = genre_jeu.id_genre
	JOIN jeu ON jeu.id = genre_jeu.id_jeu
	JOIN audience  ON audience.id = jeu.id_audience
WHERE jeu.id= 12;

SELECT id_jeu FROM bibliotheque WHERE bibliotheque.id_utilisateur = 4;

SELECT jeu.titre, genre.libelle
FROM jeu
	JOIN genre_jeu ON genre_jeu.id_jeu = jeu.id
	JOIN genre ON genre_jeu.id_genre = genre.id
WHERE genre.id IN (
					SELECT genre_utilisateur.id_genre as preference 
					FROM utilisateur
						JOIN genre_utilisateur ON utilisateur.id = genre_utilisateur.id_utilisateur
					WHERE utilisateur.id = 4
					) 
	AND jeu.id NOT IN (
						SELECT id_jeu 
						FROM bibliotheque 
						WHERE bibliotheque.id_utilisateur = 4
	);
	
INSERT INTO bibliotheque(date_achat, prix_achat, id_utilisateur, id_jeu) VALUES ('2021-01-05', 10, 3, 1);

-- 7. Affiche la bibliotheque d'un joueur.
INSERT INTO bibliotheque(date_achat, prix_achat, id_utilisateur, id_jeu) VALUES ('2020-02-08', 30, 3, 11);
INSERT INTO bibliotheque(date_achat, prix_achat, id_utilisateur, id_jeu) VALUES ('2020-03-12', 25, 5, 10);
INSERT INTO bibliotheque(date_achat, prix_achat, id_utilisateur, id_jeu) VALUES ('2021-02-06', 15, 6, 9);
INSERT INTO bibliotheque(date_achat, prix_achat, id_utilisateur, id_jeu) VALUES ('2020-04-20', 25, 6, 6);
INSERT INTO bibliotheque(date_achat, prix_achat, id_utilisateur, id_jeu) VALUES ('2020-11-05', 15, 3, 2);
INSERT INTO bibliotheque(date_achat, prix_achat, id_utilisateur, id_jeu) VALUES ('2021-01-21', 15, 3, 8);

SELECT utilisateur.pseudo, jeu.titre, bibliotheque.date_achat, bibliotheque.prix_achat
FROM bibliotheque
	JOIN utilisateur ON utilisateur.id = bibliotheque.id_utilisateur
	JOIN jeu ON jeu.id = bibliotheque.id_jeu
WHERE bibliotheque.id_utilisateur = 3;

SELECT utilisateur.pseudo, jeu.titre, bibliotheque.date_achat, bibliotheque.prix_achat
FROM bibliotheque
	JOIN utilisateur ON utilisateur.id = bibliotheque.id_utilisateur
	JOIN jeu ON jeu.id = bibliotheque.id_jeu
WHERE utilisateur.id = 3;

-- 8. pour chaque joueur, on affiche le nombre de jeux de sa bibliotheque, le prix d'achat total de sa bibliotheque et le prix total actuel de sa bibliotheque
SELECT utilisateur.pseudo, jeu.titre, bibliotheque.date_achat, bibliotheque.prix_achat, jeu.prix
FROM bibliotheque
	JOIN utilisateur ON utilisateur.id = bibliotheque.id_utilisateur
	JOIN jeu ON jeu.id = bibliotheque.id_jeu

SELECT utilisateur.pseudo, count(jeu.titre) as nombre_jeu, sum(bibliotheque.prix_achat) as montant_bibliotheque, sum(jeu.prix) as montant_jeu
FROM bibliotheque
	JOIN utilisateur ON utilisateur.id = bibliotheque.id_utilisateur
	JOIN jeu ON jeu.id = bibliotheque.id_jeu
GROUP BY utilisateur.pseudo
ORDER BY utilisateur.pseudo;

SELECT utilisateur.pseudo, count(jeu.id) as nombre_jeu, sum(bibliotheque.prix_achat) as montant_bibliotheque, sum(jeu.prix) as montant_jeu
FROM utilisateur
	JOIN bibliotheque ON utilisateur.id = bibliotheque.id_utilisateur
		JOIN jeu ON jeu.id = bibliotheque.id_jeu
GROUP BY utilisateur.pseudo
ORDER BY utilisateur.pseudo;
	
-- 9.C'est les soldes, on souhaite mettre les jeux action, aventure, simulation et jeunesse à - 15%.
SELECT jeu.id, jeu.titre, jeu.prix, (jeu.prix * 0.85) as prix_solde 
FROM jeu
	JOIN genre_jeu ON genre_jeu.id_jeu = jeu.id
	JOIN genre ON genre.id = genre_jeu.id_genre
	JOIN audience ON jeu.id_audience = audience.id
WHERE genre.id IN (1, 2, 6) OR audience.id = 2;

SELECT jeu.id
FROM jeu
	JOIN genre_jeu ON genre_jeu.id_jeu = jeu.id
	JOIN genre ON genre.id = genre_jeu.id_genre
	JOIN audience ON jeu.id_audience = audience.id
WHERE genre.id IN (1, 2, 6) OR audience.id = 2;


UPDATE jeu SET prix = round((prix * 0.85)::numeric, 2) WHERE jeu.id IN (
													SELECT jeu.id
													FROM jeu
														JOIN genre_jeu ON genre_jeu.id_jeu = jeu.id
														JOIN genre ON genre.id = genre_jeu.id_genre
														JOIN audience ON jeu.id_audience = audience.id
													WHERE genre.id IN (1, 2, 6) OR audience.id = 2
													);

SELECT * FROM jeu

-- 10. pour chaque joueur, on affiche le nombre de jeux de sa bibliotheque, le prix d'achat total de sa bibliotheque et le prix total actuel de sa bibliotheque, et la difference de prix
SELECT 
	utilisateur.pseudo, 
	count(jeu.titre) as nombre_jeu, 
	sum(bibliotheque.prix_achat) as montant_bibliotheque, 
	sum(jeu.prix) as montant_jeu, 
	sum(round((jeu.prix - bibliotheque.prix_achat)::numeric, 2)) as difference
FROM bibliotheque
	JOIN utilisateur ON utilisateur.id = bibliotheque.id_utilisateur
	JOIN jeu ON jeu.id = bibliotheque.id_jeu
GROUP BY utilisateur.pseudo
ORDER BY utilisateur.pseudo;

SELECT 
	utilisateur.pseudo, 
	count(jeu.titre) as nombre_jeu, 
	sum(bibliotheque.prix_achat) as montant_bibliotheque, 
	sum(jeu.prix) as montant_jeu, 
	round(sum(jeu.prix - bibliotheque.prix_achat)::numeric, 2) as difference
FROM bibliotheque
	JOIN utilisateur ON utilisateur.id = bibliotheque.id_utilisateur
	JOIN jeu ON jeu.id = bibliotheque.id_jeu
GROUP BY utilisateur.pseudo
ORDER BY utilisateur.pseudo;

-- 11. Suite a des plaintes de troubles du comportement chez les jeunes, on ajoute un age minimum sur les public visés par les jeux
ALTER TABLE audience ADD COLUMN age_minimum integer; 

SELECT * FROM audience;

UPDATE audience SET age_minimum = 18 WHERE id = 3;
UPDATE audience SET age_minimum = 10 WHERE id IN (1, 2, 4);

-- 12. On affiche l'age minimum de chaque jeu
SELECT jeu.titre, audience.age_minimum
FROM jeu
	JOIN audience ON jeu.id_audience = audience.id;

-- 13. On affiche les utilisateurs ayant des jeux qui ne correspondent pas a leur age ainsi que le jeu correspondant.
INSERT INTO utilisateur (pseudo, email, date_naissance) VALUES('Adrien', 'adrien@adrien.fr', '2015-04-24');
INSERT INTO bibliotheque(date_achat, prix_achat, id_utilisateur, id_jeu) VALUES ('2020-05-24', 25, 13, 12);

-- affiche les utilisateurs et leur age
SELECT utilisateur.pseudo, date_part('YEAR', age(utilisateur.date_naissance)) as age
FROM utilisateur;

-- afficher les utilisateurs, leur jeu, leur age et l'age minimum des age -> affiche les bibliotheques
SELECT
	utilisateur.pseudo, 
	jeu.titre,  
	date_part('YEAR', age(utilisateur.date_naissance)) as age,
	audience.age_minimum
FROM bibliotheque
	JOIN utilisateur ON utilisateur.id = bibliotheque.id_utilisateur
	JOIN jeu ON jeu.id = bibliotheque.id_jeu
	JOIN audience ON audience.id = jeu.id_audience;
	
-- filtrer en fonction de l'age
SELECT
	utilisateur.pseudo, 
	jeu.titre,  
	date_part('YEAR', age(utilisateur.date_naissance)) as age,
	audience.age_minimum
FROM bibliotheque
	JOIN utilisateur ON utilisateur.id = bibliotheque.id_utilisateur
	JOIN jeu ON jeu.id = bibliotheque.id_jeu
	JOIN audience ON audience.id = jeu.id_audience
WHERE date_part('YEAR', age(utilisateur.date_naissance)) < audience.age_minimum;

-- 14 inserer les jeux 'fantasy zone', final Fight' et 'World of Final Fantasy Maxima'
INSERT INTO jeu (titre, date_disponible, prix, id_audience) VALUES ('Fantasy Zone', '2019-01-21', 24, 4);
INSERT INTO jeu (titre, date_disponible, prix, id_audience) VALUES ('Final Fight', '2018-04-28', 18, 3);
INSERT INTO jeu (titre, date_disponible, prix, id_audience) VALUES ('World of Final Fantasy Maxima', '2020-10-03', 35, 4);

-- 15. En tant que fan de la série 'Final Fantasy', je souhaite reuperer les jeux, trié par date de sortie et qui dans leur nom:
--   a. contiennent 'final fantasy'
SELECT * FROM jeu 
WHERE lower(jeu.titre) LIKE '%final fantasy%'
ORDER BY jeu.date_disponible;

SELECT * FROM jeu 
WHERE jeu.titre LIKE '%final fantasy%'
ORDER BY jeu.date_disponible;

--   b. commencent par 'final fantasy'
SELECT jeu.titre, jeu.date_disponible
FROM jeu
WHERE lower(jeu.titre) LIKE 'final fantasy%'
ORDER BY jeu.date_disponible;

--   c. contiennent 'final' et 'fantasy'
SELECT jeu.titre, jeu.date_disponible
FROM jeu
WHERE lower(jeu.titre) LIKE '%final%' 
	AND lower(jeu.titre) LIKE '%fantasy%'
ORDER BY jeu.date_disponible;

--   d contiennent 'final' ou 'fantasy'
SELECT jeu.titre, jeu.date_disponible
FROM jeu
WHERE lower(jeu.titre) LIKE '%final%' 
	OR lower(jeu.titre) LIKE '%fantasy%'
ORDER BY jeu.date_disponible;

-- 16. rechercher les jeux present dans les bibliotheques qui ont été acheté a un prix supérieur au prix actuel. on affiche egalement le speudo du joueur a qui appartient le jeu
SELECT 
	jeu.titre, 
	jeu.prix as prix_actuel,
	bibliotheque.prix_achat as prix_achat,
	utilisateur.pseudo as proprietaire
FROM jeu
	JOIN bibliotheque ON bibliotheque.id_jeu = jeu.id
	JOIN utilisateur ON utilisateur.id = bibliotheque.id_utilisateur
WHERE jeu.prix < bibliotheque.prix_achat;

-- 17. on souhaite gerer une colonne "desactive" sur les utilisateurs, qui sera a false par defaut.
ALTER TABLE utilisateur ADD COLUMN desactive boolean DEFAULT false NOT NULL;

SELECT * FROM utilisateur;

INSERT INTO utilisateur (pseudo, email, date_naissance) VALUES('Pierre', 'pierre@pierre.fr', '2010-04-24');
INSERT INTO bibliotheque(date_achat, prix_achat, id_utilisateur, id_jeu) VALUES ('2020-05-24', 25, 15, 12);

-- 18. On souhaite afficher uniquement les utilisateurs qui sont ne sont pas desactivé.
SELECT utilisateur.pseudo, utilisateur.desactive
FROM utilisateur
WHERE utilisateur.desactive = false;

UPDATE utilisateur SET desactive = true WHERE id = 14 ;

-- 19. Suite a une plainte RGPD, on souhaite supprimer les données des joueurs "desactivé".
-- a. Afficher les joueurs inactif
DELETE FROM utilisateur WHERE id = 14;

INSERT INTO utilisateur (pseudo, email, date_naissance) VALUES('Pierre', 'pierre@pierre.fr', '2010-04-24');
INSERT INTO bibliotheque(date_achat, prix_achat, id_utilisateur, id_jeu) VALUES ('2020-05-24', 25, 15, 12);

SELECT * FROM utilisateur;
SELECT * FROM bibliotheque WHERE id_utilisateur = 15;

DELETE FROM utilisateur WHERE id = 15;

CREATE TABLE toto (
	id serial PRIMARY KEY,
	id_utilisateur integer REFERENCES utilisateur ON DELETE CASCADE
	);

INSERT INTO toto(id_utilisateur) VALUES (15);

SELECT * FROM toto

DELETE FROM utilisateur WHERE id = 15;

SELECT * FROM toto;

-- b. on affiche la bibliotheque d'un des joueurs inactif pour voir ces jeux
SELECT * FROM bibliotheque WHERE id_utilisateur = 15;
