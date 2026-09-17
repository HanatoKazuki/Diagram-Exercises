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
status enum("Completed", "OnGoing", "Upcoming")
);

create TABLE genre (
genreID int AUTO_INCREMENT PRIMARY KEY,
genre_name enum("Action", "Romance", "Theory") NOT NULL
);

create TABLE JOINTABLE (
animeID INT NOT NULL,
genreID INT NOT NULL,
PRIMARY KEY (animeID, genreID),
FOREIGN KEY (animeID) REFERENCES anime(animeID),
FOREIGN KEY (genreID) REFERENCES genre(genreID)
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
insert into anime(title,studio,expisode_count,status)values("Black Clover","Studio Pierrot", 170, "OnGoing");
insert into anime(title,studio,expisode_count,status)values("Arknights","Yostar Pictures", 26, "Upcoming");
insert into anime(title,studio,expisode_count,status)values("Vermeil In Gold","Staple Entertainment", 12, "Completed");
insert into anime(title,studio,expisode_count,status)values("One Piece","Toei Animation", 1177, "OnGoing");
insert into anime(title,studio,expisode_count,status)values("Jujutsu Kaisen","Mappa", 59, "Completed");
insert into anime(title,studio,expisode_count,status)values("Date A Live","J.C.Staff.", 58, "Completed");

insert into genre (genre_name)values("Action");
insert into genre (genre_name)values("Romance");
insert into genre (genre_name)values("Theory");

insert into JOINTABLE (animeID, genreID)values(1,2),(2,1),(3,1),(4,3),(5,2),(6,1),(7,1),(8,2);

ALTER TABLE review
ADD COLUMN userID int NOT NULL;
ALTER TABLE review
ADD COLUMN animeID INT NOT NULL;

INSERT INTO review (rating, reviewComment, userID, animeID) VALUES
(9.5, "Absolutely wholesome, Mahiru is the best girl", 1, 1),
(8.0, "Saitama never disappoints, great comedic timing", 2, 2),
(7.5, "Asta's screaming gets old but the story is solid", 3, 3),
(6.0, "Still waiting for more episodes to release", 4, 4),
(8.5, "Alto and Vermeil have great chemistry", 5, 5),
(9.8, "Best long running shonen of all time", 6, 6),
(9.0, "Gojo is the most hype character in anime", 1, 7),
(7.0, "Spirits and magic done really well", 2, 7),
(6.5, "A bit slow paced but decent world building", 3, 8),
(8.2, "One Piece keeps getting better with each arc", 4, 6);

SELECT anime.title, genre.genre_name
FROM anime
LEFT JOIN JOINTABLE ON anime.animeID = JOINTABLE.animeID
LEFT JOIN genre ON JOINTABLE.genreID = genre.genreID;

SELECT user.username, COUNT(review.reviewID) AS total_reviews
FROM user
LEFT JOIN review ON user.userID = review.userID
GROUP BY user.userID, user.username;

SELECT user.username, COUNT(review.reviewID) AS total_reviews
FROM user
LEFT JOIN review ON user.userID = review.userID
GROUP BY user.userID, user.username; 

SELECT anime.title, count(review.reviewID) FROM anime
LEFT JOIN review on anime.animeID = review.animeID
where anime.status = "Completed"
GROUP BY anime.title, anime.animeID;

SELECT anime.title, genre.genre_name
FROM anime
LEFT JOIN JOINTABLE ON anime.animeID = JOINTABLE.animeID
LEFT JOIN genre ON JOINTABLE.genreID = genre.genreID;

SELECT user.username, COUNT(review.reviewID) AS review_count
FROM user
LEFT JOIN review ON user.userID = review.userID
GROUP BY user.username, user.userID
HAVING COUNT(review.reviewID) > 2;

SELECT review.rating, anime.title, user.username
FROM review
INNER JOIN anime ON review.animeID = anime.animeID
INNER JOIN user ON review.userID = user.userID
WHERE review.rating >= 8;

SELECT anime.title, anime.studio, ROUND(AVG(review.rating), 1) AS average_rating
FROM anime
LEFT JOIN review ON anime.animeID = review.animeID
GROUP BY anime.animeID, anime.title, anime.studio
ORDER BY average_rating DESC
LIMIT 1;

select * from anime;
select * from genre;
select * from JOINTABLE;
select * from review;


drop table genre;
drop table anime;
drop table JOINTABLE;