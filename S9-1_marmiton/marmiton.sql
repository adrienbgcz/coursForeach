-- https://www.postgresql.org/docs/current/functions-datetime.html



CREATE TABLE niveau (
id serial PRIMARY KEY,
libelle integer
);


CREATE TABLE cout (
id serial PRIMARY KEY,
libelle character varying (20)
);

CREATE TABLE utilisateur (
id serial PRIMARY KEY,
nom character varying (20)
);


CREATE TABLE ingredient (
id serial PRIMARY KEY,
nom_ingredient character varying (20)
);


CREATE TABLE unite (
id serial PRIMARY KEY,
libelle character varying(10),
description character varying (20)
);


CREATE TABLE recette (
id serial PRIMARY KEY,
nom character varying(50),
nombre_part integer,
temps_preparation integer,
temps_repos integer,
temps_cuisson integer,
id_niveau integer REFERENCES niveau,
id_cout integer REFERENCES cout
);


CREATE TABLE preparation (
id serial PRIMARY KEY,
quantite integer,
id_recette integer REFERENCES recette,
id_ingredient integer REFERENCES ingredient,
id_unite integer REFERENCES unite
);

CREATE TABLE commentaire (
id serial PRIMARY KEY,
note integer,
description character varying(255),
date_creation date,
id_recette integer REFERENCES recette,
id_utilisateur integer REFERENCES ingredient
);



INSERT INTO recette (nom, id_niveau, id_cout, nombre_part, temps_preparation, temps_repos, temps_cuisson) VALUES ('Pâte à crêpes', 1, 1, 15, 10, 0, 20)
INSERT INTO preparation (quantite, id_recette, id_ingredient, id_unite) VALUES (5, 1, 1, 1);
INSERT INTO preparation (quantite, id_recette, id_ingredient, id_unite) VALUES (300, 1, 2, 2);
INSERT INTO preparation (quantite, id_recette, id_ingredient, id_unite) VALUES (3, 1, 3, 3);
INSERT INTO preparation (quantite, id_recette, id_ingredient, id_unite) VALUES (3, 1, 4, 4);
INSERT INTO preparation (quantite, id_recette, id_ingredient, id_unite) VALUES (5, 1, 5, 4);
INSERT INTO preparation (quantite, id_recette, id_ingredient, id_unite) VALUES (50, 1, 6, 2);
INSERT INTO preparation (quantite, id_recette, id_ingredient, id_unite) VALUES (60, 1, 7, 1);

INSERT INTO commentaire (note, description, date_creation, id_utilisateur, id_recette) VALUES (5, 'Parfait', new Date(), 6, 1);
INSERT INTO commentaire (note, description, date_creation, id_utilisateur, id_recette) VALUES (2, 'Pâte trop grumeuse à cause du beurre, elles sont bonnes mais à cause de ça sont trop épaisses', new Date(), 3, 1)






INSERT INTO recette (nom, id_niveau, id_cout, nombre_part, temps_preparation, temps_repos, temps_cuisson) VALUES ('Welsh Rarebit', 1, 2, 2, 15, 0, 10);
INSERT INTO preparation (quantite, id_recette, id_ingredient, id_unite) VALUES (400, 3, 10, 2 );
INSERT INTO preparation (quantite, id_recette, id_ingredient, id_unite) VALUES (2, 3, 11, 5);
INSERT INTO preparation (quantite, id_recette, id_ingredient, id_unite) VALUES (2, 3, 12, 5);
INSERT INTO preparation (quantite, id_recette, id_ingredient, id_unite) VALUES (8, 3, 13, 1);
INSERT INTO preparation (quantite, id_recette, id_ingredient, id_unite) VALUES (3, 3, 3, 3);


INSERT INTO commentaire (note, description, date_creation, id_utilisateur, id_recette) VALUES (5, 'Parfait', current_date, 8, 3);
INSERT INTO commentaire (note, description, date_creation, id_utilisateur, id_recette) VALUES (2, 'Ce plat servi individuellement permet de satisfaire tous les goûts : sans jambon pour les végétariens, sans oeuf pour alléger ou avec tout pour les gourmands.', current_date, 4, 3);



-- 1. nom, part, temps preparation, temps repos, temps cuisson
SELECT recette.nom, recette.nombre_part, recette.temps_preparation, recette.temps_repos, recette.temps_cuisson
FROM recette;



-- 2. nom, part, temps total

SELECT recette.nom, recette.nombre_part, COALESCE(recette.temps_preparation, 0) + COALESCE(recette.temps_repos, 0) + COALESCE(recette.temps_cuisson, 0) as temps_total -- selectionne le premier paramètre, sinon le deuxième pour contrer le null dans la somme
FROM recette;


-- 3. nom, part, temps total, libellé niveau (modifié) 
SELECT recette.nom, recette.nombre_part, COALESCE(recette.temps_preparation, 0) + COALESCE(recette.temps_repos, 0) + COALESCE(recette.temps_cuisson, 0) as temps_total, niveau.libelle
FROM recette
JOIN niveau ON recette.id_niveau = niveau.id;


-- 4. nom, part, temps total, libellé niveau, libellé cout

