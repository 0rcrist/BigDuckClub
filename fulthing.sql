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
  `tournament` VARCHAR(45) NULL,
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
    REFERENCES `mydb`.`team` (`Tname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`teamB`)
    REFERENCES `mydb`.`team` (`Tname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

#commented these out so it wont fail if they already exist
INSERT INTO game ( Name, publisher, matchSize, genre) VALUES
("League of Legends", "Riot Games", 5, "MOBA");

INSERT INTO user ( id ) VALUES
("Juan"),
("Casey"),
("Dylan");

INSERT INTO mydb.Team (Name, Tname, size ,win , lose, region) VALUES
("League of Legends", "Bombers",      5, 10, 18, "OCE"),
("League of Legends", "JD Gaming",    5, 42, 28, "CN"),
("League of Legends", "Team SoloMid", 5, 22, 19, "NA"),

# Top 16 of 2018 Chamionship 
# 1 - 8
("League of Legends", "Invictus Gaming",     5, 58, 22, "CN"),
("League of Legends", "Cloud9",              5, 31, 20, "NA"),
("League of Legends", "Fnatic",              5, 35, 13, "EUW"),
("League of Legends", "G2 Esports",          5, 35, 25, "EUW"),
("League of Legends", "Edward Gaming",       5, 47, 30, "CN"),
("League of Legends", "Afreeca Freecs",      5, 39, 31, "KR"),
("League of Legends", "Royal Never Give Up", 5, 47, 26, "CN"),
("League of Legends", "KT Rolster",          5, 43, 20, "KR"),

# 9 - 16
("League of Legends", "Flash Wolves",     5, 36, 8, "TW"),
("League of Legends", "Phong Vu Buffalo", 5, 31, 13, "VN"),
("League of Legends", "Team Vitality",    5, 21, 13, "EUW"),
("League of Legends", "Gen. G",           5, 38, 27, "KR"),
("League of Legends", "Team Liquid",      5,23,12,"NA"),
("League of Legends", "100 Thieves",      5, 21, 21, "NA"),
("League of Legends", "MAD Team",         5, 24, 23, "TW"),
("League of Legends", "G-Rex",            5, 30, 32, "");

INSERT INTO mydb.Players (name, Tname, IGN, KDA, nation) values
("Kevin Yarnell",             "Team SoloMid", "Hauntzer", 3.3, "USA"),
("Jonathan Armao",            "Team SoloMid", "Grig",     3.9, "USA"),
("Soren Bjerg",               "Team SoloMid", "Bjergsen", 5.0, "Denmark" ),
("Jesper Svenningsen",        "Team SoloMid", "Zven",     4.4, "Denmark"),
("Alfonso Aguirre Rodriguez", "Team SoloMid", "Mithy",    3.3, "Spain"),

("Kim Chan-ho",       "100 Thieves", "ssumday",  4.7, "S.Korea"),
("Andy Hoang",        "100 Thieves", "AnDa",     3.7, "Canada"),
("Yoo Sang-wook",     "100 Thieves", "Ryu",      3.4, "S.Korea"),
("Richard Samuel oh", "100 Thieves", "Rikara",   4.1, "USA"),
("Zaqueri Black",     "100 Thieves", "Aphromoo", 2.9, "USA"),

("Christian Tiensuu",   "Bombers", "Sleeping", 2.6, "Finland"),
("Sebastion de Cegile", "Bombers", "Seb",      2.6, "Italy"),
("Carlo la Civita",     "Bombers", "Looch",    3.1, "Australia"),
("Alan Roger",          "Bombers", "Tiger",    2.9, "Tunisia"),
("Andrew Rose",         "Bombers", "Rosey",    2.5, "Australia"),

("Zhang Xing-Ran", "JD Gaming", "Zoom",  3.9, "China"),
("Kim Tae-min",    "JD Gaming", "Clid",  3.4, "S.Korea"),
("Zeng Qi",        "JD Gaming", "Yagao", 3.7, "China"),
("Lee Dong-wook",  "JD Gaming", "LokeN", 5.8, "S.Korea"),
("Zuo Ming-Hao",   "JD Gaming", "LvMao", 3.1, "China"),

("Jung Eon-yeong", "Team Liquid", "Impact",     4.1, "S.Korea"),
("Jake Puchero",   "Team Liquid", "Xmithie",    3.7, "Philippines"),
("Eugene Park",    "Team Liquid", "Pobelter",   3.7, "USA"),
("Yiliang Peng",   "Team Liquid", "Doublelift", 6.8, "USA"),
("Kim Joo-sung",   "Team Liquid", "Olleh",      3.5, "S.Korea"),

("Kang Seung-lok", "Invictus Gaming", "TheShy",      3.3, "S.Korea"),
("Gao Zhen-Ning",  "Invictus Gaming", "Ning",        3.5, "China"),
("Song Eui-jin",   "Invictus Gaming", "RooKie",      5.5, "S.Korea"),
("Yu Wen-Bo",      "Invictus Gaming", "Jackey Love", 4.1, "China"),
("Wang Liu-Yi",    "Invictus Gaming", "Boalan",      4.6, "China"),

("Eric Ritchie",    "Cloud9", "Licorice",    3.5, "Canada"),
("Dennis Johnson",  "Cloud9", "Szenskeren",  3.8, "Denmark"),
("Nicolaj Jensen",  "Cloud9", "Jensen",      5.0, "Denmark"),
("Zachary Scuderi", "Cloud9", "Sneaky",      4.3, "USA"),
("Tristen Stidam",  "Cloud9", "Zeyzal",      3.6, "USA"),

("Paul Boyer",            "Fnatic", "sOAZ",      4.2, "France"),
("Mads Brock-Pedersen",   "Fnatic", "Broxah",    7.8, "Denmark"),
("Rasmus Winther",        "Fnatic", "Caps",      3.8, "Denmark"),
("Martin Larsson",        "Fnatic", "Rekkles",   7.2, "Sweden"),
("Zdravets Liev Galabov", "Fnatic", "Hylissang", 3.3, "Bulgaria"),

("Martin Hansen",     "G2 Esports", "Wunder",  3.6, "Denmark"),
("Marcin Jankowski",  "G2 Esports", "Jankos",  4.0, "Poland"),
("Luka Perkovic",     "G2 Esports", "Perkz",   3.5, "Croatia"),
("Petter Freyschuss", "G2 Esports", "Hjarnan", 5.4, "Sweden"),
("Kim Bae-in",        "G2 Esports", "Wadid",   3.9, "S.Korea"),

("Jeon Ji-won"  ,"Edward Gaming", "Ray",   5.3, "S.Korea"),
("Chen Wen-Lin" ,"Edward Gaming", "Haro",  4.6, "China"),
("Lee Ye-chan"  ,"Edward Gaming", "Scout", 5.4, "S.Korea"),
("Hu Xian-Zhao" ,"Edward Gaming", "iBOY",  4.6, "China"),
("Tian Ye"      ,"Edward Gaming", "meiko", 4.5, "China"),

("Kim Gi-in"        ,"Afreeca Freecs", "Kiin",   3.9, "S.Korea"),
("Lee Da-yoon"      ,"Afreeca Freecs", "Spirit", 3.9, "S.Korea"),
("Lee Jin-hyeok"    ,"Afreeca Freecs", "kurO",   4.5, "S.Korea"),
("Ha Jong-hun"      ,"Afreeca Freecs", "Kramer", 4.8, "S.Korea"),
("Jang Gyeong-hwan" ,"Afreeca Freecs", "TusiN",  3.5, "S.Korea"),

("Yan Jun-Ze"   ,"Royal Never Give Up", "LetMe",  4.2, "China"),
("Liu Shi-Yu"   ,"Royal Never Give Up", "MLxg",   3.5, "China"),
("Li Yuan-Hao"  ,"Royal Never Give Up", "xiaohu", 4.7, "China"),
("Jian Zi-Hao"  ,"Royal Never Give Up", "Uzi",    4.9, "China"),
("Shi Sen-Ming" ,"Royal Never Give Up", "Ming",   4.4, "China"),

("Song Kyung-ho" ,"KT Rolster", "Smeb",  4.5, "S.Korea"),
("Go Dong-bin"   ,"KT Rolster", "Score", 4.2, "S.Korea"),
("Son Woo-hyeon" ,"KT Rolster", "Ucal",  4.0, "S.Korea"),
("Kim Hyuk-kyu"  ,"KT Rolster", "Deft",  4.7, "S.Korea"),
("Cho Se-hyeong" ,"KT Rolster", "MAta",  3.6, "S.Korea"),

("Su Chia-Hsiang " ,"Flash Wolves", "Hanabi",   4.4, "Taiwan"),
("Kim Moo-jin "    ,"Flash Wolves", "MooJin",   5.8, "S.Korea"),
("Huang Yi-Tang"   ,"Flash Wolves", "Maple",    6.3, "Taiwan"),
("Lu Yu-Hung"      ,"Flash Wolves", "Betty",    6.9, "Taiwan"),
("Hu Shuo-Chieh "  ,"Flash Wolves", "SwordArt", 5.8, "Taiwan"),

("Lucas Simon-Meslet" ,"Team Vitality", "Cabochard", 4.4, "France"),
("Mateusz Szkudlarek" ,"Team Vitality", "Kikis",     3.8, "Poland"),
("Daniele di Mauro"   ,"Team Vitality", "Jiizuke",   3.3, "Italy"),
("Amadeu Carvalho"    ,"Team Vitality", "Attila",    5.0, "Portugal"),
("Jakub Skurzynski"   ,"Team Vitality", "jactroll",  3.1, "Poland"),

("Lee Seong-jin"  ,"Gen. G", "CuVee",  2.7, "S.Korea"),
("Kang Min-seung" ,"Gen. G", "Haru",   3.8, "S.Korea"),
("Lee Min-ho"     ,"Gen. G", "Crown",  2.7, "S.Korea"),
("Park Jae-hyuk"  ,"Gen. G", "Ruler",  4.8, "S.Korea"),
("Jo Yong-in"     ,"Gen. G", "CoreJJ", 3.9, "S.Korea"),

("Wu Liang-Te"     ,"MAD Team", "Liang",  2.7, "Taiwan"),
("Lien Hsiu-Chi"   ,"MAD Team", "Benny",  0.9, "Taiwan"),
("Chen Chang-Chu"  ,"MAD Team", "Uniboy", 4.7, "Taiwan"),
("Huang Chien-Yuan","MAD Team", "Breeze", 5.3, "Taiwan"),
("Ko Kai-Sheng"    ,"MAD Team", "K",      3.8, "Taiwan"),

("Pham Minh Loc"       ,"Phong Vu Buffalo", "Zeros",   3.3, "Vietnam"),
("Bui Hoang Son Vương" ,"Phong Vu Buffalo", "XuHao",   3.1, "Vietnam"),
("Vo Thanh Luan"       ,"Phong Vu Buffalo", "Naul",    5.2, "Vietnam"),
("Dang Ngoc Tai"       ,"Phong Vu Buffalo", "BigKoro", 5.0, "Vietnam"),
("Nguyen Hai Trung"    ,"Phong Vu Buffalo", "Palette", 4.9, "Vietnam"),

("Hsieh Yu-Ting"   ,"G-Rex", "PK",     2.3, "Taiwan"),
("Anson Leung"     ,"G-Rex", "Empt2y", 4.1, "Canada"),
("Kim Seung-ju"    ,"G-Rex", "Candy",  3.7, "S.Korea"),
("Lee Seung-ju"    ,"G-Rex", "Stitch", 3.8, "S.Korea"),
("Lin Chih-Chiang" ,"G-Rex", "Koala",  3.1, "Taiwan");


INSERT INTO mydb.match(idMatch, teamA, teamB, winner, scoreA, ScoreB, happend, tournament) values
#Group Stage
# Day 1
(1011101, "KT Rolster", "Team Liquid", "KT Rolster", 1, 0, 1, "2018 World Championship"),
(1011102, "Edward Gaming", "MAD Team", "Edward Gaming", 1, 0, 1, "2018 World Championship"),
(1011103, "Phong Vu Buffalo", "Flash Wolves", "Flash Wolves", 0, 1, 1, "2018 World Championship"),
(1011104, "Afreeca Freecs", "G2 Esports", "G2 Esports", 0, 1, 1, "2018 World Championship"),
(1011105, "Royal Never Give Up", "Cloud9", "Royal Never Give Up", 1, 0, 1, "2018 World Championship"),
(1011106, "Gen. G", "Team Vitality", "Team Vitality", 0, 1, 1, "2018 World Championship");

INSERT INTO mydb.match(idMatch, teamA, teamB, winner, scoreA, ScoreB, happend, tournament) values
# Day 2
(1011201, "Flash Wolves", "Afreeca Freecs", "Flash Wolves", 1, 0, 1, "2018 World Championship"),
(1011202, "Phong Vu Buffalo", "G2 Esports", "Phong Vu Buffalo", 1, 0, 1, "2018 World Championship"),
(1011203, "100 Thieves", "Fnatic", "Fnatic", 0, 1, 1, "2018 World Championship"),
(1011204, "Invictus Gaming", "G-Rex", "Invictus Gaming", 1, 0, 1, "2018 World Championship"),
(1011205, "Team Vitality", "Cloud9", "Cloud9", 0, 1, 1, "2018 World Championship"),
(1011206, "Gen. G", "Royal Never Give Up", "Royal Never Give Up", 0, 1, 1, "2018 World Championship");

INSERT INTO mydb.match(idMatch, teamA, teamB, winner, scoreA, ScoreB, happend, tournament) values
# Day 3
(1011301, "MAD Team", "KT Rolster", "KT Rolster", 0, 1, 1, "2018 World Championship"),
(1011302, "Team Liquid", "Edward Gaming", "Edward Gaming", 0, 1, 1, "2018 World Championship"),
(1011303, "Fnatic", "Invictus Gaming", "Invictus Gaming", 0, 1, 1, "2018 World Championship"),
(1011304, "100 Thieves", "G-Rex", "100 Thieves", 1, 0, 1, "2018 World Championship"),
(1011305, "Royal Never Give Up", "Team Vitality", "Royal Never Give Up", 1, 0, 1, "2018 World Championship"),
(1011306, "Cloud9", "Gen. G", "Gen. G", 0, 1, 1, "2018 World Championship");

INSERT INTO mydb.match(idMatch, teamA, teamB, winner, scoreA, ScoreB, happend, tournament) values
# Day 4
(1011401, "Afreeca Freecs", "Phong Vu Buffalo", "Afreeca Freecs", 1, 0, 1, "2018 World Championship"),
(1011402, "G2 Esports", "Flash Wolves", "G2 Esports", 1, 0, 1, "2018 World Championship"),
(1011403, "Invictus Gaming", "100 Thieves", "Invictus Gaming", 1, 0, 1, "2018 World Championship"),
(1011404, "G-Rex", "Fnatic", "Fnatic", 0, 1, 1, "2018 World Championship"),
(1011405, "Team Liquid", "MAD Team", "Team Liquid", 1, 0, 1, "2018 World Championship"),
(1011406, "KT Rolster", "Edward Gaming", "KT Rolster", 0, 1, 1, "2018 World Championship");

INSERT INTO mydb.match(idMatch, teamA, teamB, winner, scoreA, ScoreB, happend, tournament) values
# Day 5
(1011501, "Team Vitality", "Royal Never Give Up", "Team Vitality", 1, 0, 1, "2018 World Championship"),
(1011502, "Gen. G", "Cloud9", "Cloud9", 0, 1, 1, "2018 World Championship"),
(1011503, "Team Vitality", "Gen. G", "Team Vitality", 1, 0, 1, "2018 World Championship"),
(1011504, "Cloud9", "Royal Never Give Up", "Cloud9", 1, 0, 1, "2018 World Championship"),
(1011505, "Cloud9", "Team Vitality", "Cloud9", 1, 0, 1, "2018 World Championship"),
(1011506, "Royal Never Give Up", "Gen. G", "Royal Never Give Up", 1, 0, 1, "2018 World Championship"),
(1011507, "Royal Never Give Up", "Cloud9", "Royal Never Give Up", 1, 0, 1, "2018 World Championship");

INSERT INTO mydb.match(idMatch, teamA, teamB, winner, scoreA, ScoreB, happend, tournament) values
# Day 6
(1011601, "Afreeca Freecs", "Flash Wolves", "Afreeca Freecs", 1, 0, 1, "2018 World Championship"),
(1011602, "G2 Esports", "Phong Vu Buffalo", "G2 Esports", 1, 0, 1, "2018 World Championship"),
(1011603, "Flash Wolves", "G2 Esports", "Flash Wolves", 1, 0, 1, "2018 World Championship"),
(1011604, "Phong Vu Buffalo", "Afreeca Freecs", "Afreeca Freecs", 0, 1, 1, "2018 World Championship"),
(1011605, "Flash Wolves", "Phong Vu Buffalo", "Phong Vu Buffalo", 0, 1, 1, "2018 World Championship"),
(1011606, "G2 Esports", "Afreeca Freecs", "Afreeca Freecs", 0, 1, 1, "2018 World Championship"),
(1011607, "Flash Wolves", "G2 Esports", "G2 Esports", 0, 1, 1, "2018 World Championship");

INSERT INTO mydb.match(idMatch, teamA, teamB, winner, scoreA, ScoreB, happend, tournament) values
# Day 7
(1011701, "Team Liquid", "KT Rolster", "KT Rolster", 0, 1, 1, "2018 World Championship"),
(1011702, "MAD Team", "Edward Gaming", "Edward Gaming", 0, 1, 1, "2018 World Championship"),
(1011703, "MAD Team", "Team Liquid", "Team Liquid", 0, 1, 1, "2018 World Championship"),
(1011704, "Edward Gaming", "KT Rolster", "Edward Gaming", 1, 0, 1, "2018 World Championship"),
(1011705, "Edward Gaming", "Team Liquid", "Team Liquid", 0, 1, 1, "2018 World Championship"),
(1011706, "KT Rolster", "MAD Team", "KT Rolster", 1, 0, 1, "2018 World Championship");

INSERT INTO mydb.match(idMatch, teamA, teamB, winner, scoreA, ScoreB, happend, tournament) values
# Day 8
(1011801, "Fnatic", "100 Thieves", "Fnatic", 1, 0, 1, "2018 World Championship"),
(1011802, "G-Rex", "Invictus Gaming", "Invictus Gaming", 0, 1, 1, "2018 World Championship"),
(1011803, "Fnatic", "G-Rex", "Fnatic", 1, 0, 1, "2018 World Championship"),
(1011804, "100 Thieves", "Invictus Gaming", "Invictus Gaming", 0, 1, 1, "2018 World Championship"),
(1011805, "G-Rex", "100 Thieves", "100 Thieves", 0, 1, 1, "2018 World Championship"),
(1011806, "Invictus Gaming", "Fnatic", "Fnatic", 0, 1, 1, "2018 World Championship"),
(1011807, "Fnatic", "Invictus Gaming", "Fnatic", 1, 0, 1, "2018 World Championship");

INSERT INTO mydb.match(idMatch, teamA, teamB, winner, scoreA, ScoreB, happend, tournament) values
# Knockout Round
# Quarter Finals
(1012101, "KT Rolster", "Invictus Gaming", "Invictus Gaming", 2, 3, 1, "2018 World Championship"),
(1012102, "Royal Never Give Up", "G2 Esports", "G2 Esports", 2, 3, 1, "2018 World Championship"),
(1012103, "Cloud9", "Afreeca Freecs", "Cloud9", 3, 0, 1, "2018 World Championship"),
(1012104, "Fnatic", "Edward Gaming", "Fnatic", 3, 1, 1, "2018 World Championship");

INSERT INTO mydb.match(idMatch, teamA, teamB, winner, scoreA, ScoreB, happend, tournament) values
# SemiFinals
(1012201, "Invictus Gaming", "G2 Esports", "Invictus Gaming", 3, 0, 1, "2018 World Championship"),
(1012202, "Fnatic", "Cloud9", "Fnatic", 3, 0, 1, "2018 World Championship");

INSERT INTO mydb.match(idMatch, teamA, teamB, winner, scoreA, ScoreB, happend, tournament) values
#Final 
(1012301, "Fnatic", "Invictus Gaming", "Invictus Gaming", 0, 3, 1, "2018 World Championship");

# Fake matches
INSERT INTO mydb.match(idMatch, teamA, teamB, happend, tournament) values
(1010101, "100 Thieves",     "G2 Esports",    0, "2018 BigDuck Championship"),
(1010102, "Afreeca Freecs",  "KT Rolster",    0, "2018 BigDuck Championship"),
(1010103, "Fnatic",          "Cloud9",        0, "2018 BigDuck Championship"),
(1010104, "Invictus Gaming", "Gen. G",        0, "2018 BigDuck Championship"),
(1010105, "Flash Wolves",    "Edward Gaming", 0, "2018 BigDuck Championship");


# Overwatch
INSERT INTO game ( Name, publisher, matchSize, genre) VALUES
("Overwatch", "Blizzard", 6, "FPS");


INSERT INTO mydb.Team (Name, Tname, size ,win , lose, region) VALUES
("Overwatch", "Boston Uprising"   , 6, 26, 14, "USA"),
("Overwatch", "Dallas Fuel"       , 6, 12, 28, "USA"),
("Overwatch", "Florida Mayhem"    , 6,  7, 33, "USA"),
("Overwatch", "Houston Outlaws"   , 6, 22, 18, "USA"),
("Overwatch", "London Spitfire"   , 6, 24, 16, "UK"),
("Overwatch", "LA Gladiators"     , 6, 25, 15, "USA"),
("Overwatch", "LA Valiant"        , 6, 27, 13, "USA"),
("Overwatch", "NY Excelsior"      , 6, 34,  6, "USA"),
("Overwatch", "PHI Fusion"        , 6, 24, 16, "USA"),
("Overwatch", "SF Shock"          , 6, 17, 23, "USA"),
("Overwatch", "Seoul Dynasty"     , 6, 22, 18, "S.Korea"),
("Overwatch", "Shanghai Dragons"  , 6,  0, 40, "China");


INSERT INTO mydb.Players (name, Tname, IGN, KDA, nation) values
("Minseob Park", "Boston Uprising", "AimGod", 2.46, "S.Korea"),
("YoungJin Noh", "Boston Uprising", "Gamsu", 2.58, "S.Korea"),
("Kristian Keller", "Boston Uprising", "Kellex", 0.46, "Denmark"),
("Lucas Meissner", "Boston Uprising", "NotE", 4.03, "Canada"),
("Nam-Ju Gwon", "Boston Uprising", "STRIKER", 3.8, "S.Korea"),
("Jeffrey Tsang", "Boston Uprising", "Blase", 3.2, "USA"),

("Dylan Bignet", "Dallas Fuel", "aKm", 1.98, "France"),
("Won-Sik Jung", "Dallas Fuel", "Closer", 0.96, "S.Korea"),
("Hyeon Hwang", "Dallas Fuel", "EFFECT", 2.69, "S.Korea"),
("Jonathan Tejedor Rua", "Dallas Fuel", "HarryHook", 0.92, "Spain"),
("Minseok Son", "Dallas Fuel", "OGE", 2.39, "S.Korea"),
("Timo Kettunen", "Dallas Fuel", "Taimou", 2.3, "Finland"),

("Sung-Hoon Kim", "Florida Mayhem", "aWesomeGuy", 2.0, "S.Korea"),
("Hyeon-Woo Jo", "Florida Mayhem", "HaGoPeun", 1.98, "S.Korea"),
("Jeong-Woo Ha", "Florida Mayhem", "Sayaplayer", 2.11, "S.Korea"),
("Kevin Lindstrom", "Florida Mayhem", "TviQ", 1.78, "Sweden"),
("Jae-Mo Koo", "Florida Mayhem", "XepheR", 3.78, "S.Korea"),
("Damon Conti", "Florida Mayhem", "Apply", 1.5, "USA"),

("Christopher Benell", "Houston Outlaws", "Bani", 0.22, "Canada"),
("Daniel Pence", "Houston Outlaws", "Boink", 1.2, "USA"),
("Matt Iorio", "Houston Outlaws", "Coolmatt", 3.36, "USA"),
("Dante Cruz", "Houston Outlaws", "Danteh", 3.2, "USA"),
("Austin Wilmot", "Houston Outlaws", "Muma", 3.25, "USA"),
("Jiri Masalin", "Houston Outlaws", "LiNkzr", 2.39, "Finland"),

("Jun-young Park", "London Spitfire", "Profit", 3.81, "S.Korea"),
("Jun-ho Kim", "London Spitfire", "Fury", 5.24, "S.Korea"),
("Jong-seok Kim", "London Spitfire", "NUS", 0.65, "S.Korea"),
("Jae-hui Hong", "London Spitfire", "Gesture", 3.2, "S.Korea"),
("Ji-hyeok Kim", "London Spitfire", "birdring", 2.85, "S.Korea"),
("Seung-tae Choi", "London Spitfire", "Bdosin", 2.46, "S.Korea"),

("Joao Pedro Goes Telles", "LA Gladiators", "Hydration", 2.48, "USA"),
("Benjamin Isohanni", "LA Gladiators", "BigGoose", 0.8, "Finland"),
("Jun-woo Kang", "LA Gladiators", "Void", 3.79, "S.Korea"),
("Lane Roberts", "LA Gladiators", "Surefour", 2.82, "Canada"),
("Jonas Suovaara", "LA Gladiators", "Shaz", 2.21, "Finland"),
("Hyung-seok 'Aaron' Kim", "LA Gladiators", "Bischu", 3.7, "S.Korea"),

("Brady Girardi", "LA Valiant", "Agilities", 2.82, "Canada"),
("Jun-hyeok Chae", "LA Valiant", "Bunny", 4.1, "S.Korea"),
("Scott Kennedy", "LA Valiant", "Custa", 0.94, "Australia"),
("Pan-seung Koo", "LA Valiant", "Fate", 2.9, "S.Korea"),
("Young-seo Park", "LA Valiant", "Kariv", 2.37, "S.Korea"),
("Kyle Frandanisa", "LA Valiant", "KSF", 2.96, "USA"),

("Tae-sung Jung", "NY Excelsior", "Anamo", 0.22, "S.Korea"),
("Hae-seong Kim", "NY Excelsior", "Libero", 2.89, "S.Korea"),
("Dong-gyu Kim", "NY Excelsior", "Mano", 3.36, "S.Korea"),
("Tae-hong Kim", "NY Excelsior", "Meko", 4.42, "S.Korea"),
("Do-hyeon Kim", "NY Excelsior", "Pine", 2.51, "S.Korea"),
("Jong-ryeol Park", "NY Excelsior", "Saebyeolbe", 4.26, "S.Korea"),

("Isaac Charles", "PHI Fusion", "Boombox", 2.11, "UK"),
("Jae-hyeok Lee", "PHI Fusion", "Carpe", 3.45, "S.Korea"),
("Josue Corona", "PHI Fusion", "Eqo", 2.96, "Israel"),
("Joona Laine", "PHI Fusion", "fragi", 2.25, "Finland"),
("Gael Gouzerch", "PHI Fusion", "Poko", 4.28, "France"),
("Su-min Kim", "PHI Fusion", "SADO", 2.49, "S.Korea"),

("Min-ho Park", "SF Shock", "Architect", 2.54, "S.Korea"),
("Andrej Francisty", "SF Shock", "BABYBAY", 2.3, "USA"),
("Hyo-bin Choi", "SF Shock", "Choihyobin", 3.6, "S.Korea"),
("Grant Espe", "SF Shock", "Moth", 0.6, "USA"),
("Jay Won", "SF Shock", "sinatraa", 3.06, "USA"),
("Nikola Andrews", "SF Shock", "sleepy", 2.1, "USA"),

("Chan-hyung Baek", "Seoul Dynasty", "Fissure", 3.03, "S.Korea"),
("Byung-sun Kim", "Seoul Dynasty", "FLETA", 2.71, "S.Korea"),
("Sang-beom Byun", "Seoul Dynasty", "Munchkin", 3.35, "S.Korea"),
("Je-hong Ryu", "Seoul Dynasty", "ryujehong", 1.99, "S.Korea"),
("Jin-mo Yang", "Seoul Dynasty", "tobi", 0.98, "S.Korea"),
("Joon-hyeok Kim", "Seoul Dynasty", "ZUNBA", 3.77, "S.Korea"),

("Se-yeon Kim", "Shanghai Dragons", "Geguri", 1.9, "S.Korea"),
("Eui-seok Lee", "Shanghai Dragons", "Fearless", 1.5, "S.Korea"),
("Weida Lu", "Shanghai Dragons", "Diya", 3.2, "China"),
("Jin-kyeok Yang", "Shanghai Dragons", "DDing", 1.3, "S.Korea"),
("Seong-hyeon Yang", "Shanghai Dragons", "Luffy", 2.9, "S.Korea"),
("Young-jin Jin", "Shanghai Dragons", "YOUNGJIN", 3.3, "S.Korea");

# Week 1 Stage 1
INSERT INTO mydb.match(idMatch, teamA, teamB, winner, scoreA, ScoreB, happend, tournament) values
(2021101, "SF Shock", "LA Valiant", "LA Valiant", 0, 4, 1, "Week 1"),
(2021102, "Shanghai Dragons", "LA Gladiators", "LA Gladiators", 0, 4, 1, "Week 1"),
(2021103, "Dallas Fuel", "Seoul Dynasty", "Seoul Dynasty", 1, 2, 1, "Week 1"),
(2021104, "London Spitfire", "Florida Mayhem", "London Spitfire", 3, 1, 1, "Week 1"),
(2021105, "PHI Fusion", "Houston Outlaws", "PHI Fusion", 3, 2, 1, "Week 1"),
(2021106, "Boston Uprising", "NY Excelsior", "NY Excelsior", 1, 3, 1, "Week 1"),
(2021107, "LA Valiant", "Dallas Fuel", "LA Valiant", 3, 0, 1, "Week 1"),
(2021108, "Florida Mayhem", "Boston Uprising", "Boston Uprising", 0, 4, 1, "Week 1"),
(2021109, "SF Shock", "Shanghai Dragons", "SF Shock", 3, 1, 1, "Week 1"),
(2021110, "London Spitfire", "PHI Fusion", "London Spitfire", 4, 0, 1, "Week 1"),
(2021111, "NY Excelsior", "Houston Outlaws", "NY Excelsior", 3, 1, 1, "Week 1"),
(2021112, "Seoul Dynasty", "LA Gladiators", "Seoul Dynasty", 4, 0, 1, "Week 1");

# Week 1 Stage 2
INSERT INTO mydb.match(idMatch, teamA, teamB, winner, scoreA, ScoreB, happend, tournament) values
(2021201, "Seoul Dynasty", "LA Valiant", "Seoul Dynasty", 4, 0, 1, "Week 1"),
(2021202, "Dallas Fuel", "Shanghai Dragons", "Dallas Fuel", 3, 1, 1, "Week 1"),
(2021203, "LA Gladiators", "SF Shock", "LA Gladiators", 4, 0, 1, "Week 1"),
(2021204, "Houston Outlaws", "London Spitfire", "Houston Outlaws", 3, 2, 1, "Week 1"),
(2021205, "NY Excelsior", "Florida Mayhem", "NY Excelsior", 3, 1, 1, "Week 1"),
(2021206, "Boston Uprising", "PHI Fusion", "PHI Fusion", 0, 4, 1, "Week 1"),
(2021207, "London Spitfire", "NY Excelsior", "London Spitfire", 3, 2, 1, "Week 1"),
(2021208, "Dallas Fuel", "LA Gladiators", "Dallas Fuel", 3, 1, 1, "Week 1"),
(2021209, "SF Shock", "Seoul Dynasty", "Seoul Dynasty", 1, 3, 1, "Week 1"),
(2021210, "PHI Fusion", "Florida Mayhem", "PHI Fusion", 4, 0, 1, "Week 1"),
(2021211, "Boston Uprising", "Houston Outlaws", "Houston Outlaws", 0, 4, 1, "Week 1"),
(2021212, "Shanghai Dragons", "LA Valiant", "LA Valiant", 0, 3, 1, "Week 1");

# Week 1 Stage 3
INSERT INTO mydb.match(idMatch, teamA, teamB, winner, scoreA, ScoreB, happend, tournament) values
(2021301, "Shanghai Dragons", "Dallas Fuel", "Dallas Fuel", 1, 3, 1, "Week 1"),
(2021302, "LA Valiant", "Seoul Dynasty", "LA Valiant", 4, 0, 1, "Week 1"),
(2021303, "SF Shock", "LA Gladiators", "SF Shock", 3, 1, 1, "Week 1"),
(2021304, "Florida Mayhem", "NY Excelsior", "NY Excelsior", 0, 4, 1, "Week 1"),
(2021305, "PHI Fusion", "Boston Uprising", "Boston Uprising", 2, 3, 1, "Week 1"),
(2021306, "London Spitfire", "Houston Outlaws", "Houston Outlaws", 2, 3, 1, "Week 1"),
(2021307, "LA Gladiators", "Dallas Fuel", "LA Gladiators", 3, 1, 1, "Week 1"),
(2021308, "LA Valiant", "Shanghai Dragons", "LA Valiant", 4, 0, 1, "Week 1"),
(2021309, "Seoul Dynasty", "SF Shock", "Seoul Dynasty", 4, 0, 1, "Week 1"),
(2021310, "Florida Mayhem", "PHI Fusion", "PHI Fusion", 1, 3, 1, "Week 1"),
(2021311, "Houston Outlaws", "Boston Uprising", "Boston Uprising", 0, 4, 1, "Week 1"),
(2021312, "NY Excelsior", "London Spitfire", "NY Excelsior", 4, 0, 1, "Week 1");

# Week 1 Stage 4
INSERT INTO mydb.match(idMatch, teamA, teamB, winner, scoreA, ScoreB, happend, tournament) values
(2021401,   "LA Gladiators", "SF Shock", "LA Gladiators", 3, 1, 1, "Week 1"),
(2021402,   "Seoul Dynasty", "LA Valiant", "LA Valiant", 2, 3, 1, "Week 1"),
(2021403,   "Dallas Fuel", "Shanghai Dragons", "Dallas Fuel", 3, 1, 1, "Week 1"),
(2021404,   "Boston Uprising", "PHI Fusion", "PHI Fusion", 1, 3, 1, "Week 1"),
(2021405,   "NY Excelsior", "Florida Mayhem", "NY Excelsior", 3, 0, 1, "Week 1"),
(2021406,   "Houston Outlaws", "London Spitfire", "Houston Outlaws", 4, 0, 1, "Week 1"),
(2021407,   "Dallas Fuel", "LA Gladiators", "LA Gladiators", 0, 4, 1, "Week 1"),
(2021408,   "Boston Uprising", "Houston Outlaws", "Houston Outlaws", 1, 3, 1, "Week 1"),
(2021409,   "SF Shock", "Seoul Dynasty", "SF Shock", 3, 1, 1, "Week 1"),
(2021410,   "PHI Fusion", "Florida Mayhem", "PHI Fusion", 4, 0, 1, "Week 1"),
(2021411,   "Shanghai Dragons", "LA Valiant", "LA Valiant", 1, 3, 1, "Week 1"),
(2021412,   "London Spitfire", "NY Excelsior", "NY Excelsior", 1, 3, 1, "Week 1");

# Week 1 playoffs/GrandFinal
INSERT INTO mydb.match(idMatch, teamA, teamB, winner, scoreA, ScoreB, happend, tournament) values
(2021501,   "PHI Fusion", "Boston Uprising", "PHI Fusion", 3, 1, 1, "Week 1"),
(2021502,   "London Spitfire", "LA Gladiators", "LA Gladiators", 0, 3, 1, "Week 1"),
(2021503,   "PHI Fusion", "Boston Uprising", "Boston Uprising", 1, 3, 1, "Week 1"),
(2021504,   "PHI Fusion", "Boston Uprising", "PHI Fusion", 3, 1, 1, "Week 1"),
(2021505,   "London Spitfire", "LA Gladiators", "London Spitfire", 3, 0, 1, "Week 1"),
(2021506,   "London Spitfire", "LA Gladiators", "London Spitfire", 3, 0, 1, "Week 1");

# Fake matches
INSERT INTO mydb.match(idMatch, teamA, teamB, happend, tournament) values
(2020101, "London Spitfire", "Florida Mayhem",   0, "2018 BigDuck Championship"),
(2020102, "LA Valiant",      "Boston Uprising",  0, "2018 BigDuck Championship"),
(2020103, "PHI Fusion",      "Dallas Fuel",      0, "2018 BigDuck Championship"),
(2020104, "LA Gladiators",   "Shanghai Dragons", 0, "2018 BigDuck Championship"),
(2020105, "NY Excelsior",    "Shanghai Dragons", 0, "2018 BigDuck Championship"),
(2020106, "Houston Outlaws", "London Spitfire",  0, "2018 BigDuck Championship");




Select * FROM mydb.team WHERE name = "Overwatch";

Select * FROM mydb.match WHERE idmatch > 2020000;
