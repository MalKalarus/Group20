-- MySQL Script generated by MySQL Workbench
-- Sun Feb 26 19:53:24 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema resume
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `resume` ;

-- -----------------------------------------------------
-- Schema resume
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `resume` DEFAULT CHARACTER SET utf8 ;
USE `resume` ;

-- -----------------------------------------------------
-- Table `resume`.`Place`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `resume`.`Place` ;

CREATE TABLE IF NOT EXISTS `resume`.`Place` (
  `contact` INT NOT NULL,
  `idPlace` INT NOT NULL AUTO_INCREMENT,
  `address` MEDIUMTEXT NULL,
  `city` VARCHAR(45) NULL,
  `post code` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  PRIMARY KEY (`idPlace`),
  UNIQUE INDEX `idContact_UNIQUE` (`contact` ASC),
  UNIQUE INDEX `idPlace_UNIQUE` (`idPlace` ASC),
  CONSTRAINT `idContact`
    FOREIGN KEY (`contact`)
    REFERENCES `resume`.`Contact` (`idContact`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `resume`.`Contact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `resume`.`Contact` ;

CREATE TABLE IF NOT EXISTS `resume`.`Contact` (
  `username` VARCHAR(200) NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `phone` INT NULL,
  `email` VARCHAR(100) NULL,
  `website` VARCHAR(200) NULL,
  `idContact` INT NOT NULL AUTO_INCREMENT,
  `place` INT NOT NULL,
  PRIMARY KEY (`idContact`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `website_UNIQUE` (`website` ASC),
  UNIQUE INDEX `idContact_UNIQUE` (`idContact` ASC),
  UNIQUE INDEX `idPlace_UNIQUE` (`place` ASC),
  CONSTRAINT `username`
    FOREIGN KEY (`username`)
    REFERENCES `resume`.`User` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idPlace`
    FOREIGN KEY (`place`)
    REFERENCES `resume`.`Place` (`idPlace`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `resume`.`Profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `resume`.`Profile` ;

CREATE TABLE IF NOT EXISTS `resume`.`Profile` (
  `idProfile` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `interest` MEDIUMTEXT NULL,
  `contact` INT NULL,
  `pic` LONGBLOB NULL,
  PRIMARY KEY (`idProfile`),
  UNIQUE INDEX `idProfile_UNIQUE` (`idProfile` ASC),
  INDEX `username_idx` (`name` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `idContact_idx` (`contact` ASC),
  UNIQUE INDEX `contact_UNIQUE` (`contact` ASC),
  CONSTRAINT `username`
    FOREIGN KEY (`name`)
    REFERENCES `resume`.`User` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idContact`
    FOREIGN KEY (`contact`)
    REFERENCES `resume`.`Contact` (`idContact`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `resume`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `resume`.`User` ;

CREATE TABLE IF NOT EXISTS `resume`.`User` (
  `username` VARCHAR(200) NOT NULL,
  `psw` VARCHAR(45) NOT NULL,
  `contact` INT NULL,
  `profile` INT NULL,
  `pics` VARCHAR(45) NULL,
  PRIMARY KEY (`username`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `contact_UNIQUE` (`contact` ASC),
  UNIQUE INDEX `profile_UNIQUE` (`profile` ASC),
  CONSTRAINT `idContact`
    FOREIGN KEY (`contact`)
    REFERENCES `resume`.`Contact` (`idContact`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idProfile`
    FOREIGN KEY (`profile`)
    REFERENCES `resume`.`Profile` (`idProfile`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `username`
    FOREIGN KEY (`username`)
    REFERENCES `resume`.`User` (`psw`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `resume`.`Qualification`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `resume`.`Qualification` ;

CREATE TABLE IF NOT EXISTS `resume`.`Qualification` (
  `idQualification` INT NOT NULL AUTO_INCREMENT,
  `memberName` VARCHAR(45) NULL,
  `startDate` DATE NULL,
  `endDate` DATE NULL,
  `place` INT NULL,
  `jobtitle` VARCHAR(100) NULL,
  `jobDescription` LONGTEXT NULL,
  `type` VARCHAR(45) NULL,
  `profile` INT NULL,
  PRIMARY KEY (`idQualification`),
  UNIQUE INDEX `idQualification_UNIQUE` (`idQualification` ASC),
  INDEX `idPlace_idx` (`place` ASC),
  UNIQUE INDEX `profile_UNIQUE` (`profile` ASC),
  CONSTRAINT `idPlace`
    FOREIGN KEY (`place`)
    REFERENCES `resume`.`Place` (`idPlace`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idProfile`
    FOREIGN KEY (`profile`)
    REFERENCES `resume`.`Profile` (`idProfile`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `resume`.`Certification`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `resume`.`Certification` ;

CREATE TABLE IF NOT EXISTS `resume`.`Certification` (
  `idCertification` INT NOT NULL,
  `date` DATE NULL,
  `description` LONGTEXT NULL,
  `link` MEDIUMTEXT NULL,
  `image` BLOB NULL,
  `profile` INT NULL,
  PRIMARY KEY (`idCertification`),
  UNIQUE INDEX `idCertification_UNIQUE` (`idCertification` ASC),
  UNIQUE INDEX `profile_UNIQUE` (`profile` ASC),
  CONSTRAINT `idProfile`
    FOREIGN KEY (`profile`)
    REFERENCES `resume`.`Profile` (`idProfile`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `resume`.`Reusume`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `resume`.`Reusume` ;

CREATE TABLE IF NOT EXISTS `resume`.`Reusume` (
  `idReusume` INT NOT NULL AUTO_INCREMENT,
  `intro` LONGTEXT NOT NULL,
  `username` VARCHAR(45) NULL,
  `profile` INT NULL,
  PRIMARY KEY (`idReusume`),
  UNIQUE INDEX `idReusume_UNIQUE` (`idReusume` ASC),
  INDEX `username_idx` (`username` ASC),
  UNIQUE INDEX `profile_UNIQUE` (`profile` ASC),
  CONSTRAINT `username`
    FOREIGN KEY (`username`)
    REFERENCES `resume`.`User` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idProfile`
    FOREIGN KEY (`profile`)
    REFERENCES `resume`.`Profile` (`idProfile`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
