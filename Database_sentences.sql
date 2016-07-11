DROP DATABASE IF EXIST momentastik;
CREATE DATABASE momentastik;
USE momentastik;

CREATE TABLE IF NOT EXISTS TypeUser (
 type ENUM ('Admin', 'Moderator', 'User','Town_hall') PRIMARY KEY NOT NULL DEFAULT 'User'

);

CREATE TABLE User{

id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
name varchar(30),
email varchar(30)
userConfirmed tinyint(1) DEFAULT 0,
password(30),
accountEnable tinyint(1) DEFAULT 1,
typeUser ENUM ('Admin', 'Moderator', 'User','Town_hall'),
FOREIGN KEY (typeUser) REFERENCES TypeUser(type)
}

CREATE TABLE ScoreCommentEvent{
 id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
 score int(5),
 date date,
 text varchar (600),
 idUser int,
 idEvent int ,
 FOREIGN KEY (idUser) REFERENCES User(idUser),
 FOREIGN KEY (idEvent) REFERENCES Event(idEvent)
}

CREATE TABLE ScoreCommentPlace{
 id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
 score int(5),
 date date,
 text varchar (600),
 idUser int,
 idEvent int,
 FOREIGN KEY (idUser) REFERENCES User(idUser),
 FOREIGN KEY (idEvent) REFERENCES Event(idEvent)

}

CREATE TABLE FavouritePlace{
id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
date date,
idUser int,
idPlace int,
FOREIGN KEY (idUser) REFERENCES User(idUser),
FOREIGN KEY (idPlace) REFERENCES Event(idPlace)
}

CREATE TABLE FavouriteEvent{
id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
date date,
idUser int,
idPlace int,
FOREIGN KEY (idUser) REFERENCES User(idUser),
FOREIGN KEY (idEvent) REFERENCES Event(idEvent)
}

CREATE TABLE Event{
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  data date,
  title varchar(30),
  subtitle varchar(30),
  description varchar(600),
  longi float (10,6),
  lati float (10,6),
  scoreGlobal float(2,1),
  tlf int(12),
  email varchar(30),
  price int(4),
  maxUsers int (3),
  idPlace int,
  idUser int,
  FOREIGN KEY (idUser) REFERENCES User(idUser),
  FOREIGN KEY (idPlace) REFERENCES Event(idPlace)
}

CREATE TABLE Card{
id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
title varchar (10),
urlImage varchar(50),
idFather int(3)
}

CREATE TABLE Place{
 id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
 name varchar(30),
 longi float(10,6),
 lati float(10,6),
 description varchar(600)
}

CREATE TABLE ImageEvent{
id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
urlImage varchar(30),
idEvent int,
FOREIGN KEY (idEvent) REFERENCES Event(idEvent)
}

CREATE TABLE ImagePlace{
id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
urlImage varchar(30),
idEvent int,
FOREIGN KEY (idPlace) REFERENCES Place(idPlace)
}

/*NEW TABLES AFTER RELATIONAL PROCESS*/
CREATE TABLE R_Card_User {
id int PRIMARY KEY NOT NULL,
idCard int ,
idUser int ,
FOREIGN KEY (idCard) REFERENCES Event(idCard),
FOREIGN KEY (idUser) REFERENCES User(idUser)


}

CREATE TABLE R_USER_EVENT_2 {
id int PRIMARY KEY NOT NULL,
idEvent int,
idUser int,
FOREIGN KEY (idEvent) REFERENCES Event(idEvent),
FOREIGN KEY (idUser) REFERENCES User(idUser)
}

CREATE TABLE R_CARD_PLACE {
id int PRIMARY KEY NOT NULL,
idPlace int,
idCard int,
FOREIGN KEY (idPlace) REFERENCES Place(idPlace),
FOREIGN KEY (idCard) REFERENCES Card(idCard)
}

CREATE TABLE R_CARD_EVENT {
id int PRIMARY KEY NOT NULL,
idEvent int,
idCard int,
FOREIGN KEY (idEvent) REFERENCES Event(idEvent),
FOREIGN KEY (idCard) REFERENCES Card(idCard)

}
