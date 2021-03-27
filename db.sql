-- MySQL Script generated by MySQL Workbench
-- Tue Sep 29 18:27:14 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema eamp
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema eamp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `eamp` ;
USE `eamp` ;

-- -----------------------------------------------------
-- Table `eamp`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eamp`.`customer` (
  `cid` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `address` VARCHAR(225) NULL,
  `subsidy` BINARY(2) NULL,
  `name` VARCHAR(45) NULL,
  `phno` INT NULL,
  PRIMARY KEY (`cid`, `email`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eamp`.`subap`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eamp`.`subap` (
  `cid` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `address` VARCHAR(225) NULL,
  `email` VARCHAR(45) NULL,
  `ainc` INT NULL,
  `adpf` VARCHAR(45) NULL,
  `inpf` VARCHAR(45) NULL,
  INDEX `cid_idx` (`cid` ASC) VISIBLE,
  CONSTRAINT `cid`
    FOREIGN KEY (`cid`)
    REFERENCES `eamp`.`customer` (`cid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eamp`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eamp`.`products` (
  `pid` INT NOT NULL,
  `pname` VARCHAR(45) NULL,
  `desc` VARCHAR(555) NULL,
  `ncost` INT NULL,
  `scost` INT NULL,
  `pimg(image address-static/images/...jpg)` VARCHAR(45) NULL,
  PRIMARY KEY (`pid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eamp`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eamp`.`orders` (
  `oid` INT NOT NULL AUTO_INCREMENT,
  `cost` INT NULL,
  `daddress` VARCHAR(45) NULL,
  `cid` INT NULL,
  `pid` INT NULL,
  `quantity` INT NULL,
  `tcost` INT NULL,
  PRIMARY KEY (`oid`),
  INDEX `cid_idx` (`cid` ASC) VISIBLE,
  INDEX `pid_idx` (`pid` ASC) VISIBLE,
  CONSTRAINT `cid`
    FOREIGN KEY (`cid`)
    REFERENCES `eamp`.`customer` (`cid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `pid`
    FOREIGN KEY (`pid`)
    REFERENCES `eamp`.`products` (`pid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eamp`.`table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eamp`.`table` (
  `uid` INT NOT NULL,
  `passwd` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `addr` VARCHAR(225) NULL,
  PRIMARY KEY (`uid`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
