create table todo(
    id SERIAL PRIMARY KEY,
    nom CHARACTER VARYING (50) NOT NULL,
    description CHARACTER VARYING (150) NOT NULL,
    termine BOOLEAN,
    date_fin Date
);

create table etiquette(
    id SERIAL PRIMARY KEY,
    nom CHARACTER VARYING (25) NOT NULL
);

create table todo_etiquette(
    id_todo INTEGER REFERENCES todo,
    id_etiquette INTEGER REFERENCES etiquette
);