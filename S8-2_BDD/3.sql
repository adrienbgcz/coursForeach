CREATE TABLE titre (
	id serial PRIMARY KEY,
	libelle character varying(30) NOT NULL
);

INSERT INTO titre(libelle) VALUES ('Developpeur Web et Web Mobile'), ('Concepteur d''Application');

SELECT * FROM titre;

SELECT * FROM formation;

ALTER TABLE formation ADD COLUMN id_titre integer REFERENCES titre;

SELECT * FROM formation;

UPDATE formation SET id_titre = 1 WHERE id IN (1, 5);
UPDATE formation SET id_titre = 2 WHERE id = 6;

ALTER TABLE formation DROP COLUMN titre_professionnel;

SELECT formation.nom, formation.duree, titre.libelle 
FROM formation
	JOIN titre ON formation.id_titre = titre.id;
	
INSERT INTO titre(libelle) VALUES ('Toto');

SELECT formation.nom, formation.duree, titre.libelle 
FROM formation
	INNER JOIN titre ON formation.id_titre = titre.id;
	
SELECT formation.nom, formation.duree, titre.libelle 
FROM formation
	LEFT JOIN titre ON formation.id_titre = titre.id;
	
SELECT formation.nom, formation.duree, titre.libelle 
FROM formation
	RIGHT JOIN titre ON formation.id_titre = titre.id;
	
SELECT formation.nom, formation.duree, titre.libelle 
FROM formation
	FULL JOIN titre ON formation.id_titre = titre.id;

-- *************************************

SELECT formation.nom, formation.duree, titre.libelle 
FROM titre
	INNER JOIN formation ON formation.id_titre = titre.id;
	
SELECT formation.nom, formation.duree, titre.libelle 
FROM titre
	LEFT JOIN formation ON formation.id_titre = titre.id;
	
-- ***************************************

SELECT formation.nom, formation.duree, titre.libelle 
FROM formation
	JOIN titre ON formation.id_titre = titre.id
WHERE id_titre = 1;

-- ********************

CREATE TABLE formation (
	id serial PRIMARY KEY,
	nom character varying(30) NOT NULL UNIQUE,
	id_titre integer REFERENCES titre
);

CREATE TABLE formation (
	id serial PRIMARY KEY,
	nom character varying(30) NOT NULL UNIQUE,
	id_titre integer,
	FOREIGN KEY (id_titre) REFERENCES titre
);

INSERT INTO formation (nom, id_titre, duree) VALUES
	('Toto', 10, 840);



ALTER TABLE dispose
DROP CONSTRAINT dispose_id_logement_fkey
ALTER TABLE dispose
ADD CONSTRAINT dispose_id_logement_fkey
   FOREIGN KEY (id_logement)
   REFERENCES logement
   ON DELETE CASCADE

