-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LaAprobacion
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LaAprobacion
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LaAprobacion` DEFAULT CHARACTER SET utf8 ;
USE `LaAprobacion` ;

-- -----------------------------------------------------
-- Table `LaAprobacion`.`clases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LaAprobacion`.`clases` (
  `idClases` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `precio_costo` FLOAT(7,2) NOT NULL,
  PRIMARY KEY (`idClases`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaAprobacion`.`decoraciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LaAprobacion`.`decoraciones` (
  `idDecoraciones` INT NOT NULL,
  `descripcion` VARCHAR(200) NULL,
  PRIMARY KEY (`idDecoraciones`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaAprobacion`.`habitaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LaAprobacion`.`habitaciones` (
  `idHabitaciones` INT NOT NULL,
  `num_habitacion` SMALLINT NOT NULL,
  `capacidad` TINYINT NOT NULL,
  `clases_idClases` INT NOT NULL,
  `decoraciones_idDecoraciones` INT NOT NULL,
  PRIMARY KEY (`idHabitaciones`),
  INDEX `fk_habitaciones_clases1_idx` (`clases_idClases` ASC) VISIBLE,
  INDEX `fk_habitaciones_decoraciones1_idx` (`decoraciones_idDecoraciones` ASC) VISIBLE,
  CONSTRAINT `fk_habitaciones_clases1`
    FOREIGN KEY (`clases_idClases`)
    REFERENCES `LaAprobacion`.`clases` (`idClases`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_habitaciones_decoraciones1`
    FOREIGN KEY (`decoraciones_idDecoraciones`)
    REFERENCES `LaAprobacion`.`decoraciones` (`idDecoraciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaAprobacion`.`pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LaAprobacion`.`pais` (
  `idPais` INT NOT NULL,
  `nombre` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`idPais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaAprobacion`.`sectores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LaAprobacion`.`sectores` (
  `idSectores` INT NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idSectores`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaAprobacion`.`estadoEmpleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LaAprobacion`.`estadoEmpleado` (
  `idEstadoEmpleado` INT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstadoEmpleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaAprobacion`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LaAprobacion`.`empleados` (
  `idLegajo` INT NOT NULL,
  `apellido` VARCHAR(150) NOT NULL,
  `nombre` VARCHAR(150) NOT NULL,
  `numero_documento` VARCHAR(50) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `domicilio` VARCHAR(200) NOT NULL,
  `telefono_movil` VARCHAR(60) NOT NULL,
  `email` VARCHAR(200) NULL,
  `pais_idPais` INT NOT NULL,
  `sectores_idSectores` INT NOT NULL,
  `estadoEmpleado_idEstadoEmpleado` INT NOT NULL,
  PRIMARY KEY (`idLegajo`),
  INDEX `fk_empleados_pais_idx` (`pais_idPais` ASC) VISIBLE,
  INDEX `fk_empleados_sectores1_idx` (`sectores_idSectores` ASC) VISIBLE,
  INDEX `fk_empleados_estadoEmpleado1_idx` (`estadoEmpleado_idEstadoEmpleado` ASC) VISIBLE,
  CONSTRAINT `fk_empleados_pais`
    FOREIGN KEY (`pais_idPais`)
    REFERENCES `LaAprobacion`.`pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleados_sectores1`
    FOREIGN KEY (`sectores_idSectores`)
    REFERENCES `LaAprobacion`.`sectores` (`idSectores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleados_estadoEmpleado1`
    FOREIGN KEY (`estadoEmpleado_idEstadoEmpleado`)
    REFERENCES `LaAprobacion`.`estadoEmpleado` (`idEstadoEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaAprobacion`.`serviciosBasicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LaAprobacion`.`serviciosBasicos` (
  `idServicios` INT NOT NULL,
  `descripcion` VARCHAR(200) NULL,
  PRIMARY KEY (`idServicios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaAprobacion`.`huespedes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LaAprobacion`.`huespedes` (
  `idHuespedes` INT NOT NULL,
  `apellido` VARCHAR(150) NOT NULL,
  `nombre` VARCHAR(150) NOT NULL,
  `pasaporte` VARCHAR(50) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `domicilio` VARCHAR(200) NOT NULL,
  `telefono_movil` VARCHAR(60) NOT NULL,
  `email` VARCHAR(200) NULL,
  `pais_idPais` INT NOT NULL,
  PRIMARY KEY (`idHuespedes`),
  INDEX `fk_huespedes_pais1_idx` (`pais_idPais` ASC) VISIBLE,
  CONSTRAINT `fk_huespedes_pais1`
    FOREIGN KEY (`pais_idPais`)
    REFERENCES `LaAprobacion`.`pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaAprobacion`.`formaPagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LaAprobacion`.`formaPagos` (
  `idFormaPago` INT NOT NULL,
  `tipo_pago` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idFormaPago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaAprobacion`.`habitaciones_has_serviciosBasicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LaAprobacion`.`habitaciones_has_serviciosBasicos` (
  `habitaciones_idHabitaciones` INT NOT NULL,
  `serviciosBasicos_idServicios` INT NOT NULL,
  PRIMARY KEY (`habitaciones_idHabitaciones`, `serviciosBasicos_idServicios`),
  INDEX `fk_habitaciones_has_serviciosBasicos_serviciosBasicos1_idx` (`serviciosBasicos_idServicios` ASC) VISIBLE,
  INDEX `fk_habitaciones_has_serviciosBasicos_habitaciones1_idx` (`habitaciones_idHabitaciones` ASC) VISIBLE,
  CONSTRAINT `fk_habitaciones_has_serviciosBasicos_habitaciones1`
    FOREIGN KEY (`habitaciones_idHabitaciones`)
    REFERENCES `LaAprobacion`.`habitaciones` (`idHabitaciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_habitaciones_has_serviciosBasicos_serviciosBasicos1`
    FOREIGN KEY (`serviciosBasicos_idServicios`)
    REFERENCES `LaAprobacion`.`serviciosBasicos` (`idServicios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaAprobacion`.`serviciosExtras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LaAprobacion`.`serviciosExtras` (
  `idserviciosExtras` INT NOT NULL,
  `nombre` VARCHAR(60) NOT NULL,
  `costo` FLOAT(7,2) NOT NULL,
  PRIMARY KEY (`idserviciosExtras`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaAprobacion`.`checkins`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LaAprobacion`.`checkins` (
  `idCheckins` INT NOT NULL,
  `fecha_entrada` DATETIME NOT NULL,
  `fecha_salida` DATETIME NOT NULL,
  `importe` FLOAT(7,2) NULL,
  `huespedes_idHuespedes` INT NOT NULL,
  `habitaciones_idHabitaciones` INT NOT NULL,
  `formaPagos_idFormaPago` INT NOT NULL,
  PRIMARY KEY (`idCheckins`),
  INDEX `fk_checkins_huespedes1_idx` (`huespedes_idHuespedes` ASC) VISIBLE,
  INDEX `fk_checkins_formaPagos1_idx` (`formaPagos_idFormaPago` ASC) VISIBLE,
  INDEX `fk_checkins_habitaciones1_idx` (`habitaciones_idHabitaciones` ASC) VISIBLE,
  CONSTRAINT `fk_checkins_huespedes1`
    FOREIGN KEY (`huespedes_idHuespedes`)
    REFERENCES `LaAprobacion`.`huespedes` (`idHuespedes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_checkins_formaPagos1`
    FOREIGN KEY (`formaPagos_idFormaPago`)
    REFERENCES `LaAprobacion`.`formaPagos` (`idFormaPago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_checkins_habitaciones1`
    FOREIGN KEY (`habitaciones_idHabitaciones`)
    REFERENCES `LaAprobacion`.`habitaciones` (`idHabitaciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaAprobacion`.`reservas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LaAprobacion`.`reservas` (
  `idReservas` INT NOT NULL,
  `fecha_hora` DATETIME NOT NULL,
  `cantidad_horas` TIME NOT NULL,
  `importe` FLOAT(7,2) NOT NULL,
  `checkins_idCheckins` INT NOT NULL,
  PRIMARY KEY (`idReservas`),
  INDEX `fk_reservas_checkins1_idx` (`checkins_idCheckins` ASC) VISIBLE,
  CONSTRAINT `fk_reservas_checkins1`
    FOREIGN KEY (`checkins_idCheckins`)
    REFERENCES `LaAprobacion`.`checkins` (`idCheckins`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LaAprobacion`.`reservas_has_serviciosExtras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LaAprobacion`.`reservas_has_serviciosExtras` (
  `reservas_idReservas` INT NOT NULL,
  `serviciosExtras_idserviciosExtras` INT NOT NULL,
  PRIMARY KEY (`reservas_idReservas`, `serviciosExtras_idserviciosExtras`),
  INDEX `fk_reservas_has_serviciosExtras_serviciosExtras1_idx` (`serviciosExtras_idserviciosExtras` ASC) VISIBLE,
  INDEX `fk_reservas_has_serviciosExtras_reservas1_idx` (`reservas_idReservas` ASC) VISIBLE,
  CONSTRAINT `fk_reservas_has_serviciosExtras_reservas1`
    FOREIGN KEY (`reservas_idReservas`)
    REFERENCES `LaAprobacion`.`reservas` (`idReservas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservas_has_serviciosExtras_serviciosExtras1`
    FOREIGN KEY (`serviciosExtras_idserviciosExtras`)
    REFERENCES `LaAprobacion`.`serviciosExtras` (`idserviciosExtras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
