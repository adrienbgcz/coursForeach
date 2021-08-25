-- 1 Lister les titres des livres
SELECT titre FROM ouvrage;

-- 2. Lister les livres avec leur rayon
SELECT ouvrage.titre, rayon.categorie FROM ouvrage
	JOIN rayon ON ouvrage.id_rayon = rayon.id;

-- 3. Lister les auteurs de la bibliothèque
SELECT * FROM auteur

-- 3b. Lister les auteurs qui ont écrit des livres de la bibliothèque
SELECT DISTINCT auteur.prenom, auteur.nom FROM auteur 
	JOIN ecrit ON auteur.id = ecrit.id_auteur;
	
SELECT DISTINCT auteur.prenom, auteur.nom FROM ecrit 
	JOIN auteur ON auteur.id = ecrit.id_auteur;
	
-- 4. Lister les livres d'un auteur
SELECT ouvrage.titre FROM ouvrage 
	JOIN ecrit ON ouvrage.id = ecrit.id_ouvrage
	JOIN auteur ON auteur.id = ecrit.id_auteur
WHERE auteur.id = 6;

-- 5. Lister les titres et auteurs des livres
SELECT ouvrage.titre, (auteur.nom, auteur.prenom) as auteur FROM ouvrage
	JOIN ecrit ON ouvrage.id = ecrit.id_ouvrage
	JOIN auteur ON auteur.id = ecrit.id_auteur;
	
SELECT ouvrage.titre, auteur.nom, auteur.prenom FROM ouvrage
	JOIN ecrit ON ouvrage.id = ecrit.id_ouvrage
	JOIN auteur ON auteur.id = ecrit.id_auteur;

-- 6. Lister les titres et auteurs des livres disponibles uniquement
SELECT * FROM emprunt;

-- vérification des dates pour les rendre cohérentes

UPDATE emprunt SET date_retour = null WHERE id = 2; 
UPDATE emprunt SET date_retour = '2021-03-25' WHERE id = 5; 

-- ajout d'un livre qui n'a pas encore été emprunté

INSERT INTO ouvrage(titre, id_rayon) VALUES 
('L''arrache-coeur', 4);

INSERT INTO reference(id_mot_cle, id_ouvrage) VALUES 
(7,5),
(8,5),
(9,5);

INSERT INTO ecrit (id_ouvrage, id_auteur) VALUES 
(1, 4);

-- ***
SELECT ouvrage.titre, auteur.nom, auteur.prenom, emprunt.date_emprunt, emprunt.date_retour 
FROM ouvrage
	LEFT JOIN ecrit ON ouvrage.id = ecrit.id_ouvrage
	LEFT JOIN auteur ON auteur.id = ecrit.id_auteur
	LEFT JOIN emprunt ON emprunt.id_ouvrage = ouvrage.id;
	
SELECT ouvrage.titre, auteur.nom, auteur.prenom, emprunt.date_emprunt, emprunt.date_retour 
FROM ouvrage
	JOIN ecrit ON ouvrage.id = ecrit.id_ouvrage
	JOIN auteur ON auteur.id = ecrit.id_auteur
	JOIN emprunt ON emprunt.id_ouvrage = ouvrage.id
WHERE emprunt.date_retour IS NOT NULL;

SELECT ouvrage.titre, auteur.nom, auteur.prenom, emprunt.date_emprunt, emprunt.date_retour 
FROM ouvrage
	JOIN ecrit ON ouvrage.id = ecrit.id_ouvrage
	JOIN auteur ON auteur.id = ecrit.id_auteur
	JOIN emprunt ON emprunt.id_ouvrage = ouvrage.id
WHERE emprunt.date_retour IS NULL;
	
SELECT ouvrage.id 
FROM ouvrage
	JOIN emprunt ON emprunt.id_ouvrage = ouvrage.id
WHERE date_retour IS NULL;

SELECT ouvrage.titre, auteur.nom, auteur.prenom 
FROM ouvrage 
	LEFT JOIN ecrit ON ouvrage.id = ecrit.id_ouvrage
	LEFT JOIN auteur ON auteur.id = ecrit.id_auteur
WHERE ouvrage.id NOT IN (
	SELECT ouvrage.id 
	FROM ouvrage
		JOIN emprunt ON emprunt.id_ouvrage = ouvrage.id
	WHERE date_retour IS NULL);

-- 7. Rechercher un livre par mots clés
SELECT ouvrage.titre, mot_cle.libelle 
FROM reference 
	JOIN ouvrage ON reference.id_ouvrage = ouvrage.id
	JOIN mot_cle ON reference.id_mot_cle = mot_cle.id
WHERE mot_cle.libelle = 'humour';

-- /mot_cle
SELECT * FROM mot_cle;

SELECT ouvrage.titre, mot_cle.libelle 
FROM reference 
	JOIN ouvrage ON reference.id_ouvrage = ouvrage.id
	JOIN mot_cle ON reference.id_mot_cle = mot_cle.id
