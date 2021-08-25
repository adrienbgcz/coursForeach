
-- 1
CREATE TABLE artiste (
id serial PRIMARY KEY,
nom character varying(50) NOT NULL UNIQUE
);


CREATE TABLE disque (
id serial PRIMARY KEY,
titre character varying(100) NOT NULL UNIQUE,
annee integer,
id_artiste integer REFERENCES artiste
);


-- 2
INSERT INTO artiste (nom) VALUES ('Aurore Mozdzierz'), ('Jean-Philippe Vidal');


-- 3
INSERT INTO disque (titre, annee, id_artiste) 
VALUES ('Tourner les serviettes', 2000, 1),
	   ('C''est Chaud', 2001, 2),
	   ('Les Sardines', 2006, 2),
	   ('Les Sardines Remix', 2013, 1); 


-- 4
SELECT nom FROM artiste;

-- 5
SELECT titre FROM disque;

-- 6
SELECT titre FROM disque WHERE upper(titre) LIKE '%L%';


-- 7
SELECT titre FROM disque WHERE upper(titre) LIKE 'L%';

-- 8
SELECT titre FROM disque WHERE upper(titre) LIKE '%S';


-- 9
SELECT * FROM disque WHERE annee > 2000;


-- 10 
SELECT disque.titre, disque.annee, artiste.nom
FROM disque
LEFT JOIN artiste
ON disque.id_artiste = artiste.id;


-- 11 
SELECT disque.titre, disque.annee, artiste.nom
FROM disque
LEFT JOIN artiste
ON disque.id_artiste = artiste.id
WHERE upper(artiste.nom) LIKE '%A%';

---------------------------------------------------------------------------------------------

INSERT INTO artiste (nom) VALUES ('Fabrice');

UPDATE disque SET id_artiste = 3 WHERE id = 3;

ALTER TABLE artiste ADD COLUMN prenom character varying(30);


UPDATE artiste SET nom = 'Mozdzierz' WHERE id = 1;
UPDATE artiste SET nom = 'Vidal' WHERE id = 2;
UPDATE artiste SET nom = 'Claeys' WHERE id = 3;

UPDATE artiste SET prenom = 'Aurore' WHERE id = 1;
UPDATE artiste SET prenom = 'Jean-Philippe' WHERE id = 2;
UPDATE artiste SET prenom = 'Fabrice' WHERE id = 3;


ALTER TABLE artiste ADD COLUMN numero_pro character varying(10);

ALTER TABLE artiste ALTER COLUMN numero_pro TYPE integer;

INSERT INTO disque(titre, annee) VALUES ('Pour vu que ça dure', 2002);




