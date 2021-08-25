-- 0. creation de la table personne
CREATE TABLE personne (
    id serial PRIMARY KEY,
    prenom character varying(30) NOT NULL,
    nom character varying(30) NOT NULL,
    date_naissance date NOT NULL,
    ville character varying(30) NOT NULL
);

-- se creer en tant que personne, format de date attendu par le sql '2006-06-03'
INSERT INTO personne(prenom, nom, date_naissance, ville) 
	VALUES ('Aurore', 'Mozdzierz', '1984-07-01', 'Croix');
	
-- ********** ON PASSE LE SCRIPT D'INSERTION **********
INSERT INTO personne(prenom, nom, date_naissance, ville)
VALUES
('Allegra', 'French' ,'1982-05-22' ,'Faches'),
('Stuart' ,'William' ,'2015-07-06' ,'Roubaix'),
('Uriel', 'Taylor', '2015-05-18', 'Ronchin'),
('Heidi', 'Burnett', '1982-10-23', 'Wasquehal'),
('Olga', 'Meyers', '1978-08-26', 'Douai'),
('Barrett', 'Taylor', '1971-09-28', 'Wasquehal'),
('Hyacinth', 'Rose', '2001-04-08', 'Douai'),
('April', 'Dunn', '2008-08-06', 'Croix'),
('Neve', 'Madden', '1955-05-20', 'Valenciennes'),
('Emerson', 'Jensen', '2010-10-28', 'Faches'),
('Alexis', 'Nguyen', '1956-03-24', 'Lomme'),
('Giselle', 'Terry', '1958-12-17', 'Arras'),
('Warren', 'Melendez', '1988-11-10', 'Croix'),
('Dylan', 'Dorsey', '2007-02-24', 'Arras'),
('Arthur', 'Burks', '1979-09-09', 'Orchies'),
('McKenzie', 'Rivas', '1955-06-04', 'Faches'),
('Melodie', 'Alvarez', '1968-05-06', 'Douai'),
('Porter', 'Mann', '1980-10-06', 'Faches'),
('Amery', 'Nielsen', '1991-09-13', 'Roubaix'),
('Nora', 'Watkins', '1974-03-15', 'Arras'),
('Fredericka', 'Kent', '2015-09-15', 'Douai'),
('Julian', 'Nixon', '1972-01-10', 'Croix'),
('Macaulay', 'Summers', '1959-10-21', 'Douai'),
('Edan', 'Lara', '2005-04-28', 'Croix'),
('Basil', 'Brennan', '1969-12-30', 'Lille'),
('Zelenia', 'Molina', '1957-09-17', 'Ronchin'),
('Imani', 'Langley', '1969-01-08', 'Arras'),
('Lucian', 'Hernandez', '1980-08-15', 'Valenciennes'),
('Phelan', 'Sutton', '2015-12-29', 'Arras'),
('Fitzgerald', 'Casey', '1977-09-28', 'Wasquehal'),
('Hiroko', 'Logan', '1994-01-13', 'Arras'),
('Malik', 'Sullivan', '1994-01-07', 'Faches'),
('Ethan', 'Ayers', '1952-12-15', 'Lomme'),
('Abbot', 'Reilly', '1955-08-18', 'Tourcoing'),
('Randall', 'Riddle', '1976-06-17', 'Croix'),
('Dorothy', 'Blevins', '1978-01-08', 'Lomme'),
('Jillian', 'Rowe', '1982-12-05', 'Valenciennes'),
('Jarrod', 'Monroe', '1958-08-17', 'Orchies'),
('Deborah', 'Boone', '2011-12-24', 'Lomme'),
('Jada', 'Pennington', '2005-02-24', 'Roubaix'),
('Jessica', 'Franklin', '2007-06-08', 'Arras'),
('Ann', 'Conley', '1963-08-17', 'Tourcoing'),
('Chester', 'Gross', '1977-04-18', 'Douai'),
('Hedda', 'Flowers', '2012-05-13', 'Wasquehal'),
('Isaiah', 'Riley', '2006-06-07', 'Arras'),
('Timon', 'Gentry', '1978-09-10', 'Orchies'),
('Hedda', 'Lynn', '1956-05-08', 'Tourcoing'),
('Dexter', 'Elliott', '1993-06-14', 'Valenciennes'),
('Susan', 'Buckner', '1954-08-30', 'Tourcoing'),
('Garrison', 'Guzman', '1999-10-03', 'Orchies'),
('Timon', 'Wilkinson', '1962-09-12', 'Faches'),
('Mikayla', 'Solis', '1982-11-21', 'Roubaix'),
('Hamish', 'Vargas', '2012-02-26', 'Faches'),
('Halla', 'Head', '1952-11-13', 'Lomme'),
('Elizabeth', 'Tucker', '2009-11-26', 'Douai'),
('Kyla', 'Dawson', '1955-04-07', 'Arras'),
('Blossom', 'Bauer', '2003-02-27', 'Arras'),
('Maite', 'Sweeney', '1959-04-27', 'Lille'),
('Kerry', 'Hughes', '1968-06-18', 'Croix'),
('Angelica', 'Davidson', '2015-01-13', 'Douai'),
('Colt', 'Waller', '1988-04-26', 'Croix'),
('Darius', 'Herman', '1963-09-24', 'Orchies'),
('Christian', 'Slater', '2015-09-21', 'Wasquehal'),
('Fitzgerald', 'Nunez', '1975-10-07', 'Tourcoing'),
('Michael', 'Travis', '1964-05-14', 'Wasquehal'),
('Timothy', 'Lindsay', '1987-07-03', 'Croix'),
('Yasir', 'Callahan', '1961-05-29', 'Lille'),
('Jordan', 'Snyder', '1965-05-07', 'Lomme'),
('Justina', 'Franco', '1974-12-20', 'Tourcoing'),
('Keiko', 'Wiley', '1962-04-03', 'Valenciennes'),
('Bevis', 'Schmidt', '2002-07-01', 'Douai'),
('Phillip', 'Jacobson', '1998-08-07', 'Lomme'),
('Felicia', 'Benjamin', '2012-01-02', 'Lomme'),
('Tanner', 'Maynard', '2002-09-23', 'Arras'),
('Keith', 'Fuller', '1978-09-24', 'Ronchin'),
('Edward', 'Delacruz', '2017-07-30', 'Lomme'),
('Abigail', 'Kirk', '1993-10-31', 'Arras'),
('Cora', 'Witt', '2016-06-26', 'Douai'),
('Hedley', 'Sosa', '1980-04-10', 'Wasquehal'),
('Demetria', 'Vaughn', '1970-04-29', 'Douai'),
('Quin', 'Peters', '1982-08-23', 'Orchies'),
('Britanney', 'Bradshaw', '1955-03-16', 'Orchies'),
('Quinn', 'Malone', '2006-06-03', 'Roubaix'),
('Alea', 'Fisher', '2005-03-02', 'Wasquehal'),
('Juliet', 'Hale', '2003-06-04', 'Arras'),
('Harlan', 'Nash', '1970-03-16', 'Faches'),
('Beverly', 'Mclean', '1973-02-13', 'Ronchin'),
('Rama', 'Rosales', '2007-02-28', 'Croix'),
('Illana', 'Melendez', '1970-04-24', 'Arras'),
('Craig', 'Duran', '1977-12-06', 'Faches'),
('Quamar', 'Klein', '1980-10-11', 'Orchies'),
('Madeson', 'Stark', '1975-03-25', 'Faches'),
('Lamar', 'Goodman', '1999-02-27', 'Lomme'),
('Axel', 'Farrell', '1964-11-07', 'Arras'),
('Ulysses', 'Charles', '1976-12-29', 'Arras'),
('Fredericka', 'Blair', '1996-03-25', 'Roubaix'),
('Declan', 'Wolfe', '1984-07-01', 'Ronchin'),
('Jada', 'Mayo', '1977-04-16', 'Tourcoing'),
('Grady', 'Chaney', '1960-04-15', 'Valenciennes'),
('TaShya', 'Caldwell', '1982-03-30', 'Lille'); 


