






CREATE TABLE genre (
id serial PRIMARY KEY,
libelle character varying (30) NOT NULL
);

CREATE TABLE audience (
id serial PRIMARY KEY,
libelle character varying (30) NOT NULL
);





CREATE TABLE utilisateur (
id serial PRIMARY KEY,
email character varying (50) NOT NULL UNIQUE,
date_naissance date NOT NULL,
pseudo character varying (20) NOT NULL UNIQUE
);


CREATE TABLE genre_utilisateur (
id serial PRIMARY KEY,
id_utilisateur integer REFERENCES utilisateur NOT NULL ,
id_genre integer REFERENCES genre NOT NULL 
);





CREATE TABLE jeu (
id serial PRIMARY KEY,
titre character varying (40) NOT NULL,
description character varying (250),
date_disponible date NOT NULL,
resume character varying (100),
prix double precision CONSTRAINT prix_positif CHECK (prix > 0),
id_audience integer REFERENCES audience NOT NULL
);


CREATE TABLE genre_jeu (
id serial PRIMARY KEY,
id_genre integer REFERENCES genre NOT NULL,
id_jeu integer REFERENCES jeu NOT NULL
);


CREATE TABLE bibliotheque (
id serial PRIMARY KEY,
date_achat date NOT NULL,
prix_achat double precision CONSTRAINT prix_achat_positif CHECK (prix_achat > 0) NOT NULL,
note integer NOT NULL,
id_utilisateur integer REFERENCES utilisateur NOT NULL ,
id_jeu integer REFERENCES jeu NOT NULL 
);



-- 1. Afficher la liste des jeux avec le libelle audiance

SELECT jeu.titre, audience.libelle FROM jeu
JOIN audience ON jeu.id_audience = audience.id;


-- 2. Afficher la liste des jeux du 1. et ajouter les libellés des genres présents sur les jeux
SELECT jeu.titre, audience.libelle, genre.libelle FROM jeu
JOIN audience ON jeu.id_audience = audience.id
JOIN genre_jeu ON jeu.id = genre_jeu.id_jeu
JOIN genre ON genre_jeu.id_genre = genre.id




