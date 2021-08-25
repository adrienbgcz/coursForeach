-- 1. creation des différentes tables
CREATE TABLE artiste (
	id serial PRIMARY KEY,
	nom character varying(30) NOT NULL	
);

CREATE TABLE disque (
	id serial PRIMARY KEY,
	titre character varying(100) NOT NULL,
	annee integer,
	id_artiste integer REFERENCES artiste
);

-- CREATE TABLE disque2 (
-- 	id serial PRIMARY KEY,
-- 	titre character varying(100) NOT NULL,
-- 	annee character varying(4),
-- 	id_artiste integer REFERENCES artiste
-- );
-- ALTER TABLE disque2 ALTER COLUMN annee type integer USING annee::integer;
-- DROP TABLE disque2;

-- 2. inserer 2 artistes
INSERT INTO artiste (nom) VALUES ('Aurore Mozdzierz'), ('Jean-Philippe Vidal'), ('Adele'), ('Blur'), ('Gorillaz'), ('The beatles');
-- 3. inserer 4 disques
INSERT INTO disque (titre, annee, id_artiste) VALUES 
	('Tourner les serviettes', 2000, 1),
	('C''est Chaud', 2001, 2),
	('Les Sardines', 2006, 2),
	('Les Sardines Remix', 2013, 1);
	   
INSERT INTO disque (titre, annee, id_artiste) VALUES
	('Parklife', 1994, 4),
	('Leisure', 1998, 4),
	('Demon Days', 2005, 5),
	('Plastic Beach', 2001, 5);

INSERT INTO disque (titre, annee, id_artiste) VALUES
	('let it be', 1970, 6),
	('Someone like you', 2011, 3),
	('Yesterday', 1965, 6),
	('Skyfall', 2012, 3);

-- 4. lister les artistes
SELECT * FROM artiste;
SELECT nom FROM artiste;

-- 5. lister les disques
SELECT * FROM disque;
SELECT titre, annee FROM disque;

-- 6. lister les disques contenant une lettre particulière(majuscule ou minuscule, quelque soit l’endroit dans le titre)
SELECT titre, annee 
	FROM disque
	WHERE upper(titre) LIKE '%D%';
	
SELECT titre, annee 
	FROM disque
	WHERE titre LIKE '%D%' OR titre LIKE '%d%';	

-- 7. lister les disques dont le nom commence parune certaine lettre
SELECT titre, annee 
	FROM disque
	WHERE titre LIKE 'D%' OR titre LIKE 'd%';
	
SELECT titre, annee 
	FROM disque
	WHERE upper(titre) LIKE 'D%';
-- 8. lister les disques dont le nom se termine parune certaine lettre
SELECT titre, annee 
	FROM disque
	WHERE upper(titre) LIKE '%D';
	
SELECT titre, annee 
	FROM disque
	WHERE titre LIKE '%D' OR titre LIKE '%d';	
	
-- 9. lister les disques dont l’année est supérieure à une certaine année
SELECT titre, annee 
	FROM disque
	WHERE annee > 2000;

-- entre 2000 et 2005
SELECT titre, annee 
	FROM disque
	WHERE annee > 2000 AND annee < 2005;

-- 10. lister les disques avec le nom des artistes
SELECT *
	FROM disque
	JOIN artiste ON disque.id_artiste = artiste.id;

SELECT disque.titre, disque.annee, artiste.nom
	FROM disque
		JOIN artiste ON disque.id_artiste = artiste.id;
	
-- 11. lister les disques dont le nom de l’artiste contient une lettre particulière
SELECT disque.titre, disque.annee, artiste.nom
	FROM disque
		JOIN artiste ON disque.id_artiste = artiste.id
	WHERE upper(artiste.nom) LIKE '%U%';

-- 12. Créer la table correspondante
CREATE TABLE maison (
	id serial PRIMARY KEY,
	nom character varying(30) NOT NULL	
);

-- 13. inserer 4 labels
INSERT INTO maison(nom) VALUES
('Modulor'),
('Murdoc'),
('Columbia'),
('Innovative'),
('Apple records'),
('XL recording'),
('Columbia records'),
('Universal Music Group');

-- 14. lister les labels
SELECT * FROM maison;

-- 15. Mettez a jour la structure de la table disque pour gérer le label
ALTER TABLE disque ADD COLUMN id_maison integer REFERENCES maison;

SELECT * FROM disque;

-- 16. ajouter des labels sur certains de vos disques
UPDATE disque SET id_maison = 1 WHERE id = 1;
UPDATE disque SET id_maison = 2 WHERE id IN (2,3);
UPDATE disque SET id_maison = 4 WHERE id = 5;
UPDATE disque SET id_maison = 5 WHERE id IN (6, 7, 8);
UPDATE disque SET id_maison = 6 WHERE id = 10;
UPDATE disque SET id_maison = 8 WHERE id = 12;

SELECT * FROM disque;

-- 17 lister les disques avec les libelles des labels.
SELECT disque.titre, disque.annee, maison.nom as maison
	FROM disque
		JOIN maison ON disque.id_maison = maison.id;

-- 17a. on souhaite voir uniquement les disques avecdes labels
SELECT disque.titre, disque.annee, maison.nom as maison
	FROM disque
		INNER JOIN maison ON disque.id_maison = maison.id;
		
-- 17b. on souhaite voir les disques ne possédant pas de label également
SELECT disque.titre, disque.annee, maison.nom as maison
	FROM disque
		LEFT JOIN maison ON disque.id_maison = maison.id;

-- uniquement les disques sans label
SELECT disque.titre, disque.annee
	FROM disque
	WHERE id_maison IS NULL;
	
-- uniquement les disques avec label (sans besoin du nom du label)
SELECT disque.titre, disque.annee
	FROM disque
	WHERE id_maison IS NOT NULL;
	
-- 18. lister les disques avec le nom des artisteset le nom des labels
SELECT disque.titre, disque.annee, artiste.nom as artiste, maison.nom as maison
	FROM disque
		JOIN artiste ON disque.id_artiste = artiste.id
		JOIN maison ON disque.id_maison = maison.id;
	

	
SELECT * FROM maison;

UPDATE maison SET nom = 'Universal Murdoc' WHERE id =2;
	
-- il est possible de faire plusieurs jointures dansune requête, pour cela
-- SELECT * FROM table1--JOIN table2 ON ... = ...
-- JOIN table3 ON ... = ..