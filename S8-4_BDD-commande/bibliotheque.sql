CREATE TABLE mot_cle (
	id serial PRIMARY KEY,
	libelle character varying(30)
);

INSERT INTO mot_cle(libelle) VALUES 
('candide'),
('javascript'),
('numérique'),
('humeur'),
('développement personnel'),
('humour'),
('Science-fiction'),
('Drame'),
('Drogue'),
('spleen'),
('Mélancolie'),
('Voyage'),
('Animaux');

CREATE TABLE auteur (
id serial PRIMARY KEY,
nom character varying (30) NOT NULL,
prenom character varying (30)
);


CREATE TABLE adherent (
id serial PRIMARY KEY,
nom character varying (30) NOT NULL,
prenom character varying (30)
);

CREATE TABLE rayon (
id serial PRIMARY KEY,
categorie character varying(30) NOT NULL
);

CREATE TABLE ouvrage(
	id serial PRIMARY KEY,
	titre character varying (30),
	id_rayon integer REFERENCES rayon
);

CREATE TABLE ecrit (
id serial PRIMARY KEY,
id_ouvrage integer REFERENCES ouvrage,
id_auteur integer REFERENCES auteur
);

CREATE TABLE emprunt (
id serial PRIMARY KEY,
id_ouvrage integer REFERENCES ouvrage NOT NULL,
id_adherent integer REFERENCES adherent NOT NULL,
date_emprunt date NOT NULL,
date_retour date 
);

CREATE TABLE reference (
id serial PRIMARY KEY,
id_mot_cle integer REFERENCES mot_cle,
id_ouvrage integer REFERENCES ouvrage
);

INSERT INTO adherent(nom, prenom) VALUES 
('Herlemont', 'Pierre'),
('Bogacz', 'Adrien'),
('Errachidi', 'Houda'),
('Mozdzierz', 'Aurore'),
('Claeys', 'Fabrice');

INSERT INTO rayon(categorie) VALUES
('Litterature'),
('Tutoriel'),
('Psychologie'),
('SF'),
('poète');

INSERT INTO auteur(nom) VALUES  ('Voltaire');
INSERT INTO auteur(nom, prenom) VALUES ('Mozdzierz', 'Aurore'), ('Vidal', 'Jean-Philippe'), ('Vian', 'Boris'), ('Baudelaire', 'Charles'), ('Verne', 'Jules');


INSERT INTO ouvrage(titre, id_rayon) VALUES 
('Candide', 1), ('L''ecume des jours', 4);

INSERT INTO reference(id_mot_cle, id_ouvrage) VALUES 
(1,1),
(6,2),
(7,2),
(8,2);

INSERT INTO ecrit (id_ouvrage, id_auteur) VALUES 
(1, 6), (2, 3);

INSERT INTO emprunt(id_ouvrage, id_adherent, date_emprunt, date_retour) VALUES 
(1,1,'2020-12-24', '2021-03-01'),
(2,4,'2020-12-26', '2020-11-25');

INSERT INTO ouvrage(titre, id_rayon) VALUES ('Le mur des humeurs', 3);
INSERT INTO ecrit(id_ouvrage, id_auteur) VALUES (3, 3);
INSERT INTO ecrit(id_ouvrage, id_auteur) VALUES (3, 1);
INSERT INTO reference(id_mot_cle, id_ouvrage) VALUES (4, 3);
INSERT INTO reference(id_mot_cle, id_ouvrage) VALUES (5, 3);
INSERT INTO reference(id_mot_cle, id_ouvrage) VALUES (6, 3);
INSERT INTO emprunt(id_ouvrage, id_adherent, date_emprunt, date_retour) VALUES (3, 2, '2021-01-20', '2021-01-25');
INSERT INTO emprunt(id_ouvrage, id_adherent, date_emprunt) VALUES (3, 3, '2021-02-20');

INSERT INTO ouvrage(titre, id_rayon) VALUES
('Le Javascript pour les nuls', 2);
INSERT INTO ecrit(id_ouvrage, id_auteur) VALUES
(4, 1);
INSERT INTO reference(id_mot_cle, id_ouvrage) VALUES
(2,4),
(3,4);
INSERT INTO emprunt(id_ouvrage, id_adherent, date_emprunt, date_retour) VALUES
(4, 2, '2021-02-20', '2021-01-25');