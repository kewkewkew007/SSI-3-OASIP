-- MySQL Script generated by MySQL Workbench
-- Wed Apr 27 22:57:47 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema OASIP
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `OASIP` ;

-- -----------------------------------------------------
-- Schema OASIP
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `OASIP` DEFAULT CHARACTER SET utf8 ;
USE `OASIP` ;

-- -----------------------------------------------------
-- Table `OASIP`.`EventCategory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `OASIP`.`EventCategory` ;

CREATE TABLE IF NOT EXISTS `OASIP`.`EventCategory` (
  `eventCategoryID` INT NOT NULL,
  `eventCategoryName` VARCHAR(100) NOT NULL,
  `eventCategoryDescription` VARCHAR(500) NULL,
  `eventDuration` INT NOT NULL,
  PRIMARY KEY (`eventCategoryID`),
  UNIQUE INDEX `eventCategoryName_UNIQUE` (`eventCategoryName` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `OASIP`.`Event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `OASIP`.`Event` ;

CREATE TABLE IF NOT EXISTS `OASIP`.`Event` (
  `eventID` INT NOT NULL,
  `bookingName` VARCHAR(100) NOT NULL,
  `bookingEmail` VARCHAR(255) NOT NULL,
  `eventStartTime` DATETIME NOT NULL,
  `eventDuration` INT NOT NULL,
  `eventNotes` VARCHAR(500) NULL,
  `eventCategoryID` INT NOT NULL,
  PRIMARY KEY (`eventID`),
  INDEX `fk_Event_EventCategory_idx` (`eventCategoryID` ASC) VISIBLE,
  CONSTRAINT `fk_Event_EventCategory`
    FOREIGN KEY (`eventCategoryID`)
    REFERENCES `OASIP`.`EventCategory` (`eventCategoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
