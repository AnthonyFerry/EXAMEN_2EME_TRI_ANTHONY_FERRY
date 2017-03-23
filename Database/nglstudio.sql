drop database if exists nglstudio;
create database nglstudio ;

use nglstudio;

drop table if exists client;
create table client (
	id_client bigint auto_increment not null primary key,
	prenom varchar(16), 
	nom varchar(16), 
	code_postal varchar(5), 
	ville varchar(16), 
	rue varchar(64)) ENGINE=InnoDB;  

drop table if exists projet ; 
create table projet (
	id_projet bigint  auto_increment not null primary key, 
	nom_projet varchar(64), 
	categorie_projet varchar(16), 
	description_projet text, 
	date_debut date, 
	date_fin date, 
	budget float) ENGINE=InnoDB; 

drop table if exists tache ; 
create table tache (
	id_tache bigint  auto_increment not null primary key, 
	libelle_tache varchar(64), 
	deadline date, 
	statut_tache varchar(16), 
	id_projet bigint not null,

	foreign key (id_projet) references projet (id_projet)) ENGINE=InnoDB;  

drop table if exists ressource ; 
create table ressource (
	id_ressource bigint  auto_increment not null primary key, 
	type_ressource varchar(16)) ENGINE=InnoDB;  

drop table if exists utilisateur ; 
create table utilisateur (
	id_utilisateur bigint  auto_increment not null primary key, 
	nom_utilisateur varchar(16), 
	prenom_utilisateur varchar(16), 
	mail_utilisateur varchar(512), 
	passe_utilisateur varchar(40)) ENGINE=InnoDB;  

drop table if exists note ; 
create table note (
	id_note bigint  auto_increment not null primary key, 
	libelle_note varchar(16), 
	contenu_note text, 
	id_projet bigint not null, 
	id_utilisateur bigint not null,

	foreign key (id_projet) references projet (id_projet),
	foreign key (id_utilisateur) references utilisateur (id_utilisateur)) ENGINE=InnoDB;  

drop table if exists client_projet ; 
create table client_projet (
	id_client bigint not null, 
	id_projet bigint not null,

	primary key (id_client, id_projet),

	foreign key (id_client) references client (id_client),
	foreign key (id_projet) references projet (id_projet)) ENGINE=InnoDB;  

drop table if exists ressource_projet ; 
create table ressource_projet (
	id_ressource bigint not null, 
	id_projet bigint not null, 
	montant_ressource int,

	primary key (id_ressource, id_projet),

	foreign key (id_ressource) references ressource (id_ressource),
	foreign key (id_projet) references projet (id_projet)) ENGINE=InnoDB;  

drop table if exists utilisateur_tache ; 
create table utilisateur_tache (
	id_utilisateur bigint not null, 
	id_tache bigint not null,

	primary key (id_utilisateur, id_tache),

	foreign key (id_utilisateur) references utilisateur (id_utilisateur),
	foreign key (id_tache) references tache (id_tache)) ENGINE=InnoDB;  

drop table if exists utilisateur_projet ; 
create table utilisateur_projet (
	id_projet bigint not null, 
	id_utilisateur bigint not null,

	primary key (id_projet, id_utilisateur),

	foreign key (id_projet) references projet (id_projet),
	foreign key (id_utilisateur) references utilisateur (id_utilisateur)) ENGINE=InnoDB;    