-- MySQL Workbench Synchronization
-- Generated: 2024-09-01 04:06
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Leo Loyola

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `powercore`  DEFAULT COLLATE utf8_general_ci ;

CREATE TABLE IF NOT EXISTS `powercore`.`departamentos` (
  `id_departamento` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_departamento` VARCHAR(50) NULL DEFAULT NULL,
  `id_provincia` INT(11) NULL DEFAULT NULL,
  `zona` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id_departamento`),
  INDEX `fk_departamentos_provincias1_idx` USING BTREE (`id_provincia`) VISIBLE,
  CONSTRAINT `departamentos_ibfk_1`
    FOREIGN KEY (`id_provincia`)
    REFERENCES `powercore`.`provincias` (`id_provincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 171
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `powercore`.`localidades` (
  `id_localidad` INT(11) NOT NULL AUTO_INCREMENT,
  `localidad` VARCHAR(200) NULL DEFAULT NULL,
  `id_departamento` INT(11) NULL DEFAULT NULL,
  `codigo_postal` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id_localidad`),
  INDEX `fk_tb_localidades_tb_departamentos1_idx` USING BTREE (`id_departamento`) VISIBLE,
  CONSTRAINT `tb_localidades_ibfk_1`
    FOREIGN KEY (`id_departamento`)
    REFERENCES `powercore`.`departamentos` (`id_departamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 390
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `powercore`.`paises` (
  `id_pais` INT(11) NOT NULL AUTO_INCREMENT,
  `abreviatura_pais` VARCHAR(255) NULL DEFAULT NULL,
  `nombre_pais` VARCHAR(255) NULL DEFAULT NULL,
  `iso_pais` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id_pais`))
