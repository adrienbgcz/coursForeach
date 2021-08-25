CREATE TABLE genre (
id serial PRIMARY KEY,
libelle character varying (30) NOT NULL
);

CREATE TABLE audience (
id serial PRIMARY KEY,
libelle character varying (30) NOT NULL
);

CREATE TABLE utilisateur (
id serial PRIMARY KEY,
email character varying (50) NOT NULL UNIQUE,
date_naissance date NOT NULL,
pseudo character varying (20) NOT NULL UNIQUE
);

CREATE TABLE genre_utilisateur (
id serial PRIMARY KEY,
id_utilisateur integer REFERENCES utilisateur NOT NULL ,
id_genre integer REFERENCES genre NOT NULL
);

CREATE TABLE jeu (
id serial PRIMARY KEY,
titre character varying (40) NOT NULL,
description character varying (250) NOT NULL,
date_disponible date NOT NULL,
resume character varying (100) NOT NULL,
prix double precision CONSTRAINT prix_positif CHECK (prix > 0),
id_audience integer REFERENCES audience NOT NULL
);

CREATE TABLE genre_jeu (
id serial PRIMARY KEY,
id_genre integer REFERENCES genre NOT NULL,
id_jeu integer REFERENCES jeu NOT NULL
);

CREATE TABLE bibliotheque (
id serial PRIMARY KEY,
date_achat date NOT NULL,
prix_achat double precision CONSTRAINT prix_achat_positif CHECK (prix_achat > 0) NOT NULL,
note integer NOT NULL,
id_utilisateur integer REFERENCES utilisateur NOT NULL ,
id_jeu integer REFERENCES jeu NOT NULL
);

ALTER TABLE genre ADD COLUMN libelle character varying (30) NOT NULL;
ALTER TABLE genre DROP COLUMN libellé;

INSERT INTO genre(libelle) VALUES 
('action'),
('aventure'),
('horreur'),
('rpg'),
('strategie'),
('simulation'),
('role'),
('point''n''click');

INSERT INTO audience(libelle) VALUES
('enfant'),
('jeunesse'),
('adulte'),
('tout public');

INSERT INTO jeu (titre, prix, date_disponible, id_audience)
	VALUES
		('Final fantasy VII', 27.99, '10-10-1997', 4),
		('Final fantasy VIII', 28.99, '10-10-1998', 4),
		('Final fantasy IX', 35.99, '10-10-1998', 4),
		('Resident Evil', 35.99, '10-10-1997', 3),
		('Spyro', 35.99, '10-10-1998', 2),
		('Les chevaliers de baphomet', 35.99, '10-10-1998', 4),
		('Le jour des tentacules', 11.99, '10-10-1995', 4),
		('Mon petit poney', 15.99, '10-10-2002', 1),
		('Sims 3', 35.99, '10-10-1998', 4),
		('Civilization', 60.00, '10-10-2012', 3);

INSERT INTO jeu (titre, prix,description,date_disponible,id_audience)
VALUES 
	('World of Warcraft: Shadowlands',
	 	39.99, 
	 	'Qu’y a-t-il au-delà du monde connu ? L’Ombreterre, lieu du dernier repos de toutes les âmes mortelles ayant jamais existé, qu’elles aient été vertueuses ou viles.', 
	 	'2020-11-24', 
	 	4),
	('Diablo III',
		19.99,
		'Vingt ans se sont écoulés depuis que les démons primordiaux ont été vaincus et bannis du monde de Sanctuaire. Il vous faut aujourd’hui revenir là où tout a commencé, dans la ville de Tristram',
		'2012-05-15',
		3),
	('Assassin''s Creed : Valhalla', 
	 	59.99, 
	 	'Devenez une légende Viking en quête de gloire. Partez en raids, améliorez votre campement, et méritez votre place au Valhalla.', 
	 	'2020-11-10', 
	 	3);
INSERT INTO jeu (titre,description,date_disponible,id_audience)
VALUES 
	('Apex Legends', 
	 	'Dominez le champs de bataille graces à des personnages dotés de compétences dans ce battle royale.', 
	 	'2019-02-04', 
	 	4);
		
INSERT INTO utilisateur (pseudo, email, date_naissance)
	VALUES
		('Aurore', 'moz@moz.fr', '1985-12-15'),
		('gargamelle', 'gargamelle@gargamelle.fr', '1986-11-15'),
		('kathyrob', 'kathyrob@kathyrob.fr', '1987-06-08'),
		('Pipi59', 'Pipi59^Pipi59.fr', '1985-12-12'),
		('Nico', 'Nico@Nico.fr', '1987-08-15'),
		('Marina', 'Marina@Marina.fr', '1988-12-07'),
		('Antonin', 'Antonin@Antonin.fr', '1989-12-15'),
		('Baptiste62', 'Baptiste62@Baptiste62.fr', '1988-07-14'),
		('Kéké59', 'Kéké59@Kéké59.fr', '1990-12-15');
		
INSERT INTO genre_jeu (id_jeu, id_genre) 
VALUES
	(1, 7),
	(2, 7),
	(3, 7),
	(4, 3),
	(4, 1),
	(5, 2),
	(6, 8),
	(7, 8),
	(8, 4),
	(9, 6),
	(10, 7),
	(11, 5),
	(12, 2),
	(12, 3),
	(13, 1);
	
INSERT INTO genre_utilisateur (id_utilisateur, id_genre) 
VALUES
	(1, 7),
	(2, 7),
	(3, 7),
	(4, 3),
	(4, 1),
	(5, 2),
	(6, 8),
	(7, 8);