CREATE TABLE IF NOT EXISTS `mydb`.`Match` (
  `idMatch` INT NOT NULL,
  `teamA` VARCHAR(45) NULL,
  `teamB` VARCHAR(45) NULL,
  `winner` VARCHAR(45) NULL,
  `scoreA` INT NULL,
  `socreB` INT NULL,
  `happend` TINYINT NULL,
  `tornument` VARCHAR(45) NULL,
  `ofGame` VARCHAR(45) NULL,
  PRIMARY KEY (`idMatch`),
  INDEX `ofGame_idx` (`ofGame` ASC),
  INDEX `teamA_idx` (`teamA` ASC) ,
  INDEX `teamB_idx` (`teamB` ASC) ,
  CONSTRAINT `ofGame`
    FOREIGN KEY (`ofGame`)
    REFERENCES `mydb`.`Game` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `teamA`
    FOREIGN KEY (`teamA`)
    REFERENCES `mydb`.`Team` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `teamB`
    FOREIGN KEY (`teamB`)
    REFERENCES `mydb`.`Team` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `Id` VARCHAR(45) NOT NULL DEFAULT 'nerd',
  `points` INT NULL,
  `password` VARCHAR(45) NULL,
  `right` INT NULL DEFAULT 0,
  `wrong` INT NULL DEFAULT 0,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`Team` (
  `Name` VARCHAR(45) NOT NULL,
  `size` INT NULL,
  `win` INT NULL,
  `lose` INT NULL,
  `region` VARCHAR(45) NULL,
  `rank` INT NULL,
  PRIMARY KEY (`Name`),
  CONSTRAINT `ofGame`
    FOREIGN KEY (`Name`)
    REFERENCES `mydb`.`Game` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`Players` (
  `Name` VARCHAR(45) NOT NULL,
  `T.name` VARCHAR(45) NOT NULL,
  `IGN` VARCHAR(45) NOT NULL,
  `kills` INT NULL,
  `death` INT NULL,
  `assist` INT NULL,
  `experiance` VARCHAR(45) NULL,
  `nation` VARCHAR(45) NULL,
  PRIMARY KEY (`IGN`),
  INDEX `teamName_idx` (`T.name` ASC) ,
  CONSTRAINT `teamName`
    FOREIGN KEY (`T.name`)
    REFERENCES `mydb`.`Team` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`Game` (
  `Name` VARCHAR(45) NOT NULL,
  `publisher` VARCHAR(45) NULL,
  `matchSize` INT NULL,
  `genre` VARCHAR(45) NULL,
  PRIMARY KEY (`Name`))
ENGINE = InnoDB;

INSERT INTO game ( Name, publisher, matchSize, genre) VALUES
("Leauge of Legends", "Riot Games", 5, "MOBA"),
("Super Smash Bros Melee", "Nintendo", 1,"fighter");

INSERT INTO user ( id ) VALUES
("juan"),
("Casey"),
("Dylan");

INSERT INTO team (Name, size ,win , lose, region) VALUES
("100 Thieves", 5, 21, 21, "NA"),
("Bombers", 5, 10, 18, "OCE"),
("Invictus", 5 , 58, 22, "CN"),
("JD Gaming", 5, 42, 28, "CN"),
("Cloud9", 5, 31, 20, "NA"),
("Team SoloMid",5,22,19, "NA");

select * from team;
