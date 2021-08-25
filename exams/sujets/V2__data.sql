INSERT INTO etiquette(nom) VALUES ('patron');
INSERT INTO etiquette(nom) VALUES ('boulot');

INSERT INTO todo (nom,description,termine,date_fin)
    VALUES('cirer les pompes','faire des compliments au boss',false, '2021-08-17');
INSERT INTO todo (nom,description,termine,date_fin)
    VALUES('reu importante','preparer la reunion du 12',true, '2021-08-11');
	
INSERT INTO todo_etiquette(id_todo, id_etiquette)
    VALUES (1,1);
INSERT INTO todo_etiquette(id_todo, id_etiquette)
    VALUES (1,2);
INSERT INTO todo_etiquette(id_todo, id_etiquette)
    VALUES (2,2);