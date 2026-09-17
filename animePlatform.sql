create database animePlatform;
use animePlatform;

create TABLE user (
userID int AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(75) NOT NULL,
email VARCHAR(200) NOT NULL UNIQUE,
join_date TIMESTAMP default current_timestamp
);

create TABLE review (
reviewID int AUTO_INCREMENT PRIMARY KEY,
rating decimal(10,1)  NOT NULL,
reviewComment VARCHAR(225) NOT NULL,
review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

create TABLE anime (
animeID int AUTO_INCREMENT PRIMARY KEY,
title varchar(225) NOT NULL,
studio varchar(250) NOT NULL,
expisode_count int NOT NULL,
status enum("Completed", "On Going", "Airing")
);

create TABLE genre (
genreID int AUTO_INCREMENT PRIMARY KEY,
genre_name varchar(50) NOT NULL
);


insert into user(username,email)values("kazuki","test@gmail.com");
insert into user(username,email)values("xiaomai","xiao@gmail.com");
insert into user(username,email)values("dingdong","pong@gmail.com");
insert into user(username,email)values("Michael","mj@gmail.com");
insert into user(username,email)values("pette","peter@gmail.com");
insert into user(username,email)values("joe","joe@gmail.com");

select * from user;

insert into anime(title,studio,expisode_count,status)values("The Angel Next Door Spoils Me Rotten","Project No.9", 24, "Completed");
insert into anime(title,studio,expisode_count,status)values("One Punch Man (S1)","Madhouse", 12, "Completed");
insert into anime(title,studio,expisode_count,status)values("Black Clover","Studio Pierrot", 170, "On Going");
insert into anime(title,studio,expisode_count,status)values("Arknights","Yostar Pictures", 26, "On Going");
insert into anime(title,studio,expisode_count,status)values("Vermeil In Gold","Staple Entertainment", 12, "Completed");
insert into anime(title,studio,expisode_count,status)values("One Piece","Toei Animation", 1177, "On Going");
insert into anime(title,studio,expisode_count,status)values("Jujutsu Kaisen","Mappa", 59, "Completed");
insert into anime(title,studio,expisode_count,status)values("Date A Live","J.C.Staff.", 58, "Completed");

select * from anime;