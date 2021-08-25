-- 1. creation de la table formation
-- nom obligatoire et unique
CREATE TABLE formation (
	id serial PRIMARY KEY,
	nom character varying(30) NOT NULL UNIQUE,
	titre_professionnel character varying(30)
);

-- Modification de la taille de la chaine de caractères pour le nom
ALTER TABLE formation ALTER COLUMN nom TYPE character varying(50);

-- 2. insertion de données : 
-- A	Formation Reconversion Professionnelle, Titre DWWM
-- H  Bachelor 1, Titre DWWM
-- P bachelor 2
--  Bachelor 3, Titre Concepteur d''Application
INSERT INTO formation (nom, titre_professionnel) VALUES
	('Reconversion professionnelle', 'DWWM');
INSERT INTO formation (nom) VALUES ('Bachelor 2');
INSERT INTO formation (nom , titre_professionnel) VALUES 
	('bachelor1', 'DWWM'),
	('bachelor3', 'Concepteur d''Application');

-- 3. Ajout de la colonne 'durée' obligatoire (en nombre d'heure)
-- On ne peut pas ajouter la colonne et la contrainte en une seule fois car il existe déja des données dans la base qui ne respecte pas la contraine.
-- il faut ajouter la colonne, modifier les données pour respecter la future containte puis enfin ajouter la containte.
ALTER TABLE formation ADD COLUMN duree integer;

-- 4. Mise à jour des données 
-- ajout des durée : 840 et 1200 respectivement
UPDATE formation SET duree = 840 WHERE id = 1; 
-- UPDATE formation SET duree = 1200 WHERE id = 2 OR id = 5 OR id = 6; 
UPDATE formation SET duree = 1200 WHERE id IN (2, 5, 6); 

-- 3 -> ajout de la containte 
ALTER TABLE formation ALTER COLUMN duree SET NOT NULL;

-- 5. renommer titre DWWM en Développeur Web et Web Mobile
UPDATE formation SET titre_professionnel = 'Développeur Web et Web Mobile'
WHERE titre_professionnel = 'DWWM'


-- 6. Afficher toutes les données de la table
SELECT *  FROM formation;

-- 7. Afficher les formations de plus de 840 heures
SELECT *  FROM formation WHERE duree > 840;

-- 8. Afficher toutes les formations Bachelor
SELECT *  FROM formation WHERE upper(nom) LIKE '%BACHELOR%';

SELECT *  FROM formation;

