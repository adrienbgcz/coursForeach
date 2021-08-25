-- 1 - Lister les titres des livres
SELECT titre FROM ouvrage;


-- 2 - Lister les livres avec leur rayon
SELECT ouvrage.titre, rayon.categorie FROM ouvrage
JOIN rayon ON ouvrage.id_rayon = rayon.id;


-- 3 - Lister les auteurs de la bibliothèque
SELECT auteur.prenom, auteur.nom FROM auteur;


-- 3b - Lister les auteurs qui ont écrit des livres de la bibliotheque
-- SELECT DISTINCT auteur.prenom, auteur.nom FROM auteur
-- JOIN ecrit ON auteur.id = ecrit.id_auteur
-- JOIN ouvrage ON ecrit.id_ouvrage = ouvrage.id
-- WHERE ouvrage.titre IS NOT NULL;

-- ici, on ne veut pas afficher le titre de l'ouvrage, on veut juste savoir si l'auteur a écrit un livre,
-- il se retrouve automatiquement dans la table écrit donc pas de jointure à faire
SELECT DISTINCT auteur.prenom, auteur.nom FROM auteur
JOIN ecrit ON auteur.id = ecrit.id_auteur



-- 4 - Lister les livres d'un auteur
SELECT titre FROM ouvrage
JOIN ecrit ON ouvrage.id = ecrit.id_ouvrage
JOIN auteur ON ecrit.id_auteur = auteur.id
WHERE auteur.id = 1;


-- 5. Lister les titres et auteurs des livres
SELECT ouvrage.titre, auteur.prenom, auteur.nom FROM ouvrage
JOIN ecrit ON ouvrage.id = ecrit.id_ouvrage
JOIN auteur ON ecrit.id_auteur = auteur.id;




-- 6. Lister les titres et auteurs des livres disponibles uniquement
-- SELECT ouvrage.titre, auteur.prenom, auteur.nom, emprunt.date_emprunt, emprunt.date_retour FROM ouvrage
-- JOIN ecrit ON ouvrage.id = ecrit.id_ouvrage
-- JOIN auteur ON ecrit.id_auteur = auteur.id
-- JOIN emprunt ON ouvrage.id = emprunt.id_ouvrage
-- WHERE emprunt.date_retour IS NULL;




-- 7. Rechercher un livre par mots clés
SELECT ouvrage.titre FROM ouvrage
JOIN reference ON ouvrage.id = reference.id_ouvrage
JOIN mot_cle ON reference.id_mot_cle = mot_cle.id
WHERE mot_cle.libelle = 'humeur';



-- 8. Lister les adhérents
SELECT adherent.nom, adherent.prenom FROM adherent;


-- 9. Afficher le titre, auteurs et date d'emprunt du livre d'un adhérent
SELECT ouvrage.titre, auteur.prenom, auteur.nom, emprunt.date_emprunt FROM ouvrage
JOIN ecrit ON ouvrage.id = ecrit.id_ouvrage
JOIN auteur ON ecrit.id_auteur = auteur.id
JOIN emprunt ON ouvrage.id = emprunt.id_ouvrage
JOIN adherent ON emprunt.id_adherent = adherent.id
WHERE adherent.prenom = 'Houda';


-- 10. Afficher les livres en cours d'emprunt

SELECT ouvrage.titre FROM ouvrage
JOIN emprunt ON ouvrage.id = emprunt.id_ouvrage
WHERE emprunt.date_retour < emprunt.date_emprunt;


-- 11. lister les livres avec plus d'1 auteur
SELECT ouvrage.titre, count(*) as nombre_auteurs FROM ouvrage
JOIN ecrit ON ouvrage.id = ecrit.id_ouvrage
JOIN auteur ON ecrit.id_auteur = auteur.id
GROUP BY ouvrage.titre
HAVING count(*) > 1;




-- 12. lister les livres qui ont été emprunté en 2021 avec l'adhérent
SELECT ouvrage.titre, adherent.prenom, adherent.nom, to_char(emprunt.date_emprunt, 'YYYY') as annee FROM ouvrage
JOIN emprunt ON ouvrage.id = emprunt.id_ouvrage
JOIN adherent ON emprunt.id_adherent = adherent.id
-- WHERE emprunt.date_emprunt >= '2021-01-01';
WHERE to_char(emprunt.date_emprunt, 'YYYY') = '2021';

-- 12b. lister les livres qui ont été emprunté en 2021 avec l'adhérent
SELECT ouvrage.titre, adherent.prenom, adherent.nom, EXTRACT(YEAR FROM emprunt.date_emprunt) as annee FROM ouvrage
JOIN emprunt ON ouvrage.id = emprunt.id_ouvrage
JOIN adherent ON emprunt.id_adherent = adherent.id

WHERE EXTRACT(YEAR FROM emprunt.date_emprunt) = '2021';



-- 13. lister le nombre d'emprunt par adhérent
SELECT adherent.prenom, adherent.nom, count(emprunt.date_emprunt) as nombre_emprunts FROM emprunt
JOIN adherent ON adherent.id = emprunt.id_adherent
GROUP BY adherent.prenom, adherent.nom



-- 14. lister le nombre d'emprunt par année, par adhérent

SELECT adherent.prenom, adherent.nom, count(emprunt.date_emprunt) as nombre_emprunts, to_char(emprunt.date_emprunt, 'YYYY') as annee FROM emprunt
JOIN adherent ON adherent.id = emprunt.id_adherent
GROUP BY adherent.prenom, adherent.nom, to_char(emprunt.date_emprunt, 'YYYY');

SELECT adherent.prenom, adherent.nom, count(emprunt.date_emprunt) as nombre_emprunts, EXTRACT(YEAR FROM emprunt.date_emprunt) as annee FROM emprunt
JOIN adherent ON adherent.id = emprunt.id_adherent
GROUP BY adherent.prenom, adherent.nom, EXTRACT(YEAR FROM emprunt.date_emprunt);



