-- 1. lister tous les champs de la table personne
SELECT * FROM personne;


-- 2. lister les personne dont le prenom contient un y (minuscule uniquement)
SELECT * FROM personne WHERE prenom LIKE '%y%';

-- les compter
SELECT count(*) FROM personne WHERE prenom LIKE '%y%';


-- 3. lister les prenoms
SELECT prenom FROM personne;


-- 4. lister les prenoms sans les doublons
SELECT DISTINCT prenom FROM personne;

-- /!\ ça marche mais ça complexifie la requete alors que c'est le but du DISTINCT
SELECT prenom FROM personne GROUP BY prenom;

-- 5. compter le nombre de personne
SELECT count(*) FROM personne;

-- 6. lister les prenoms et pour chaque prénom, indiquez le nombre de personnes concernées
SELECT personne.prenom, count(*) as nombre_prenom FROM personne GROUP BY personne.prenom;

-- 6b. ordonné par nombre de personne du plus grand au plus petit
SELECT personne.prenom, count(*) as nombre_prenom 
	FROM personne 
	GROUP BY personne.prenom
	ORDER BY nombre_prenom DESC;


-- 6c. uniquement ceux dont le nombre de personne est superieur à 1 (/!\ nouveauté)
SELECT personne.prenom, count(*) as nombre_prenom 
	FROM personne 
	GROUP BY personne.prenom
	HAVING count(*) > 1
	ORDER BY nombre_prenom DESC;