WHERE mot_cle.id = 4;

-- 8. Lister les adhérents
SELECT adherent.nom, adherent.prenom FROM adherent;

-- 9. Afficher le titre, auteurs et date d'emprunt du livre d'un adhérent
SELECT DISTINCT
	ouvrage.titre, 
	adherent.prenom, 
	adherent.nom, 
	emprunt.date_emprunt, 
	emprunt.date_retour 
FROM ouvrage
	JOIN ecrit ON ecrit.id_ouvrage = ouvrage.id
	JOIN auteur ON auteur.id = ecrit.id_auteur
	JOIN emprunt ON emprunt.id_ouvrage = ouvrage.id
	JOIN adherent ON adherent.id = emprunt.id_adherent
WHERE adherent.id = 3;

SELECT DISTINCT
	ouvrage.titre, 
	adherent.prenom, 
	adherent.nom, 
	emprunt.date_emprunt, 
	emprunt.date_retour 
FROM emprunt
	JOIN ouvrage ON emprunt.id_ouvrage = ouvrage.id
	JOIN ecrit ON ecrit.id_ouvrage = ouvrage.id
	JOIN auteur ON auteur.id = ecrit.id_auteur
	JOIN adherent ON adherent.id = emprunt.id_adherent
WHERE adherent.id = 3;
	
-- 10. Afficher les livres en cours d'emprunt
SELECT ouvrage.titre
FROM ouvrage
	JOIN emprunt ON emprunt.id_ouvrage = ouvrage.id
WHERE date_retour IS NULL;

-- 11. lister les livres avec plus d'1 auteur
SELECT ouvrage.titre, count(*) as nombre_auteur FROM ouvrage
	JOIN ecrit ON ecrit.id_ouvrage = ouvrage.id
	JOIN auteur ON auteur.id = ecrit.id_auteur
GROUP BY ouvrage.titre
HAVING count(*) > 1
ORDER BY ouvrage.titre;

-- 12. lister les livres qui ont été emprunté en 2021 avec l'adhérent
SELECT ouvrage.titre, adherent.prenom, adherent.nom, emprunt.date_emprunt FROM emprunt
	JOIN adherent ON emprunt.id_adherent = adherent.id
	JOIN ouvrage ON emprunt.id_ouvrage = ouvrage.id
WHERE emprunt.date_emprunt <= '2021-12-31' AND emprunt.date_emprunt >= '2021-01-01';

SELECT ouvrage.titre, adherent.prenom, adherent.nom, emprunt.date_emprunt, to_char(emprunt.date_emprunt, 'YYYY')
FROM emprunt
	JOIN adherent ON emprunt.id_adherent = adherent.id
	JOIN ouvrage ON emprunt.id_ouvrage = ouvrage.id
WHERE to_char(emprunt.date_emprunt, 'YYYY') = '2021';

SELECT ouvrage.titre, adherent.prenom, adherent.nom, emprunt.date_emprunt, EXTRACT(YEAR FROM emprunt.date_emprunt) as annee
FROM emprunt
	JOIN adherent ON emprunt.id_adherent = adherent.id
	JOIN ouvrage ON emprunt.id_ouvrage = ouvrage.id
WHERE EXTRACT(YEAR FROM emprunt.date_emprunt) = 2021;


-- 13. lister le nombre d'emprunt par adhérent
SELECT adherent.prenom, adherent.nom, emprunt.date_emprunt
FROM emprunt
	JOIN adherent ON adherent.id = emprunt.id_adherent

SELECT adherent.prenom, adherent.nom, count(emprunt.date_emprunt) as nombre_emprunt
FROM emprunt
	JOIN adherent ON adherent.id = emprunt.id_adherent
GROUP BY adherent.prenom, adherent.nom

-- exemple sur la date de retour qui peut parfois être nulle (et donc faire une différence par rapport au *)
SELECT adherent.prenom, adherent.nom, count(emprunt.date_retour) as nombre_retour
FROM emprunt
	JOIN adherent ON adherent.id = emprunt.id_adherent
GROUP BY adherent.prenom, adherent.nom

-- 14. lister le nombre d'emprunt par année, par adhérent
SELECT adherent.prenom, adherent.nom, count(emprunt.date_emprunt) as nombre_emprunt, to_char(emprunt.date_emprunt, 'YYYY') as annee
FROM emprunt
	JOIN adherent ON adherent.id = emprunt.id_adherent
GROUP BY adherent.prenom, adherent.nom, annee

SELECT adherent.prenom, adherent.nom, count(emprunt.date_emprunt) as nombre_emprunt, EXTRACT(YEAR FROM emprunt.date_emprunt) as annee
FROM emprunt
	JOIN adherent ON adherent.id = emprunt.id_adherent
GROUP BY adherent.prenom, adherent.nom, annee