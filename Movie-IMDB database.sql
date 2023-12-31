show databases;
create database movie;
use movie; 

-- create movie table

create table movies (mov_id int primary key NOT NULL,mov_title varchar(30),mov_year int NOT NULL,mov_lang varchar(30));
desc movies;

-- create media table

create table media(med_id int primary key NOT NULL,med_type varchar(30),mov_id int NOT NULL,foreign key (mov_id) references movies(mov_id));
desc media;

-- insert the data from movies--

insert into movies (mov_id,mov_title,mov_year,mov_lang) values (1,'Vaathi',2023,'Tamil');
insert into movies (mov_id,mov_title,mov_year,mov_lang) values (2,'Vikram vedha',2017,'Tamil');
insert into movies (mov_id,mov_title,mov_year,mov_lang) values (3,'Premam',2015,'Malayalam');

-- insert the data from media--

insert into media (med_id,med_type,mov_id) values(11,'image',1);
insert into media (med_id,med_type,mov_id) values(12,'image',2);
insert into media (med_id,med_type,mov_id) values(13,'image',3);

-- show the table movies and media---
select * from movies;
select * from media; 

--create the genres table--

create table genres (gen_id int primary key NOT NULL,gen_title varchar(30));

-- create the movie genres table--

create table movie_genres (mov_id int NOT NULL,gen_id int NOT NULL,foreign key (mov_id) references movies(mov_id),foreign key (gen_id) references genres(gen_id));
desc movie_genres;

--insert the data from genres table--

insert into genres (gen_id,gen_title) values (21,'Drama');
insert into genres (gen_id,gen_title) values (22,'Romance');
insert into genres (gen_id,gen_title) values (23,'Comedy');
 insert into genres (gen_id,gen_title) values (24,'Action');
select * from genres;

-- insert the data from moviegenres table--

insert into movie_genres(mov_id,gen_id) values(1,21);
insert into movie_genres(mov_id,gen_id) values(1,22);
insert into movie_genres(mov_id,gen_id) values(1,24);
insert into movie_genres(mov_id,gen_id) values(2,21);
insert into movie_genres(mov_id,gen_id) values(2,24);
insert into movie_genres(mov_id,gen_id) values(3,21);
insert into movie_genres(mov_id,gen_id) values(3,22);
insert into movie_genres(mov_id,gen_id) values(3,23);
insert into movie_genres(mov_id,gen_id) values(3,24);
select * from movie_genres; 

-- create the user table--
create table user(user_id int primary key NOT NULL,user_name varchar(30));

-- create the review table--

create table reviews(rev_id int primary key NOT NULL ,user_id int NOT NULL,mov_id int NOT NULL,rev_rating int NOT NULL,foreign key(user_id) references user(user_id),foreign key(mov_id) references movies(mov_id));

--insert the data from the user table--

insert into user(user_id,user_name) values (101,'Nisha');
insert into user(user_id,user_name) values (102,'San');
insert into user(user_id,user_name) values (103,'Priya');
insert into user(user_id,user_name) values (104,'Meena');
insert into user(user_id,user_name) values (105,'Anu');

-- insert the data from the review tables--

insert into reviews(rev_id,user_id,mov_id,rev_rating) values (51,101,1,5);
insert into reviews(rev_id,user_id,mov_id,rev_rating) values (52,101,2,4.5);
insert into reviews(rev_id,user_id,mov_id,rev_rating) values (53,101,3,5);
insert into reviews(rev_id,user_id,mov_id,rev_rating) values (54,103,2,5);
insert into reviews(rev_id,user_id,mov_id,rev_rating) values (55,102,3,5);
insert into reviews(rev_id,user_id,mov_id,rev_rating) values (56,104,1,5);
insert into reviews(rev_id,user_id,mov_id,rev_rating) values (57,105,2,5);

--show the user and review table--

select * from user;
select * from reviews; 

-- create and insert the artist table--

create table artist(art_id int primary key NOT NULL,art_name varchar(30),art_gender varchar(10),mov_id int NOT NULL,foreign key(mov_id) references movies(mov_id));
insert into artist(art_id,art_name,art_gender,mov_id) values (1,'Dhanush','Male',1);
insert into artist(art_id,art_name,art_gender,mov_id) values (2,'Madhavan,sethupathi','Male',2);
insert into artist(art_id,art_name,art_gender,mov_id) values (3,'NivinPauly','Male',3); 
select * from artist;

-- create and insert skills table--

create table skills(skill_id int primary key NOT NULL,skill_type varchar(30));
insert into skills(skill_id,skill_type) values(1,'Acting');
insert into skills(skill_id,skill_type) values(2,'Dance');
insert into skills(skill_id,skill_type) values(3,'Comedy');
insert into skills(skill_id,skill_type) values(4,'fight');

--create the artistskill table and insert the data from the table--

create table artist_skill(as_id int primary key NOT NULL,skill_id int NOT NULL,
	art_id int NOT NULL,mov_id int NOT NULL,foreign key(mov_id) references movies(mov_id),foreign key(art_id) references artist(art_id),
    foreign key(skill_id) references skills(skill_id));
insert into artist_skill(as_id,skill_id,art_id,mov_id) values (1,1,1,1);
insert into artist_skill(as_id,skill_id,art_id,mov_id) values (2,1,1,1);
insert into artist_skill(as_id,skill_id,art_id,mov_id) values (3,2,1,1);
insert into artist_skill(as_id,skill_id,art_id,mov_id) values (4,3,1,1);
insert into artist_skill(as_id,skill_id,art_id,mov_id) values (5,4,1,1);
insert into artist_skill(as_id,skill_id,art_id,mov_id) values (6,1,2,2);
insert into artist_skill(as_id,skill_id,art_id,mov_id) values (7,4,2,2);
insert into artist_skill(as_id,skill_id,art_id,mov_id) values (8,1,3,3);
insert into artist_skill(as_id,skill_id,art_id,mov_id) values (9,2,3,3);
insert into artist_skill(as_id,skill_id,art_id,mov_id) values (10,3,3,3);
insert into artist_skill(as_id,skill_id,art_id,mov_id) values (11,4,3,3);
select * from artist_skill;

--create the role table and insert the role data--

create table role(role_id int primary key NOT NULL,role_name varchar(30));
insert into role(role_id,role_name) values(1,'Hero');
insert into role(role_id,role_name) values(2,'Teacher');
 -- insert into role(role_id,role_name) values(3,'Police');
 -- insert into role(role_id,role_name) values(4,'Student');
insert into role(role_id,role_name) values(5,'Rowdy');
select * from role;

--create the artist role table and insert the data--

create table artist_role(artrole_id int primary key NOt NULL,role_id int NOT NULL,mov_id int NOT NULL,art_id int NOT NULL,
foreign key(role_id) references role(role_id),foreign key(mov_id) references movies(mov_id),
foreign key(art_id) references artist(art_id));
insert into artist_role(artrole_id,role_id,mov_id,art_id) values(1,1,1,1);
insert into artist_role(artrole_id,role_id,mov_id,art_id) values(2,2,1,1);
insert into artist_role(artrole_id,role_id,mov_id,art_id) values(3,1,2,2);
insert into artist_role(artrole_id,role_id,mov_id,art_id) values(4,3,2,2);
insert into artist_role(artrole_id,role_id,mov_id,art_id) values(5,5,2,2);
insert into artist_role(artrole_id,role_id,mov_id,art_id) values(6,1,3,3);
insert into artist_role(artrole_id,role_id,mov_id,art_id) values(7,4,3,3);
select * from artist_role;
