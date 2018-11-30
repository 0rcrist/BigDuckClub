
#drop table if exists mydb.game;
#drop table if exists mydb.user;
#drop table if exists mydb.team;
#drop table if exists mydb.players;
#drop table if exists mydb.user;
#drop table if exists mydb.match;

DROP DATABASE mydb;
CREATE DATABASE mydb;
use mydb;
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `Id` VARCHAR(45) NOT NULL DEFAULT 'nerd',
  `points` INT NULL,
  `password` VARCHAR(45) NULL,
  `right` INT NULL DEFAULT 0,
  `wrong` INT NULL DEFAULT 0,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`Game` (
  `Name` VARCHAR(45) NOT NULL,
  `publisher` VARCHAR(45) NULL,
  `matchSize` INT NULL,
  `genre` VARCHAR(45) NULL,
  PRIMARY KEY (`Name`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`Team` (
  `Name` VARCHAR(45) NOT NULL,
  `Tname` varchar(45) NOT NULL,
  `size` INT NULL,
  `win` INT NULL,
  `lose` INT NULL,
  `region` VARCHAR(45) NULL,
  `rank` INT NULL,
  PRIMARY KEY (`Tname`),
    FOREIGN KEY (`Name`)
    REFERENCES `mydb`.`Game` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`Players` (
  `Name` VARCHAR(45) NOT NULL,
  `Tname` VARCHAR(45) NOT NULL,
  `IGN` VARCHAR(45) NOT NULL,
  `KDA` long NOT NULL,
  `experiance` VARCHAR(45) NULL,
  `nation` VARCHAR(45) NULL,
  PRIMARY KEY (`IGN`),
  INDEX `teamName_idx` (`Tname` ASC) ,
    FOREIGN KEY (`Tname`)
    REFERENCES `mydb`.`Team` (`Tname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`Match` (
  `idMatch` INT NOT NULL,
  `teamA` VARCHAR(45) NULL,
  `teamB` VARCHAR(45) NULL,
  `winner` VARCHAR(45) NULL,
  `scoreA` INT NULL,
  `scoreB` INT NULL,
  `happend` TINYINT NULL,
  `tournment` VARCHAR(45) NULL,
  `ofGame` VARCHAR(45) NULL,
  PRIMARY KEY (`idMatch`),
  INDEX `ofGame_idx` (`ofGame` ASC),
  INDEX `teamA_idx` (`teamA` ASC) ,
  INDEX `teamB_idx` (`teamB` ASC) ,
    FOREIGN KEY (`ofGame`)
    REFERENCES `mydb`.`Game` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`teamA`)
    REFERENCES `mydb`.`team` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`teamB`)
    REFERENCES `mydb`.`team` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

#commented these out so it wont fail if they already exist
INSERT INTO game ( Name, publisher, matchSize, genre) VALUES
("League of Legends", "Riot Games", 5, "MOBA"),
("Super Smash Bros Melee", "Nintendo", 1,"fighter");

INSERT INTO user ( id ) VALUES
("Juan"),
("Casey"),
("Dylan");

INSERT INTO mydb.Team (Name, Tname, size ,win , lose, region) VALUES
("League of Legends","100 Thieves", 5, 21, 21, "NA"),
("League of Legends","Bombers", 5, 10, 18, "OCE"),
("League of Legends","Invictus Gaming", 5 , 58, 22, "CN"),
("League of Legends","JD Gaming", 5, 42, 28, "CN"),
("League of Legends","Cloud9", 5, 31, 20, "NA"),
("League of Legends","Team Liquid",5,23,12,"NA"),
("League of Legends","Team SoloMid",5,22,19, "NA");


insert into mydb.Players (`name`, `Tname`, `IGN`, `KDA`, `nation`) values
("Kevin Yarnell", "Team SoloMid", "Hauntzer", 3.3, "USA"),
("Jonathan Armao", "Team SoloMid", "Grig", 3.9, "USA"),
("Soren Bjerg","Team SoloMid", "Bjergsen", 5.0, "Denmark" ),
("Jesper Svenningsen", "Team SoloMid", "Zven", 4.4, "Denmark"),
("Alfonso Aguirre Rodriguez","Team SoloMid","Mithy",3.3, "Spain"),
("Eric Ritchie","Cloud9","Licorice",3.5 ,"Canada"),
("Dennis Johnson","Cloud9","Szenskeren",3.8 ,"Denmark"),
("Nicolaj Jensen","Cloud9","Jensen", 5.0,"Denmark"),
("Zachary Scuderi","Cloud9","Sneaky",4.3 ,"USA"),
("Tristen Stidam","Cloud9","Zeyzal", 3.6,"USA"),
("Kim Chan-ho","100 Thieves","ssumday",4.7 ,"S.Korea"),
("Andy Hoang","100 Thieves","AnDa", 3.7,"Canada"),
("Yoo Sang-wook","100 Thieves","Ryu", 3.4,"S.Korea"),
("Richard Samuel oh","100 Thieves","Rikara", 4.1,"USA"),
("Zaqueri Black","100 Thieves","Aphromoo",2.9 ,"USA"),
("Kang Seung-lok","Invictus Gaming","TheShy",3.3 ,"S.Korea"),
("Gao Zhen-Ning","Invictus Gaming","Ning",3.5,"China"),
("Song Eui-jin","Invictus Gaming","RooKie",5.5 ,"S.Korea"),
("Yu Wen-Bo","Invictus Gaming","Jackey Love", 4.1,"China"),
("Wang Liu-Yi","Invictus Gaming","Boalan", 4.6,"China"),
("Christian Tiensuu","Bombers","Sleeping",2.6 ,"Finland"),
("Sebastion de Cegile","Bombers","Seb",2.6 ,"Italy"),
("Carlo la Civita","Bombers","Looch",3.1 ,"Australia"),
("Alan Roger","Bombers","Tiger", 2.9,"Tunisia"),
("Andrew Rose","Bombers","Rosey",2.5 ,"Australia"),
("Zhang Xing-Ran","JD Gaming","Zoom",3.9 ,"China"),
("Kim Tae-min","JD Gaming","Clid",3.4 ,"S.Korea"),
("Zeng Qi","JD Gaming","Yagao", 3.7,"China"),
("Lee Dong-wook","JD Gaming","LokeN",5.8 ,"S.Korea"),
("Zuo Ming-Hao","JD Gaming","LvMao",3.1 ,"China"),
("Jung Eon-yeong","Team Liquid","Impact", 4.1,"S.Korea"),
("Jake Puchero","Team Liquid","Xmithie",3.7 ,"Philippines"),
("Eugene Park","Team Liquid","Pobelter",3.7 ,"USA"),
("Yiliang Peng","Team Liquid","Doublelift",6.8 ,"USA"),
("Kim Joo-sung","Team Liquid","Olleh", 3.5,"S.Korea");

Select * FROM players where nation ="s.korea";