ENGINE = InnoDB
AUTO_INCREMENT = 202
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `powercore`.`provincias` (
  `id_provincia` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_provincia` VARCHAR(50) NULL DEFAULT NULL,
  `id_pais` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id_provincia`),
  INDEX `fk_tb_provincias_tb_paises1_idx` USING BTREE (`id_pais`) VISIBLE,
  CONSTRAINT `fk_tb_provincias_tb_paises1`
    FOREIGN KEY (`id_pais`)
    REFERENCES `powercore`.`paises` (`id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 103
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `powercore`.`usuarios` (
  `id_usuario` INT(11) NOT NULL AUTO_INCREMENT,
  `id_rol` INT(11) NULL DEFAULT NULL,
  `apellido` VARCHAR(65) NULL DEFAULT NULL,
  `nombre` VARCHAR(75) NULL DEFAULT NULL,
  `dni` VARCHAR(45) NULL DEFAULT NULL,
  `telefono` VARCHAR(65) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `avatar` VARCHAR(255) NULL DEFAULT NULL,
  `barrio` VARCHAR(45) NULL DEFAULT NULL,
  `calle` VARCHAR(65) NULL DEFAULT NULL,
  `numero` INT(11) NULL DEFAULT NULL,
  `id_localidad` INT(11) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  `id_estado` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  INDEX `fk_usuarios_roles1_idx` (`id_rol` ASC) VISIBLE,
  INDEX `fk_usuarios_tb_localidades1_idx` (`id_localidad` ASC) VISIBLE,
  INDEX `fk_usuarios_estados1_idx` (`id_estado` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_roles1`
    FOREIGN KEY (`id_rol`)
    REFERENCES `powercore`.`roles` (`idrole`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_tb_localidades1`
    FOREIGN KEY (`id_localidad`)
    REFERENCES `powercore`.`localidades` (`id_localidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_estados1`
    FOREIGN KEY (`id_estado`)
    REFERENCES `powercore`.`estados` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `powercore`.`roles` (
  `idrole` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(65) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`idrole`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `powercore`.`productos` (
  `id_producto` INT(11) NOT NULL,
  `imagen_principal` VARCHAR(255) NULL DEFAULT NULL,
  `nombre_producto` VARCHAR(100) NULL DEFAULT NULL,
  `descripcion` VARCHAR(255) NULL DEFAULT NULL,
  `codigo` VARCHAR(45) NULL DEFAULT NULL,
  `precio` DECIMAL(10,2) NULL DEFAULT NULL,
  `id_categoria` INT(11) NULL DEFAULT NULL,
  `precio_contado` DECIMAL(10,2) NULL DEFAULT NULL,
  `precio_mercadopago` DECIMAL(10,2) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  INDEX `fk_productos_categorias_idx` (`id_categoria` ASC) VISIBLE,
  CONSTRAINT `fk_productos_categorias`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `powercore`.`categorias` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `powercore`.`categorias` (
  `id_categoria` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(75) NOT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `powercore`.`productos_imagenes` (
  `id_producto_imagen` INT(11) NOT NULL AUTO_INCREMENT,
  `id_producto` INT(11) NULL DEFAULT NULL,
  `id_imagen` INT(11) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  INDEX `fk_productos_imagenes_imagenes1_idx` (`id_imagen` ASC) VISIBLE,
  INDEX `fk_productos_imagenes_productos1_idx` (`id_producto` ASC) VISIBLE,
  PRIMARY KEY (`id_producto_imagen`),
  CONSTRAINT `fk_productos_imagenes_imagenes1`
    FOREIGN KEY (`id_imagen`)
    REFERENCES `powercore`.`imagenes` (`id_imagen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_imagenes_productos1`
    FOREIGN KEY (`id_producto`)
    REFERENCES `powercore`.`productos` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `powercore`.`imagenes` (
  `id_imagen` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(255) NOT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id_imagen`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `powercore`.`contactos` (
  `idcontacto` INT(11) NOT NULL AUTO_INCREMENT,
  `apellido` VARCHAR(65) NULL DEFAULT NULL,
  `nombre` VARCHAR(65) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `id_area` INT(11) NULL DEFAULT NULL,
  `consulta` TEXT(500) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  `estado` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idcontacto`),
  INDEX `fk_contactos_areas1_idx` (`id_area` ASC) VISIBLE,
  INDEX `fk_contactos_estados1_idx` (`estado` ASC) VISIBLE,
  CONSTRAINT `fk_contactos_areas1`
    FOREIGN KEY (`id_area`)
    REFERENCES `powercore`.`areas` (`idarea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contactos_estados1`
    FOREIGN KEY (`estado`)
    REFERENCES `powercore`.`estados` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `powercore`.`modalidad_pagos` (
  `id_modalidad_pago` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(65) NULL DEFAULT NULL,
  `porcentaje` INT(11) NULL DEFAULT NULL,
  `estado` INT(11) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id_modalidad_pago`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `powercore`.`carritos` (
  `id_carrito` INT(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` INT(11) NULL DEFAULT NULL,
  `estado` VARCHAR(45) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id_carrito`),
  INDEX `fk_carritos_usuarios1_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_carritos_usuarios1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `powercore`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `powercore`.`logs` (
  `idlog` INT(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` INT(11) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`idlog`),
  INDEX `fk_logs_usuarios1_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_logs_usuarios1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `powercore`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `powercore`.`areas` (
  `idarea` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_area` VARCHAR(45) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`idarea`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `powercore`.`carrito_productos` (
  `id_carrito_producto` INT(11) NOT NULL AUTO_INCREMENT,
  `id_carrito` INT(11) NULL DEFAULT NULL,
  `id_producto` INT(11) NULL DEFAULT NULL,
  `cantidad` INT(11) NULL DEFAULT NULL,
  `precio_compra` DECIMAL(10,2) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id_carrito_producto`),
  INDEX `fk_carrito_productos_carritos1_idx` (`id_carrito` ASC) VISIBLE,
  INDEX `fk_carrito_productos_productos1_idx` (`id_producto` ASC) VISIBLE,
  CONSTRAINT `fk_carrito_productos_carritos1`
    FOREIGN KEY (`id_carrito`)
    REFERENCES `powercore`.`carritos` (`id_carrito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_carrito_productos_productos1`
    FOREIGN KEY (`id_producto`)
    REFERENCES `powercore`.`productos` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `powercore`.`ordenes` (
  `id_orden` INT(11) NOT NULL AUTO_INCREMENT,
  `id_carrito` INT(11) NULL DEFAULT NULL,
  `total_abonado` DECIMAL(10,2) NULL DEFAULT NULL,
  `estado` INT(11) NULL DEFAULT NULL,
  `id_modalidad_pago` INT(11) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id_orden`),
  INDEX `fk_ordenes_carritos1_idx` (`id_carrito` ASC) VISIBLE,
  INDEX `fk_ordenes_modalidad_pagos1_idx` (`id_modalidad_pago` ASC) VISIBLE,
  CONSTRAINT `fk_ordenes_carritos1`
    FOREIGN KEY (`id_carrito`)
    REFERENCES `powercore`.`carritos` (`id_carrito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordenes_modalidad_pagos1`
    FOREIGN KEY (`id_modalidad_pago`)
    REFERENCES `powercore`.`modalidad_pagos` (`id_modalidad_pago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `powercore`.`estados` (
  `id_estado` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_estado` VARCHAR(45) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id_estado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
