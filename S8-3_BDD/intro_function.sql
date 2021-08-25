SELECT * FROM maison;

SELECT * FROM disque;

SELECT count(*) FROM disque;

SELECT count(*) FROM maison;

SELECT count(*) FROM artiste;

SELECT * FROM disque;

SELECT artiste.nom, count(*) as nbre_disque FROM disque
	JOIN artiste ON artiste.id = disque.id_artiste
GROUP BY (artiste.nom);

SELECT maison.nom, count(*) FROM maison
	LEFT JOIN disque ON disque.id_maison = maison.id
GROUP BY (maison.nom);

SELECT round(avg(annee), 2) FROM disque;

SELECT min(annee) FROM disque;

SELECT sum(annee) FROM disque;
