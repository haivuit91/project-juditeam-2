-- MySQL Script generated by MySQL Workbench
-- 06/20/14 12:05:15
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema db_math
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_math` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `db_math` ;

-- -----------------------------------------------------
-- Table `db_math`.`tbl_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_math`.`tbl_role` (
  `roleID` INT NOT NULL AUTO_INCREMENT,
  `roleName` VARCHAR(50) NOT NULL,
  `isActive` BIT NOT NULL,
  PRIMARY KEY (`roleID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_math`.`tbl_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_math`.`tbl_user` (
  `userID` INT NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(20) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `fullName` VARCHAR(50) NOT NULL,
  `gender` BIT NULL,
  `birthDay` DATE NULL,
  `email` VARCHAR(50) NOT NULL,
  `address` VARCHAR(100) NULL,
  `roleID` INT NOT NULL,
  `isActive` BIT NOT NULL,
  PRIMARY KEY (`userID`, `roleID`),
  INDEX `fk_tblUser_tblRole_idx` (`roleID` ASC),
  CONSTRAINT `fk_tblUser_tblRole`
    FOREIGN KEY (`roleID`)
    REFERENCES `db_math`.`tbl_role` (`roleID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_math`.`tbl_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_math`.`tbl_category` (
  `categoryID` INT NOT NULL AUTO_INCREMENT,
  `categoryName` VARCHAR(50) NOT NULL,
  `isActive` BIT NOT NULL,
  PRIMARY KEY (`categoryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_math`.`tbl_post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_math`.`tbl_post` (
  `postID` INT NOT NULL AUTO_INCREMENT,
  `title` TEXT NOT NULL,
  `shortTitle` TEXT NULL,
  `content` TEXT NOT NULL,
  `datePost` DATE NULL,
  `link` TEXT NULL,
  `userID` INT NOT NULL,
  `categoryID` INT NOT NULL,
  `isActive` BIT NOT NULL,
  PRIMARY KEY (`postID`, `userID`, `categoryID`),
  INDEX `fk_tbl_post_tbl_category1_idx` (`categoryID` ASC),
  INDEX `fk_tbl_post_tbl_user1_idx` (`userID` ASC),
  CONSTRAINT `fk_tbl_post_tbl_category1`
    FOREIGN KEY (`categoryID`)
    REFERENCES `db_math`.`tbl_category` (`categoryID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_post_tbl_user1`
    FOREIGN KEY (`userID`)
    REFERENCES `db_math`.`tbl_user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_math`.`tbl_comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_math`.`tbl_comment` (
  `commentID` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NOT NULL,
  `dateComment` DATE NULL,
  `postID` INT NOT NULL,
  `userID` INT NOT NULL,
  `isActive` BIT NOT NULL,
  PRIMARY KEY (`commentID`, `postID`, `userID`),
  INDEX `fk_tbl_comment_tbl_user1_idx` (`userID` ASC),
  INDEX `fk_tbl_comment_tbl_post1_idx` (`postID` ASC),
  CONSTRAINT `fk_tbl_comment_tbl_user1`
    FOREIGN KEY (`userID`)
    REFERENCES `db_math`.`tbl_user` (`userID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_comment_tbl_post1`
    FOREIGN KEY (`postID`)
    REFERENCES `db_math`.`tbl_post` (`postID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_math`.`tbl_attach`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_math`.`tbl_attach` (
  `attachID` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NULL,
  `path` TEXT NULL,
  `postID` INT NOT NULL,
  `isActive` BIT NOT NULL,
  PRIMARY KEY (`attachID`, `postID`),
  INDEX `fk_tbl_attach_tbl_post1_idx` (`postID` ASC),
  CONSTRAINT `fk_tbl_attach_tbl_post1`
    FOREIGN KEY (`postID`)
    REFERENCES `db_math`.`tbl_post` (`postID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_math`.`tbl_cat_resource`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_math`.`tbl_cat_resource` (
  `catResourceID` INT NOT NULL AUTO_INCREMENT,
  `catResourceName` VARCHAR(200) NOT NULL,
  `isActive` BIT NOT NULL,
  PRIMARY KEY (`catResourceID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_math`.`tlb_resource`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_math`.`tlb_resource` (
  `resourceID` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NOT NULL,
  `dateUpload` DATE NOT NULL,
  `userID` INT NOT NULL,
  `catResourceID` INT NOT NULL,
  `isActive` BIT NOT NULL,
  PRIMARY KEY (`resourceID`, `userID`, `catResourceID`),
  INDEX `fk_tlb_resource_tbl_user1_idx` (`userID` ASC),
  INDEX `fk_tlb_resource_tbl_cat_resource1_idx` (`catResourceID` ASC),
  CONSTRAINT `fk_tlb_resource_tbl_user1`
    FOREIGN KEY (`userID`)
    REFERENCES `db_math`.`tbl_user` (`userID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_tlb_resource_tbl_cat_resource1`
    FOREIGN KEY (`catResourceID`)
    REFERENCES `db_math`.`tbl_cat_resource` (`catResourceID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_math`.`tb_res_attach`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_math`.`tb_res_attach` (
  `resAttachID` INT NOT NULL AUTO_INCREMENT,
  `path` TEXT NOT NULL,
  `resourceID` INT NOT NULL,
  `isActive` BIT NOT NULL,
  PRIMARY KEY (`resAttachID`, `resourceID`),
  INDEX `fk_tb_res_attach_tlb_resource1_idx` (`resourceID` ASC),
  CONSTRAINT `fk_tb_res_attach_tlb_resource1`
    FOREIGN KEY (`resourceID`)
    REFERENCES `db_math`.`tlb_resource` (`resourceID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