-- 3. Afficher les pseudo des joueurs et leurs preferences de jeux (on affiche également les joueurs qui n'ont pas de preference)
SELECT utilisateur.pseudo, genre.libelle as preference FROM utilisateur
LEFT JOIN genre_utilisateur ON utilisateur.id = genre_utilisateur.id_utilisateur
LEFT JOIN genre ON genre_utilisateur.id_genre = genre.id





-- 4. Afficher les genres de jeux et le nombre de jeux de chaque genre

SELECT genre.libelle, count(genre.id) FROM genre
JOIN genre_jeu ON genre.id = genre_jeu.id_genre
JOIN jeu ON genre_jeu.id_jeu = jeu.id
GROUP BY genre.libelle;




-- 5. Afficher les jeux tout public et enfant (titre jeux libelle audience)
SELECT jeu.titre, audience.libelle FROM jeu
JOIN audience ON jeu.id_audience = audience.id
WHERE audience.id = 1 OR audience.id = 4;





-- 5b. Afficher les jeux de genre action et horreur
SELECT jeu.titre, genre.libelle FROM jeu
JOIN genre_jeu ON genre_jeu.id_jeu = jeu.id
JOIN genre ON genre_jeu.id_genre = genre.id
WHERE genre.id = 1 OR genre.id = 3;




-- 6. Afficher les suggestions de jeux suivant les genres préférés d'un joueur particulier



-- SELECT jeu.titre, genre.libelle FROM jeu 
-- JOIN genre_jeu ON jeu.id = genre_jeu.id_jeu
-- JOIN genre ON genre_jeu.id_genre = genre.id
-- JOIN bibliotheque ON bibliotheque.id_jeu = jeu.id
-- JOIN genre_utilisateur ON bibliotheque.id_utilisateur = genre_utilisateur.id_utilisateur
-- JOIN utilisateur ON genre_utilisateur.id_utilisateur = utilisateur.id
-- WHERE utilisateur.id = 3

SELECT jeu.titre, genre.libelle FROM jeu
	JOIN genre_jeu ON genre_jeu.id_jeu = jeu.id
	JOIN genre ON genre_jeu.id_genre = genre.id
WHERE genre.id IN (	SELECT genre_utilisateur.id_genre as preference
					FROM utilisateur
						JOIN genre_utilisateur ON utilisateur.id = genre_utilisateur.id_utilisateur
					WHERE utilisateur.id = 4
				  );







-- 6b. Afficher les suggestions de jeux suivant les types préférés d'un joueur et qui ne sont pas encore dans sa bibliotheque
INSERT INTO bibliotheque(date_achat, prix_achat, id_utilisateur, id_jeu) VALUES ('2021-01-05', 19, 4, 12);

SELECT jeu.titre, genre.libelle FROM jeu
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



-- INSERT INTO bibliotheque(date_achat, prix_achat, id_utilisateur, id_jeu) VALUES ('2021-01-05', 19, 4, 12)
INSERT INTO bibliotheque(date_achat, prix_achat, id_utilisateur, id_jeu) VALUES ('2020-04-20', 25, 6, 16)
INSERT INTO bibliotheque(date_achat, prix_achat, id_utilisateur, id_jeu) VALUES ('2020-11-05', 15, 3, 12)
INSERT INTO bibliotheque(date_achat, prix_achat, id_utilisateur, id_jeu) VALUES ('2021-01-21', 15, 3, 18)







-- 7. Affiche la bibliotheque d'un joueur.


SELECT utilisateur.pseudo, jeu.titre FROM bibliotheque
JOIN utilisateur ON bibliotheque.id_utilisateur = utilisateur.id
JOIN jeu ON bibliotheque.id_jeu = jeu.id
WHERE utilisateur.id = 3




-- 8. pour chaque joueur, on affiche le nombre de jeux de sa bibliotheque, le prix d'achat total de sa bibliotheque et le prix total actuel de sa bibliotheque
SELECT utilisateur.pseudo, count(jeu.id) as nombre_de_jeu, sum(bibliotheque.prix_achat) as prix_achat, sum(jeu.prix) as prix_total  FROM utilisateur
JOIN bibliotheque ON utilisateur.id = bibliotheque.id_utilisateur
JOIN jeu ON bibliotheque.id_jeu = jeu.id
GROUP BY utilisateur.pseudo
ORDER BY utilisateur.pseudo






-- 9.C'est les soldes, on souhaite mettre les jeux action, aventure, simulation et jeunesse à - 15%.

SELECT jeu.titre, jeu.prix, jeu.prix * 0.85 as prix_solde FROM jeu 
JOIN genre_jeu ON genre_jeu.id_jeu = jeu.id
JOIN genre ON genre_jeu.id_genre = genre.id
JOIN audience ON jeu.id_audience = audience.id
WHERE genre.id IN (1,2,6) OR audience.id = 2


-- Si on veut réellement updater la base
UPDATE jeu SET prix = round((prix * 0.85)::numeric, 2) WHERE jeu.id IN (
													SELECT jeu.id
													FROM jeu
														JOIN genre_jeu ON genre_jeu.id_jeu = jeu.id
														JOIN genre ON genre.id = genre_jeu.id_genre
														JOIN audience ON jeu.id_audience = audience.id
													WHERE genre.id IN (1, 2, 6) OR audience.id = 2
													);




-- 10. pour chaque joueur, on affiche le nombre de jeux de sa bibliotheque, le prix d'achat total de sa bibliotheque et le prix total actuel de sa bibliotheque, et la difference de prix
SELECT utilisateur.pseudo, count(jeu.id) as nombre_de_jeu, sum(bibliotheque.prix_achat) as prix_achat_total, sum(jeu.prix) as prix_total_actuel, 
sum(jeu.prix * 0.85) as prix_solde, round(sum(jeu.prix - jeu.prix * 0.85)::numeric,2) as difference_prix
FROM utilisateur
JOIN bibliotheque ON utilisateur.id = bibliotheque.id_utilisateur
JOIN jeu ON bibliotheque.id_jeu = jeu.id
GROUP BY utilisateur.pseudo



-- 11. Suite a des plaintes de troubles du comportement chez les jeunes, on ajoute un age minimum sur les public visés par les jeux
-- on appellera la colonne 'age_min' (modifié) 
-- 10 ans pour enfant, jeunesse et tout publi
-- 18 pour adulte
ALTER TABLE audience ADD COLUMN age_min integer;
SELECT * FROM audience


UPDATE audience SET age_min = 10 WHERE id IN (1, 2, 4);
UPDATE audience SET age_min = 18 WHERE id = 3;




-- 12. On affiche l'age minimum de chaque jeu
SELECT jeu.titre, audience.age_min FROM jeu
JOIN audience ON jeu.id_audience = audience.id;






-- 13. On affiche les joueurs ayant des jeux qui ne correspondent pas a leur age ainsi que le jeu correspondant.

SELECT utilisateur.pseudo, jeu.titre, utilisateur.date_naissance, date_part('year', age(utilisateur.date_naissance)) as age FROM bibliotheque 
JOIN utilisateur ON bibliotheque.id_utilisateur = utilisateur.id
JOIN jeu ON bibliotheque.id_jeu = jeu.id
JOIN audience ON jeu.id_audience = audience.id
WHERE date_part('year', age(utilisateur.date_naissance)) < audience.age_min;

INSERT INTO utilisateur (pseudo, email, date_naissance) VALUES('Adrien', 'adrien@adrien.fr', '2015-04-24');
INSERT INTO bibliotheque(date_achat, prix_achat, id_utilisateur, id_jeu) VALUES ('2020-05-24', 25, 10, 16);


SELECT * FROM utilisateur
SELECT * FROM bibliotheque
SELECT * FROM jeu
SELECT * FROM genre
SELECT * FROM genre_jeu


-- 14 inserer les jeux 'fantasy zone', final Fight' et 'World of Final Fantasy Maxima'
INSERT INTO jeu (titre, date_disponible, prix, id_audience) VALUES ('Fantasy Zone', '2019-01-21', 24, 4);
INSERT INTO jeu (titre, date_disponible, prix, id_audience) VALUES ('Final Fight', '2018-04-28', 18, 3);
INSERT INTO jeu (titre, date_disponible, prix, id_audience) VALUES ('World of Final Fantasy Maxima', '2020-10-03', 35, 4);






-- 15. En tant que fan de la série 'Final Fantasy', je souhaite reuperer les jeux, trié par date de sortie et qui dans leur nom:
--   a. contiennent 'final fantasy'
--   b. commencent par 'final fantasy'
--   c. contiennent 'final' et 'fantasy'
--   d contiennent 'final' ou 'fantasy'
SELECT jeu.titre, jeu.date_disponible FROM jeu WHERE lower(jeu.titre) LIKE '%final fantasy%';
SELECT jeu.titre, jeu.date_disponible FROM jeu WHERE lower(jeu.titre) LIKE 'final fantasy%';
SELECT jeu.titre, jeu.date_disponible FROM jeu WHERE lower(jeu.titre) LIKE '%final%' AND lower(jeu.titre) LIKE '%fantasy%';
SELECT jeu.titre, jeu.date_disponible FROM jeu WHERE lower(jeu.titre) LIKE '%final%' OR lower(jeu.titre) LIKE '%fantasy%';
ORDER BY jeu.date_disponible




-- 16. rechercher les jeux present dans les bibliotheques qui ont été acheté a un prix supperieur au prix actuel. on affiche egalement le speudo du joueur a qui appartient le jeu
SELECT jeu.titre, jeu.prix as prix_actuel, bibliotheque.prix_achat as prix_achat, utilisateur.pseudo as proprietaire FROM jeu
JOIN bibliotheque ON jeu.id = bibliotheque.id_jeu
JOIN utilisateur ON bibliotheque.id_utilisateur = utilisateur.id
WHERE jeu.prix < bibliotheque.prix_achat





-- 17. on souhaite gerer une colonne "desactive" sur les joueurs, qui sera a false par defaut.

ALTER TABLE utilisateur ADD COLUMN desactive boolean DEFAULT false NOT NULL; -- on est pas obligé de préciser la valeur de desactive avec un default sur la colonne





-- 18. On souhaite afficher uniquement les joueurs qui sont actif.

SELECT * FROM utilisateur WHERE desactive = false;





-- 19. Suite a une plainte RGPD, on souhaite supprimer les données des joueurs "desactivé".
-- a. Afficher les joueurs inactif
-- b. on affiche la bibliotheque d'un des joueurs inactif pour voir ces jeux
UPDATE utilisateur SET desactive = true WHERE id = 10;

SELECT * FROM utilisateur WHERE desactive = true;

SELECT utilisateur.pseudo, jeu.titre FROM bibliotheque
JOIN utilisateur ON bibliotheque.id_utilisateur = utilisateur.id
JOIN jeu ON bibliotheque.id_jeu = jeu.id
WHERE utilisateur.id = 3;







DELETE ON CASCADE FROM utilisateur WHERE id = 15; -- a condition d'avoir prévu cascade dans les contraintes 

CREATE table toto (
id serial PRIMARY KEY,
id_utilisateur integer REFERENCES utilisateur ON DELETE CASCADE
);
INSERT INTO toto(id_utilisateur) VALUES (15);






























