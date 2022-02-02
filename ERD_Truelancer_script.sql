-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`clients_fabihal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clients_fabihal` (
  `Client_ID` INT NOT NULL,
  `Client_FName` VARCHAR(45) NOT NULL,
  `Client_LName` VARCHAR(45) NOT NULL,
  `Client_Email` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `Client_type` VARCHAR(45) NOT NULL,
  `affiliation` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`Client_ID`),
  UNIQUE INDEX `Client_Email_UNIQUE` (`Client_Email` ASC) VISIBLE,
  UNIQUE INDEX `Client_ID_UNIQUE` (`Client_ID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`freelancers_fabihal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`freelancers_fabihal` (
  `Freelancer_ID` INT NOT NULL,
  `Freelancer_FName` VARCHAR(45) NOT NULL,
  `Freelancer_LName` VARCHAR(45) NOT NULL,
  `Freelancer_Email_ID` VARCHAR(45) NOT NULL,
  `Education` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Freelancer_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`projects_fabihal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`projects_fabihal` (
  `Project_ID` INT NOT NULL,
  `clients_fabihal_Client_ID` INT NOT NULL,
  `Project_status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Project_ID`, `clients_fabihal_Client_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`freelancers_fabihal_has_clients_fabihal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`freelancers_fabihal_has_clients_fabihal` (
  `freelancers_fabihal_Freelancer_ID` INT NOT NULL,
  `clients_fabihal_Client_ID` INT NOT NULL,
  PRIMARY KEY (`freelancers_fabihal_Freelancer_ID`, `clients_fabihal_Client_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`reviews_FabihaL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`reviews_FabihaL` (
  `clients_fabihal_Client_ID` INT NOT NULL,
  `freelancers_fabihal_Freelancer_ID` INT NOT NULL,
  `no.of_feedback` VARCHAR(45) NULL,
  `stars received` VARCHAR(45) NULL,
  PRIMARY KEY (`clients_fabihal_Client_ID`, `freelancers_fabihal_Freelancer_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Bids_FabihaL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bids_FabihaL` (
  `projects_fabihal_Project_ID` INT NOT NULL,
  `freelancers_fabihal_Freelancer_ID` INT NOT NULL,
  `Currency` VARCHAR(45) NOT NULL,
  `bid` VARCHAR(45) NOT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Services_FabihaL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Services_FabihaL` (
  `Services_ID` INT NOT NULL,
  `Service_type` VARCHAR(45) NOT NULL,
  `freelancers_fabihal_Freelancer_ID` INT NOT NULL,
  `projects_fabihal_Project_ID` INT NOT NULL,
  `projects_fabihal_clients_fabihal_Client_ID` INT NOT NULL,
  PRIMARY KEY (`Services_ID`, `projects_fabihal_Project_ID`, `projects_fabihal_clients_fabihal_Client_ID`, `freelancers_fabihal_Freelancer_ID`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
