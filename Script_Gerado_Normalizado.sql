-- MySQL Script generated by MySQL Workbench
-- Sex 09 Set 2016 12:30:24 BRT
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Paciente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Telefone` VARCHAR(45) NOT NULL,
  `Endereco` VARCHAR(45) NOT NULL,
  `DataNascimento` DATE NOT NULL,
  `Sexo` ENUM('M', 'F') NOT NULL,
  `Convenio` VARCHAR(45) NOT NULL,
  `EstadoCivil` ENUM('C', 'S') NOT NULL,
  `RG` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Consulta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Medico` VARCHAR(45) NOT NULL,
  `Data` DATE NOT NULL,
  `Paciente_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Paciente_id`),
  INDEX `fk_Consulta_Paciente_idx` (`Paciente_id` ASC),
  CONSTRAINT `fk_Consulta_Paciente`
    FOREIGN KEY (`Paciente_id`)
    REFERENCES `mydb`.`Paciente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Diagnostico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Diagnostico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Consulta_id` INT NOT NULL,
  `Consulta_Paciente_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Consulta_id`, `Consulta_Paciente_id`),
  INDEX `fk_Diagnostico_Consulta1_idx` (`Consulta_id` ASC, `Consulta_Paciente_id` ASC),
  CONSTRAINT `fk_Diagnostico_Consulta1`
    FOREIGN KEY (`Consulta_id` , `Consulta_Paciente_id`)
    REFERENCES `mydb`.`Consulta` (`id` , `Paciente_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Exame`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Exame` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Data` DATE NOT NULL,
  `Exame` VARCHAR(45) NOT NULL,
  `Consulta_id` INT NOT NULL,
  `Consulta_Paciente_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Consulta_id`, `Consulta_Paciente_id`),
  INDEX `fk_Exame_Consulta1_idx` (`Consulta_id` ASC, `Consulta_Paciente_id` ASC),
  CONSTRAINT `fk_Exame_Consulta1`
    FOREIGN KEY (`Consulta_id` , `Consulta_Paciente_id`)
    REFERENCES `mydb`.`Consulta` (`id` , `Paciente_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
