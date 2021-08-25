-- 1. lister tous les champs de la table

SELECT * FROM personne;


-- 2. lister les personnes dont le prenom contient un y (minuscule uniquement)

SELECT prenom, nom FROM personne
WHERE prenom LIKE '%y%';


-- 3. lister les prenoms

SELECT prenom FROM personne


-- 4. lister prenoms sans doublon

SELECT prenom FROM personne
GROUP BY prenom;

SELECT DISTINCT prenom FROM personne; 


-- 5. compter le nombre de personnes

SELECT count(*) as nombre_personnes FROM personne;


-- 6. lister les prenoms et pour chaque prenom, indiquez le nombre de personnes concernées

SELECT prenom, count(*) as nombre_personnes FROM personne
GROUP BY prenom;


-- 6b. ordonné par nombre de personne du plus grand au plus petit
SELECT prenom, count(*) as nombre_personnes FROM personne
GROUP BY prenom
ORDER BY nombre_personnes DESC;



-- 6c. uniquement ceux dont le nombre de personne est superieur à 1 (/!\ nouveauté)

SELECT prenom, count(*) as nombre_personnes FROM personne
GROUP BY prenom
HAVING count(*) > 1
ORDER BY nombre_personnes;




-- 7. lister les personnes qui ont pour prenom Hedda
SELECT prenom, nom FROM personne
WHERE prenom = 'Hedda';



-- ajouter une colonne avec une clé étrangère

ALTER TABLE personne ADD COLUMN id_ville integer REFERENCES ville;

UPDATE personne SET id_ville = 1 WHERE ville = 'Tourcoing';
UPDATE personne SET id_ville = 2 WHERE ville = 'Orchies';
UPDATE personne SET id_ville = 3 WHERE ville = 'Ronchin';
UPDATE personne SET id_ville = 4 WHERE ville = 'Croix';
UPDATE personne SET id_ville = 5 WHERE ville = 'Douai';
UPDATE personne SET id_ville = 6 WHERE ville = 'Wasquehal';
UPDATE personne SET id_ville = 7 WHERE ville = 'Roubaix';
UPDATE personne SET id_ville = 8 WHERE ville = 'Lille';
UPDATE personne SET id_ville = 9 WHERE ville = 'Faches';
UPDATE personne SET id_ville = 10 WHERE ville = 'Arras';
UPDATE personne SET id_ville = 11 WHERE ville = 'Valenciennes';
UPDATE personne SET id_ville = 12 WHERE ville = 'Lomme';
UPDATE personne SET id_ville = 13 WHERE ville = 'Béthune';


-- verifier que tous les id_ville ont une valeur
-- SELECT * FROM personne WHERE id_ville IS NULL
SELECT count(*) FROM personne WHERE id_ville IS NULL;


-- mettre la contrainte not null
ALTER TABLE personne ALTER COLUMN id_ville SET NOT NULL;



SELECT personne.ville as nom_dans_personne, ville.nom as nom_dans_ville FROM personne
JOIN ville ON personne.id_ville = ville.id
WHERE personne.ville <> ville.nom;

ALTER TABLE personne DROP COLUMN ville;


-- creation de la table produit
CREATE TABLE produit (
id serial PRIMARY KEY,
libelle character varying(20) NOT NULL,
prix integer NOT NULL
);


-- insérer le produit A avec le prix 2
INSERT INTO produit(libelle, prix) VALUES ('produit A', 2),('produit B', 4),('produit C', 5),('produit D', 3),('produit E', 6);



-- creation de la table commande

CREATE TABLE commande (
id serial PRIMARY KEY,
id_produit integer REFERENCES produit NOT NULL,
id_personne integer REFERENCES personne NOT NULL,
quantite integer NOT NULL
);


-- ajouter la commande du produit C par la personne 'Hyacinth Rose' dans la quantité 8

SELECT * FROM produit WHERE libelle = 'produit C';
SELECT * FROM personne WHERE prenom = 'Hyacinth' AND nom = 'Rose';


INSERT INTO commande (id_produit, id_personne, quantite) VALUES (3, 8, 8);

-- combien de commandes ? 
SELECT count(*) FROM commande;

-- 1. Lister les commandes
SELECT * FROM commande;

 
-- 1b.lister les commandes mais uniquement id_personne et l'id_produit */

SELECT commande.id_personne, commande.id_produit FROM commande; 

-- 2. Lister les commandes en remplaçant l'id_produit par le libellé du produit */

SELECT produit.libelle, commande.id_personne, commande.quantite  FROM commande 
JOIN produit ON commande.id_produit = produit.id;

-- 2b. Lister les commandes en ajoutant à l'id_personne, le nom et le prenom de la personne */

SELECT commande.id, commande.id_personne, personne.prenom, personne.nom, commande.quantite  FROM commande 
JOIN personne ON commande.id_personne = personne.id;

-- 3. Lister les commandes avec les libellés produit (2.) et le nom et le prenom de la personne en plus de l'id */
SELECT personne.prenom, personne.nom, commande.quantite, produit.libelle  FROM commande 
JOIN produit ON commande.id_produit = produit.id
JOIN personne ON commande.id_personne = personne.id;


-- 4. lister le nombre de commandes par personne */
SELECT commande.id_personne, personne.prenom, personne.nom, count(*) as nombre_de_commandes FROM commande 
JOIN personne ON commande.id_personne = personne.id
GROUP BY commande.id_personne, personne.prenom, personne.nom;


-- 5. lister les commandes et ajouter une colonne avec le montant de chaque commande */
SELECT commande.id as numero_commande, commande.quantite, produit.prix, commande.quantite * produit.prix as total_commande FROM commande
JOIN produit ON commande.id_produit = produit.id;


-- 6. lister les personnes et le montant total de leurs commandes.*/
SELECT personne.prenom, personne.nom, sum(commande.quantite * produit.prix) as total_commande FROM commande
JOIN personne ON commande.id_personne = personne.id
JOIN produit ON commande.id_produit = produit.id
GROUP BY personne.prenom, personne.nom;


-- 7. Lister les produits et le montant total des commandes faite sur ces produits */
SELECT produit.libelle, sum(commande.quantite * produit.prix) as montant_par_commande FROM produit
JOIN commande ON commande.id_produit = produit.id
GROUP BY produit.libelle
ORDER BY produit.libelle;

-- 8. Lister les produits et le montant moyen des commandes faites sur ces produits

SELECT produit.libelle, round(avg(commande.quantite * produit.prix), 2) as montant_par_commande FROM produit
JOIN commande ON commande.id_produit = produit.id
GROUP BY produit.libelle
ORDER BY produit.libelle;


-- 8b.
SELECT 
	produit.libelle, 
	round(avg(commande.quantite * produit.prix), 2) as montant_par_commande, 
	count(*) as nombre_commandes, -- afficher le nombre de commandes
	round(avg(commande.quantite), 2) -- afficher le nombre moyen de commandes
FROM produit
JOIN commande ON commande.id_produit = produit.id
GROUP BY produit.libelle
ORDER BY produit.libelle;



-- 9. Lister les villes et le montant total des commandes par ville ainsi que le nombre de commandes, et la quantité totale d'articles commandés

SELECT ville.nom, sum(commande.quantite * produit.prix) as total_commande, count(*) as nombre_commandes, sum(commande.quantite) as quantite_produits FROM ville
JOIN personne ON ville.id = personne.id_ville
JOIN commande ON personne.id = commande.id_personne
JOIN produit ON commande.id_produit = produit.id
GROUP BY ville.nom


























