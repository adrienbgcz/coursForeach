/* CREATION DE LA BDD */

CREATE TABLE cout (
id serial PRIMARY KEY,
libelle character varying (30) NOT NULL
);

CREATE TABLE unite (
id serial PRIMARY KEY,
libelle character varying (10) NOT NULL,
description character varying (100) NOT NULL
);

CREATE TABLE ingredient (
	id serial PRIMARY KEY,
	nom character varying(30)
);

CREATE TABLE utilisateur (
id serial PRIMARY KEY,
nom character varying (20)
);

CREATE TABLE niveau (
id serial PRIMARY KEY,
libelle character varying (30) NOT NULL
);

CREATE TABLE recette (
id serial PRIMARY KEY,
nom character varying (30) NOT NULL,
nombre_part integer NOT NULL,
temps_preparation integer NOT NULL,
temps_repos integer,
temps_cuisson integer,
id_niveau integer REFERENCES niveau NOT NULL,
id_cout integer REFERENCES cout NOT NULL
);

CREATE TABLE preparation (
id serial PRIMARY KEY,
id_recette integer REFERENCES recette NOT NULL,
id_ingredient integer REFERENCES ingredient NOT NULL,
id_unite integer REFERENCES unite NOT NULL,
quantite integer NOT NULL
);

CREATE TABLE commentaire (
id serial PRIMARY KEY,
note integer NOT NULL,
description character varying(255),
date_creation date,
id_recette integer REFERENCES recette,
id_utilisateur integer REFERENCES utilisateur
);

/* INSERTION REFERENTIEL */
INSERT INTO niveau(libelle) VALUES
('Facile'),
('Moyen'),
('Difficile');

INSERT INTO cout(libelle) VALUES
('Bon marché'),
('Coût moyen'),
('Assez cher');

INSERT INTO utilisateur(nom) VALUES 
('Isa'),
('hannah_14141987'),
('max3202'),
('cricri1359'),
('Melloki'),
('leprincedelanuit'),
('EmelineL31'),
('lyliemoi'),
('Emlimi13'),
('lina_13929293'),
('Oscar_16503641');

INSERT INTO unite(libelle, description) VALUES
('cl', 'centilitre'),
('g', 'gramme'),
('', 'unite'),
('càs', 'cuillère à soupe'),
('tranches', 'tranches');

INSERT INTO ingredient(nom) VALUES 
('rhum'),
('farine'),
('oeuf entier'),
('sucre'),
('huile'),
('beurre fondu'),
('lait'),
('chocolat patissier'),
('beurre'),
('cheddar'),
('pain complet'),
('jambon blanc'),
('bière blonde'),
('amaretto'),
('mascarpone'),
('sucre roux');

/* INSERTION DE RECETTE*/

/* RECETTE */
-- 1. titre	 part 	temps preparation	temps cuisson

-- 2. titre	part 	temps total

-- 3. titre	part 	temps total	libellé_difficulté

-- 4. titre	part 	temps total	libellé_difficulté	libellé_cout

/* PREPARATION */
-- 5. titre recette	nom ingredient	quantité	libellé unité

/* COMMENTAIRE */
-- 6. pseudo	note	titre recette	commentaire

/* CALCUL */
-- 7.0 le nombre de recette

-- 7. le nombre d'ingredient par recette
-- titre recette 	nombre ingredient

-- 8. les notes moyennes des recettes
-- titre	moyennes

-- 9. le nombre de commentaire par personne en affichant bien toutes les personnes
-- pseudo nombre_commentaire

-- 10. le nombre de commentaire pour chaque recette
-- titre recette

-- 11. le nombre de point total (note) et le nombre de recette noté par personne	
-- pseudo	nombre_points nombre_recette

-- 12. ajouter une colonne date_naissance sur la table utilisateur

-- 13. insérer des dates de naissances alant de 1985 à 1990 sur vos utlisateurs.
-- ajouter au besoin des utilisateurs

-- 14. afficher les utilisateur avec leur age
-- pseudo date_naissance age

-- 15. afficher la moyenne d'age des utilisateurs

/*
1 - Lister les noms des recettes de cuisine
2 - Afficher la liste des ingredients d'une recette
3 - Afficher la liste des etapes d'une recette
4 - Afficher les commentaires d'une recette
5 - Ajouter un commentaire à une recette
6 - Afficher la note moyenne d'une recette, le nombre de commentaire et la liste des commentaires d'une recette.
7 - Afficher la liste des recettes : nom - note motenne / 5
8 - Afficher la liste des recettes qui utilise un ingredient particulier
*/