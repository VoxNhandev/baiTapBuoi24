CREATE DATABASE login
CHARACTER SET "utf8mb4"
COLLATE "utf8mb4_general_ci";

USE login;

CREATE TABLE users(
	id int auto_increment,
	email varchar(200) not null,
	passwords varchar(250) not null,
	firstName varchar(100) not null,
	lastName varchar(100) not null,
	userName varchar(150) not null,
	fullName varchar(150) not null,
	phone varchar(15) not null,
	id_role int not null,
	image varchar(255),
	
	primary key (id)
);

CREATE TABLE role_edges(
	id int auto_increment,
	name varchar(150) not null,
	description varchar(255) null ,
	
	PRIMARY KEY (id)
);

CREATE TABLE project(
	id int auto_increment,
	name varchar(150) not null,
	startDate date not null,
	endDate date not null,
	
	PRIMARY KEY (id)
);

CREATE TABLE project_user(
	id_user int not null,
	id_project int not null,
	createDate date not null,
	
	PRIMARY KEY (id_user, id_project)
);

CREATE TABLE job(
	id int auto_increment,
	name varchar(200) not null,
	content text not null,
	startDate date not null,
	endDate date not null,
	id_project int not null,
	
	PRIMARY KEY (id)
);

CREATE TABLE status(
	id int auto_increment,
	name varchar(100),
	
	PRIMARY KEY (id)
);

CREATE TABLE job_status_users(
	id_user int not null,
	id_status int not null,
	id_job int not null,
	
	PRIMARY KEY (id_user, id_status,id_job)
);

ALTER TABLE job_status_users ADD CONSTRAINT Fk_id_user_job_status_users FOREIGN KEY (id_user) REFERENCES users(id);
ALTER TABLE job_status_users ADD CONSTRAINT Fk_id_status_job_status_users FOREIGN KEY (id_status) REFERENCES status(id);
ALTER TABLE job_status_users ADD CONSTRAINT Fk_id_job_job_status_users FOREIGN KEY (id_job) REFERENCES job(id);

ALTER TABLE job ADD CONSTRAINT Fk_id_project_job FOREIGN KEY (id_project) REFERENCES project(id);

ALTER TABLE project_user ADD CONSTRAINT Fk_id_user_project_user FOREIGN KEY (id_user) REFERENCES users(id);
ALTER TABLE project_user ADD CONSTRAINT Fk_id_project_project_user FOREIGN KEY (id_project) REFERENCES project(id);

ALTER TABLE users ADD CONSTRAINT Fk_id_role_users FOREIGN KEY (id_role) REFERENCES role_edges(id);