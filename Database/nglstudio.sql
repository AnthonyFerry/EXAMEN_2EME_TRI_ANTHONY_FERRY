DROP TABLE IF EXISTS CLIENT ;
CREATE TABLE CLIENT (
	id_client BIGINT  AUTO_INCREMENT NOT NULL,
	prenom VARCHAR(16), 
	nom VARCHAR(16), 
	code_postal VARCHAR(5), 
	ville VARCHAR(16), 
	rue VARCHAR(64), 
	PRIMARY KEY (id_client) ) ENGINE=InnoDB;  

DROP TABLE IF EXISTS PROJET ; 
CREATE TABLE PROJET (
	id_projet BIGINT  AUTO_INCREMENT NOT NULL, 
	nom_projet VARCHAR(64), 
	categorie_projet VARCHAR(16), 
	description_projet TEXT, 
	date_debut DATE, 
	date_fin DATE, 
	budget FLOAT, 
	PRIMARY KEY (id_projet) ) ENGINE=InnoDB; 

DROP TABLE IF EXISTS TACHE ; 
CREATE TABLE TACHE (
	id_tache BIGINT  AUTO_INCREMENT NOT NULL, 
	libelle_tache VARCHAR(64), 
	deadline DATE, 
	statut_tache VARCHAR(16), 
	id_projet BIGINT NOT NULL, 
	PRIMARY KEY (id_tache) ) ENGINE=InnoDB;  

DROP TABLE IF EXISTS nglstudio;
CREATE DATABASE nglstudio ;

USE nglstudio;

DROP TABLE IF EXISTS RESSOURCE ; 
CREATE TABLE RESSOURCE (
	id_ressource BIGINT  AUTO_INCREMENT NOT NULL, 
	type_ressource VARCHAR(16), 
	PRIMARY KEY (id_ressource) ) ENGINE=InnoDB;  

DROP TABLE IF EXISTS NOTE ; 
CREATE TABLE NOTE (id_note BIGINT  AUTO_INCREMENT NOT NULL, 
	libelle_note VARCHAR(16), 
	contenu_note TEXT, 
	id_projet BIGINT NOT NULL, 
	id_utilisateur BIGINT NOT NULL, 
	PRIMARY KEY (id_note) ) ENGINE=InnoDB;  

DROP TABLE IF EXISTS UTILISATEUR ; 
CREATE TABLE UTILISATEUR (id_utilisateur BIGINT  AUTO_INCREMENT NOT NULL, 
	nom_utilisateur VARCHAR(16), 
	prenom_utilisateur BIGINT(16), 
	mail_utilisateur BIGINT(512), 
	passe_utilisateur VARCHAR(40), 
	PRIMARY KEY (id_utilisateur) ) ENGINE=InnoDB;  

DROP TABLE IF EXISTS CLIENT_PROJET ; 
CREATE TABLE CLIENT_PROJET (
	id_client BIGINT  AUTO_INCREMENT NOT NULL, 
	id_projet BIGINT NOT NULL, 
	PRIMARY KEY (id_client,  id_projet) ) ENGINE=InnoDB;  

DROP TABLE IF EXISTS RESSOURCE_PROJET ; 
CREATE TABLE RESSOURCE_PROJET (id_ressource BIGINT  AUTO_INCREMENT NOT NULL, 
	id_projet BIGINT NOT NULL, 
	montant_ressource INT, 
	PRIMARY KEY (id_ressource,  id_projet) ) ENGINE=InnoDB;  

DROP TABLE IF EXISTS UTILISATEUR_TACHE ; 
CREATE TABLE UTILISATEUR_TACHE (
	id_utilisateur BIGINT  AUTO_INCREMENT NOT NULL, 
	id_tache BIGINT NOT NULL, 
	PRIMARY KEY (id_utilisateur,  id_tache) ) ENGINE=InnoDB;  

DROP TABLE IF EXISTS UTILISATEUR_PROJET ; 
CREATE TABLE UTILISATEUR_PROJET (
	id_projet BIGINT  AUTO_INCREMENT NOT NULL, 
	id_utilisateur BIGINT NOT NULL, 
	PRIMARY KEY (id_projet,  id_utilisateur) ) ENGINE=InnoDB;

ALTER TABLE TACHE ADD CONSTRAINT FK_TACHE_id_projet FOREIGN KEY (id_projet) REFERENCES PROJET (id_projet);
ALTER TABLE NOTE ADD CONSTRAINT FK_NOTE_id_projet FOREIGN KEY (id_projet) REFERENCES PROJET (id_projet); 
ALTER TABLE NOTE ADD CONSTRAINT FK_NOTE_id_utilisateur FOREIGN KEY (id_utilisateur) REFERENCES UTILISATEUR (id_utilisateur); 
ALTER TABLE CLIENT_PROJET ADD CONSTRAINT FK_CLIENT_PROJET_id_client FOREIGN KEY (id_client) REFERENCES CLIENT (id_client); 
ALTER TABLE CLIENT_PROJET ADD CONSTRAINT FK_CLIENT_PROJET_id_projet FOREIGN KEY (id_projet) REFERENCES PROJET (id_projet); 
ALTER TABLE RESSOURCE_PROJET ADD CONSTRAINT FK_RESSOURCE_PROJET_id_ressource FOREIGN KEY (id_ressource) REFERENCES RESSOURCE (id_ressource); 
ALTER TABLE RESSOURCE_PROJET ADD CONSTRAINT FK_RESSOURCE_PROJET_id_projet FOREIGN KEY (id_projet) REFERENCES PROJET (id_projet);
ALTER TABLE UTILISATEUR_TACHE ADD CONSTRAINT FK_UTILISATEUR_TACHE_id_utilisateur FOREIGN KEY (id_utilisateur) REFERENCES UTILISATEUR (id_utilisateur); 
ALTER TABLE UTILISATEUR_TACHE ADD CONSTRAINT FK_UTILISATEUR_TACHE_id_tache FOREIGN KEY (id_tache) REFERENCES TACHE (id_tache); 
ALTER TABLE UTILISATEUR_PROJET ADD CONSTRAINT FK_UTILISATEUR_PROJET_id_projet FOREIGN KEY (id_projet) REFERENCES PROJET (id_projet); 
ALTER TABLE UTILISATEUR_PROJET ADD CONSTRAINT FK_UTILISATEUR_PROJET_id_utilisateur FOREIGN KEY (id_utilisateur) REFERENCES UTILISATEUR (id_utilisateur);