SELECT recette.nom, recette.nombre_part, COALESCE(recette.temps_preparation, 0) + COALESCE(recette.temps_repos, 0) + COALESCE(recette.temps_cuisson, 0) as temps_total, niveau.libelle, cout.libelle
FROM recette
JOIN niveau ON recette.id_niveau = niveau.id
JOIN cout ON recette.id_cout = cout.id;


-- 5. nom_recette, nom ingredient, quantité, libellé unité
SELECT recette.nom, ingredient.nom, preparation.quantite, unite.libelle FROM recette
JOIN preparation ON recette.id = preparation.id_recette
JOIN ingredient ON preparation.id_ingredient = ingredient.id
JOIN unite ON preparation.id_unite = unite.id;




-- 6. pseudo, note, nom recette, commentaire
SELECT utilisateur.nom, commentaire.note, recette.nom, commentaire.description FROM commentaire 
JOIN utilisateur ON utilisateur.id = commentaire.id_utilisateur
JOIN recette ON commentaire.id_recette = recette.id;




-- 7.0 le nombre de recette
SELECT count(recette.id) as nombre_recettes FROM recette;



-- 7.1 le nombre d'ingredient par recette
-- nom recette, nombre ingredient
SELECT recette.nom, count(ingredient.nom) as nombre_ingredients FROM recette
SELECT recette.nom, count(preparation.id) as nombre_ingredients FROM recette
JOIN preparation ON recette.id = preparation.id_recette
GROUP BY recette.nom;



-- 8. les notes moyennes des recettes
-- nom recette, moyenne
SELECT recette.nom, round(avg(commentaire.note), 1) FROM recette
JOIN commentaire ON recette.id = commentaire.id_recette
GROUP BY recette.nom;



-- 9. le nombre de commentaire par personne en affichant bien toutes les personnes
-- pseudo nombre_commentaire
SELECT utilisateur.nom, count(commentaire.id) as total_commentaires FROM commentaire
RIGHT JOIN utilisateur ON commentaire.id_utilisateur = utilisateur.id
GROUP BY utilisateur.nom
ORDER BY count(commentaire.id) DESC;



-- 10. le nombre de commentaire pour chaque recette
-- nom recette, nombre commentaire
SELECT recette.nom, count(commentaire.id) FROM commentaire
JOIN recette ON commentaire.id_recette = recette.id
GROUP BY recette.nom;





-- 11. le nombre de point total (note) et le nombre de recette noté par personne	
-- pseudo, nombre points,  nombre recettes
SELECT utilisateur.nom, sum(commentaire.note) as total_point, count(recette.id) as nombre_recettes_notées FROM commentaire
JOIN recette ON commentaire.id_recette = recette.id
JOIN utilisateur ON commentaire.id_utilisateur = utilisateur.id
GROUP BY utilisateur.nom





-- 12. ajouter une colonne date_naissance sur la table utilisateur
ALTER TABLE utilisateur ADD COLUMN date_naissance date 


-- 13. insérer des dates de naissances allant de 1985 à 1990 sur vos utilisateurs.
-- ajouter au besoin des utilisateurs
UPDATE utilisateur SET date_naissance = '1985-01-01' WHERE id = 1;
UPDATE utilisateur SET date_naissance = '1986-01-01' WHERE id = 2;
UPDATE utilisateur SET date_naissance = '1987-01-01' WHERE id = 3;
UPDATE utilisateur SET date_naissance = '1988-01-01' WHERE id = 4;
UPDATE utilisateur SET date_naissance = '1989-01-01' WHERE id = 5;
UPDATE utilisateur SET date_naissance = '1990-01-01' WHERE id = 6;
UPDATE utilisateur SET date_naissance = '1987-01-06' WHERE id = 7;
UPDATE utilisateur SET date_naissance = '1988-09-01' WHERE id = 8;
UPDATE utilisateur SET date_naissance = '1989-07-09' WHERE id = 9;
UPDATE utilisateur SET date_naissance = '1990-04-15' WHERE id = 10;
UPDATE utilisateur SET date_naissance = '1985-05-26' WHERE id = 23;


-- 14. afficher les utilisateur avec leur age
-- pseudo, date naissance, age
SELECT utilisateur.nom, utilisateur.date_naissance, age(utilisateur.date_naissance) FROM utilisateur; 
SELECT utilisateur.nom, utilisateur.date_naissance, date_part('year', age(utilisateur.date_naissance)) FROM utilisateur;
SELECT utilisateur.nom, utilisateur.date_naissance, extract (year from age(utilisateur.date_naissance) FROM utilisateur;



-- 15. afficher la moyenne d'age des utilisateurs
SELECT avg(date_part('year', age(utilisateur.date_naissance))) as moyenne_age FROM utilisateur;

SELECT round(avg(date_part('year', age(utilisateur.date_naissance)))::numeric, 2) FROM utilisateur; -- ici on a un chiffre décimal à arrondir
SELECT date_part('year', avg(age(utilisateur.date_naissance))) FROM utilisateur; -- ici non



-- 16. afficher le plus jeune utilisateur

-- 16. afficher le plus jeune utilisateur
SELECT 
	utilisateur.nom, 
	utilisateur.date_naissance, 
	age(utilisateur.date_naissance) as age
FROM utilisateur
WHERE date_part('year', age(utilisateur.date_naissance)) = (SELECT min(date_part('year', age(utilisateur.date_naissance))) as age_plus_jeune FROM utilisateur)







































