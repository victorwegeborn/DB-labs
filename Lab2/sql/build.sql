-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema nethub
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema nethub
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `nethub` DEFAULT CHARACTER SET utf8 ;
USE `nethub` ;

-- -----------------------------------------------------
-- Table `nethub`.`media`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nethub`.`media` (
  `media_id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `year` YEAR(4) NULL DEFAULT NULL,
  PRIMARY KEY (`media_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 20
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nethub`.`people`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nethub`.`people` (
  `people_id` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`people_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 62
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nethub`.`crew`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nethub`.`crew` (
  `crew_id` INT(11) NOT NULL AUTO_INCREMENT,
  `media_id` INT(11) NOT NULL,
  `people_id` INT(11) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`crew_id`),
  INDEX `fk_crew_person1_idx` (`people_id` ASC),
  INDEX `fk_crew_media1_idx` (`media_id` ASC),
  CONSTRAINT `fk_crew_media1`
    FOREIGN KEY (`media_id`)
    REFERENCES `nethub`.`media` (`media_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_crew_person1`
    FOREIGN KEY (`people_id`)
    REFERENCES `nethub`.`people` (`people_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 61
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nethub`.`payment_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nethub`.`payment_status` (
  `payment_status_id` TINYINT(4) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`payment_status_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nethub`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nethub`.`customer` (
  `customer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `joining_date` DATE NOT NULL,
  `subscription_end` DATE NOT NULL,
  `parent_id` INT(11) NOT NULL,
  `birth_date` DATE NOT NULL,
  `payment_status` TINYINT(4) NOT NULL,
  PRIMARY KEY (`customer_id`),
  INDEX `fk_customer_customer1_idx` (`parent_id` ASC),
  INDEX `fk_customer_payment_status1_idx` (`payment_status` ASC),
  CONSTRAINT `fk_customer_customer1`
    FOREIGN KEY (`parent_id`)
    REFERENCES `nethub`.`customer` (`customer_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_customer_payment_status1`
    FOREIGN KEY (`payment_status`)
    REFERENCES `nethub`.`payment_status` (`payment_status_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nethub`.`episodes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nethub`.`episodes` (
  `episode_id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `number` TINYINT(4) NOT NULL,
  `upload_date` TIMESTAMP NOT NULL DEFAULT now(),
  PRIMARY KEY (`episode_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nethub`.`tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nethub`.`tags` (
  `tag_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`tag_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nethub`.`filter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nethub`.`filter` (
  `filter_id` INT(11) NOT NULL AUTO_INCREMENT,
  `customer_id` INT(11) NOT NULL,
  `media_media_id` INT(11) NULL DEFAULT NULL,
  `people_people_id` INT(11) NULL DEFAULT NULL,
  `tags_tag_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`filter_id`, `customer_id`),
  INDEX `fk_filter_customer3_idx` (`customer_id` ASC),
  INDEX `fk_filter_media1_idx` (`media_media_id` ASC),
  INDEX `fk_filter_people1_idx` (`people_people_id` ASC),
  INDEX `fk_filter_tags1_idx` (`tags_tag_id` ASC),
  CONSTRAINT `fk_filter_customer3`
    FOREIGN KEY (`customer_id`)
    REFERENCES `nethub`.`customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_filter_media1`
    FOREIGN KEY (`media_media_id`)
    REFERENCES `nethub`.`media` (`media_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_filter_people1`
    FOREIGN KEY (`people_people_id`)
    REFERENCES `nethub`.`people` (`people_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_filter_tags1`
    FOREIGN KEY (`tags_tag_id`)
    REFERENCES `nethub`.`tags` (`tag_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nethub`.`history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nethub`.`history` (
  `customer_id` INT(11) NOT NULL,
  `media_id` INT(11) NOT NULL,
  `rating` TINYINT(4) NULL DEFAULT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`customer_id`, `media_id`),
  INDEX `fk_history_customer_idx` (`customer_id` ASC),
  INDEX `fk_history_media1_idx` (`media_id` ASC),
  CONSTRAINT `fk_history_customer`
    FOREIGN KEY (`customer_id`)
    REFERENCES `nethub`.`customer` (`customer_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_history_media1`
    FOREIGN KEY (`media_id`)
    REFERENCES `nethub`.`media` (`media_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nethub`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nethub`.`language` (
  `language_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nethub`.`media_language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nethub`.`media_language` (
  `media_id` INT(11) NOT NULL,
  `language_id` INT(11) NOT NULL,
  PRIMARY KEY (`media_id`, `language_id`),
  INDEX `fk_media_language_language1_idx` (`language_id` ASC),
  CONSTRAINT `fk_media_language_language1`
    FOREIGN KEY (`language_id`)
    REFERENCES `nethub`.`language` (`language_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_media_language_media1`
    FOREIGN KEY (`media_id`)
    REFERENCES `nethub`.`media` (`media_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nethub`.`media_tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nethub`.`media_tags` (
  `tag_id` INT(11) NOT NULL,
  `media_id` INT(11) NOT NULL,
  PRIMARY KEY (`tag_id`, `media_id`),
  INDEX `fk_media_tags_tags1_idx` (`tag_id` ASC),
  INDEX `fk_media_tags_media1_idx` (`media_id` ASC),
  CONSTRAINT `fk_media_tags_media1`
    FOREIGN KEY (`media_id`)
    REFERENCES `nethub`.`media` (`media_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_media_tags_tags1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `nethub`.`tags` (`tag_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nethub`.`seasons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nethub`.`seasons` (
  `media_id` INT(11) NOT NULL,
  `episode_id` INT(11) NOT NULL,
  `number` TINYINT(4) NOT NULL,
  `year` YEAR NULL DEFAULT NULL,
  PRIMARY KEY (`media_id`, `episode_id`),
  INDEX `fk_seasons_media1_idx` (`media_id` ASC),
  INDEX `fk_seasons_episodes1_idx` (`episode_id` ASC),
  CONSTRAINT `fk_seasons_media1`
    FOREIGN KEY (`media_id`)
    REFERENCES `nethub`.`media` (`media_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_seasons_episodes1`
    FOREIGN KEY (`episode_id`)
    REFERENCES `nethub`.`episodes` (`episode_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