-- 7. lister les personnes qui ont pour prenom Hedda
SELECT * FROM personne WHERE prenom = 'Hedda';

SELECT * FROM personne WHERE prenom = 'H%da';

SELECT * FROM personne;

SELECT DISTINCT ville FROM personne;

SELECT ville, count(*) FROM personne GROUP BY (ville);

-- creation de la table ville
CREATE TABLE ville (
	id serial PRIMARY KEY,
	nom character varying(30) NOT NULL
);

-- ********** SCRIPT INSERTION VILLE **********
INSERT INTO ville(nom) VALUES 
('Tourcoing'),
('Orchies'),
('Ronchin'),
('Croix'),
('Douai'),
('Wasquehal'),
('Roubaix'),
('Lille'),
('Faches'),
('Arras'),
('Valenciennes'),
('Lomme');

-- mettre a jour les personnes

-- Ajouter une colonne id_ville a la table personne avec une clé etrangere sur ville
ALTER TABLE personne ADD COLUMN id_ville integer REFERENCES ville;

-- ALTER TABLE personne ADD COLUMN id_ville integer;
-- ALTER TABLE personne ADD FOREIGN KEY(id_ville) REFERENCES ville;

SELECT * FROM personne;

-- inserer les bons id_ville en fonction de la table ville
SELECT * FROM personne WHERE ville = 'Tourcoing';
SELECT * FROM ville where id = 1;
UPDATE personne SET id_ville = 1 WHERE ville = 'Tourcoing';
SELECT * FROM personne WHERE ville = 'Orchies';
SELECT * FROM ville where id = 2;
UPDATE personne SET id_ville = 2 WHERE ville = 'Orchies';

SELECT id FROM personne WHERE ville = 'Ronchin';
SELECT * FROM ville where id = 3;
UPDATE personne set id_ville = 3 WHERE id IN (4, 27, 76, 88, 98);

SELECT id FROM personne WHERE ville = 'Croix';
SELECT * FROM ville where id = 4;
UPDATE personne set id_ville = 4 WHERE id IN (SELECT id FROM personne WHERE ville = 'Croix');

UPDATE personne SET id_ville = 5 WHERE ville = 'Douai';
UPDATE personne SET id_ville = 6 WHERE ville = 'Wasquehal';
UPDATE personne SET id_ville = 7 WHERE ville = 'Roubaix';
UPDATE personne SET id_ville = 8 WHERE ville = 'Lille';
UPDATE personne SET id_ville = 9 WHERE ville = 'Faches';
UPDATE personne SET id_ville = 10 WHERE ville = 'Arras';
UPDATE personne SET id_ville = 11 WHERE ville = 'Valenciennes';
UPDATE personne SET id_ville = 12 WHERE ville = 'Lomme';

-- verifier que tous les id_ville ont une valeur
SELECT * FROM personne WHERE id_ville IS NULL;
SELECT count(*) FROM personne WHERE id_ville IS NULL;

-- mettre la contrainte not null
ALTER TABLE personne ALTER COLUMN id_ville SET NOT NULL;

-- vérifier que les villes sont bien identiques
SELECT * FROM personne ORDER BY id;
UPDATE personne SET ville = 'Croi' WHERE id = 1;

SELECT personne.ville as nom_dans_personne, ville.nom as nom_dans_ville FROM personne
	JOIN ville ON personne.id_ville = ville.id
WHERE personne.ville <> ville.nom;

-- supprimer la colonne ville de la table personne
ALTER TABLE personne DROP COLUMN ville;

SELECT * FROM personne
	JOIN ville ON personne.id_ville = ville.id;


