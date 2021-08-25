CREATE TABLE employe (
	id serial PRIMARY KEY,
	nom character varying(30) NOT NULL,
	prenom character varying(30) NOT NULL,
	numero_salarie character varying(4) NOT NULL
);


CREATE TABLE todo (
	id serial PRIMARY KEY,
	nom character varying(30) NOT NULL,
	description character varying(100),
	date_fin date,
	id_employe integer REFERENCES employe ON DELETE CASCADE NOT NULL 
	);


CREATE TABLE etiquette (
	id serial PRIMARY KEY,
	libelle character varying(30) NOT NULL
);


CREATE TABLE etiquette_todo (
	id serial PRIMARY KEY,
	id_etiquette integer REFERENCES etiquette ON DELETE CASCADE NOT NULL,
	id_todo integer REFERENCES todo ON DELETE CASCADE NOT NULL
)