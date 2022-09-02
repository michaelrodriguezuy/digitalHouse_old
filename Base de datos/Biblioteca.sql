-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bibloteca
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bibloteca
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bibloteca` DEFAULT CHARACTER SET utf8 ;
USE `bibloteca` ;

-- -----------------------------------------------------
-- Table `bibloteca`.`socios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibloteca`.`socios` (
  `id_socios` INT NOT NULL,
  `dni` INT NULL,
  `direccion` VARCHAR(200) NULL,
  `nombre` VARCHAR(100) NULL,
  `apellido` VARCHAR(100) NULL,
  `telefono` INT NULL,
  PRIMARY KEY (`id_socios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibloteca`.`editoriales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibloteca`.`editoriales` (
  `id_editorial` INT NOT NULL,
  `razon_social` VARCHAR(100) NULL,
  `telefono` INT NULL,
  PRIMARY KEY (`id_editorial`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibloteca`.`autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibloteca`.`autores` (
  `id_autor` INT NOT NULL,
  `nombre` VARCHAR(100) NULL,
  `apellido` VARCHAR(100) NULL,
  PRIMARY KEY (`id_autor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibloteca`.`libros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibloteca`.`libros` (
  `id_libros` INT NOT NULL,
  `isbn` VARCHAR(50) NULL,
  `titulo` VARCHAR(50) NULL,
  `año_que_se_escribio` SMALLINT NULL,
  `año_de_edicion` SMALLINT NULL,
  `nombre_de_la_editorial` VARCHAR(150) NULL,
  `editoriales_id_editorial` INT NOT NULL,
  `autores_id_autor` INT NOT NULL,
  PRIMARY KEY (`id_libros`),
  INDEX `fk_libros_editoriales1_idx` (`editoriales_id_editorial` ASC) VISIBLE,
  INDEX `fk_libros_autores1_idx` (`autores_id_autor` ASC) VISIBLE,
  CONSTRAINT `fk_libros_editoriales1`
    FOREIGN KEY (`editoriales_id_editorial`)
    REFERENCES `bibloteca`.`editoriales` (`id_editorial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_libros_autores1`
    FOREIGN KEY (`autores_id_autor`)
    REFERENCES `bibloteca`.`autores` (`id_autor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibloteca`.`prestamos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibloteca`.`prestamos` (
  `id_prestamo` INT NOT NULL,
  `socios_id_socios` INT NOT NULL,
  `fecha_retiro` DATE NULL,
  `fecha_tope` DATE NULL,
  `fecha_devolucion` DATE NULL,
  PRIMARY KEY (`id_prestamo`, `socios_id_socios`),
  INDEX `fk_socios_has_libros_socios1_idx` (`socios_id_socios` ASC) VISIBLE,
  CONSTRAINT `fk_socios_has_libros_socios1`
    FOREIGN KEY (`socios_id_socios`)
    REFERENCES `bibloteca`.`socios` (`id_socios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibloteca`.`copias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibloteca`.`copias` (
  `id_copias` INT NOT NULL,
  `libros_id_libros` INT NOT NULL,
  `deterirado` CHAR(1) NOT NULL,
  `prestamos_id_prestamo` INT NOT NULL,
  `prestamos_socios_id_socios` INT NOT NULL,
  PRIMARY KEY (`id_copias`),
  INDEX `fk_copias_libros_idx` (`libros_id_libros` ASC) VISIBLE,
  INDEX `fk_copias_prestamos1_idx` (`prestamos_id_prestamo` ASC, `prestamos_socios_id_socios` ASC) VISIBLE,
  CONSTRAINT `fk_copias_libros`
    FOREIGN KEY (`libros_id_libros`)
    REFERENCES `bibloteca`.`libros` (`id_libros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_copias_prestamos1`
    FOREIGN KEY (`prestamos_id_prestamo` , `prestamos_socios_id_socios`)
    REFERENCES `bibloteca`.`prestamos` (`id_prestamo` , `socios_id_socios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
