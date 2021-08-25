CREATE TABLE etudiant (
	id serial,
	nom character varying(30) NOT NULL,
	prenom character varying(30)
);

DROP TABLE etudiant;

CREATE TABLE etudiant (
	id serial PRIMARY KEY,
	nom character varying(30) NOT NULL,
	prenom character varying(30)
);

CREATE TABLE etudiant (
	id serial,
	nom character varying(30) NOT NULL,
	prenom character varying(30),
	PRIMARY KEY(id)
);

ALTER TABLE etudiant ADD COLUMN numero integer NOT NULL;

ALTER TABLE etudiant ADD CONSTRAINT numero_unique UNIQUE(numero);

INSERT INTO etudiant(nom, prenom, numero) VALUES ('Doe', 'John', 123456);

INSERT INTO etudiant(nom, prenom, numero) VALUES ('Doe', 'Jane', 456789);
INSERT INTO etudiant(nom, prenom, numero) VALUES ('Bogacz', 'Adrien', 859639);


INSERT INTO etudiant(nom, prenom, numero) VALUES 
	('Herlemont' ,'Pierre', 124567),
	('Errachidi', 'Houda', 987654);
	
INSERT INTO etudiant (nom, prenom, numero) VALUES ('Miche', 'Paul', 111114);

INSERT INTO etudiant (nom, numero) VALUES ('Paul', 111115);

INSERT INTO etudiant (nom, prenom) VALUES ('Doe', 'Paul');

SELECT * FROM etudiant;
SELECT nom, prenom, numero FROM etudiant;
SELECT nom FROM etudiant;
SELECT DISTINCT nom FROM etudiant;

-- SELECT <quoi>
-- FROM <d'ou>
-- WHERE <condition>

SELECT * FROM etudiant WHERE nom = 'Miche';
SELECT * FROM etudiant WHERE nom <> 'Miche';
SELECT * FROM etudiant WHERE prenom LIKE 'M%';

SELECT * 
FROM etudiant 
WHERE 
	prenom LIKE '%a%'
	OR prenom LIKE '%A%';
	
INSERT INTO etudiant (nom, prenom, numero) VALUES ('Miche', 'Anna', 111116);

SELECT * 
FROM etudiant 
WHERE 
	prenom LIKE '%a%'
	AND prenom LIKE '%A%';
	
SELECT * 
FROM etudiant 
WHERE 
	prenom LIKE '%a%'
	AND nom = 'Miche';
	
SELECT * 
FROM etudiant 
WHERE 
	numero <= 123456;
	

UPDATE etudiant SET prenom = 'Jean' WHERE id = 19;

SELECT * FROM etudiant WHERE id = 19;

DELETE FROM etudiant WHERE id = 19;

SELECT * FROM etudiant;
