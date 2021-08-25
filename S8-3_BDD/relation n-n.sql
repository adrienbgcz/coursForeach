CREATE TABLE participation (
	id serial PRIMARY KEY,
	id_disque integer REFERENCES disque,
	id_artiste integer REFERENCES artiste
);

SELECT * FROM disque ORDER BY annee ASC;
SELECT * FROM disque ORDER BY annee DESC;

SELECT * FROM disque LIMIT 5;

INSERT INTO participation (id_disque, id_artiste) VALUES 
 (1, 1),
 (2, 2),
 (3, 2),
 (4,1),
 (5,4),
 (6,4),
 (7,5),
 (8,5),
 (9, 6),
 (10, 3),
 (11, 6),
 (12, 3);
 
SELECT * FROM disque
	JOIN participation ON participation.id_disque = disque.id
WHERE disque.id_artiste <> participation.id_artiste;

ALTER TABLE disque DROP COLUMN id_artiste;

SELECT disque.titre, disque.annee, artiste.nom FROM disque
	JOIN participation ON participation.id_disque = disque.id
	JOIN artiste ON artiste.id = participation.id_artiste
ORDER BY disque.titre;

INSERT INTO participation (id_disque, id_artiste) VALUES 
 (1, 2);
 
SELECT disque.titre, count(*) as nombre_artiste FROM disque
	JOIN participation ON participation.id_disque = disque.id
	JOIN artiste ON artiste.id = participation.id_artiste
GROUP BY (disque.titre)
ORDER BY disque.titre;

 
SELECT artiste.nom FROM artiste
 JOIN participation ON participation.id_artiste = artiste.id
 JOIN disque ON disque.id = participation.id_disque
WHERE disque.id = 1

SELECT * FROM disque
	JOIN participation ON participation.id_disque = disque.id
	JOIN artiste ON artiste.id = participation.id_artiste
ORDER BY disque.titre;

SELECT disque.titre, disque.annee, artiste.nom, maison.nom FROM disque
	JOIN participation ON participation.id_disque = disque.id
	JOIN artiste ON artiste.id = participation.id_artiste
	JOIN maison ON maison.id = 
ORDER BY disque.titre;