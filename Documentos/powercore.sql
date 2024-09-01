/*
 Navicat Premium Data Transfer

 Source Server         : mipc
 Source Server Type    : MySQL
 Source Server Version : 110502
 Source Host           : localhost:3306
 Source Schema         : powercore

 Target Server Type    : MySQL
 Target Server Version : 110502
 File Encoding         : 65001

 Date: 01/09/2024 04:03:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for areas
-- ----------------------------
DROP TABLE IF EXISTS `areas`;
CREATE TABLE `areas`  (
  `idarea` int NOT NULL AUTO_INCREMENT,
  `nombre_area` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`idarea`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of areas
-- ----------------------------

-- ----------------------------
-- Table structure for carrito_productos
-- ----------------------------
DROP TABLE IF EXISTS `carrito_productos`;
CREATE TABLE `carrito_productos`  (
  `id_carrito_producto` int NOT NULL AUTO_INCREMENT,
  `id_carrito` int NULL DEFAULT NULL,
  `id_producto` int NULL DEFAULT NULL,
  `cantidad` int NULL DEFAULT NULL,
  `precio_compra` decimal(10, 2) NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_carrito_producto`) USING BTREE,
  INDEX `fk_carrito_productos_carritos1_idx`(`id_carrito`) USING BTREE,
  INDEX `fk_carrito_productos_productos1_idx`(`id_producto`) USING BTREE,
  CONSTRAINT `fk_carrito_productos_carritos1` FOREIGN KEY (`id_carrito`) REFERENCES `carritos` (`id_carrito`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_carrito_productos_productos1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carrito_productos
-- ----------------------------

-- ----------------------------
-- Table structure for carritos
-- ----------------------------
DROP TABLE IF EXISTS `carritos`;
CREATE TABLE `carritos`  (
  `id_carrito` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NULL DEFAULT NULL,
  `estado` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_carrito`) USING BTREE,
  INDEX `fk_carritos_usuarios1_idx`(`id_usuario`) USING BTREE,
  CONSTRAINT `fk_carritos_usuarios1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carritos
-- ----------------------------

-- ----------------------------
-- Table structure for categorias
-- ----------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias`  (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(75) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_categoria`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categorias
-- ----------------------------

-- ----------------------------
-- Table structure for contactos
-- ----------------------------
DROP TABLE IF EXISTS `contactos`;
CREATE TABLE `contactos`  (
  `idcontacto` int NOT NULL AUTO_INCREMENT,
  `apellido` varchar(65) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `nombre` varchar(65) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `id_area` int NULL DEFAULT NULL,
  `consulta` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `estado` int NULL DEFAULT NULL,
  PRIMARY KEY (`idcontacto`) USING BTREE,
  INDEX `fk_contactos_areas1_idx`(`id_area`) USING BTREE,
  INDEX `fk_contactos_estados1_idx`(`estado`) USING BTREE,
  CONSTRAINT `fk_contactos_areas1` FOREIGN KEY (`id_area`) REFERENCES `areas` (`idarea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contactos_estados1` FOREIGN KEY (`estado`) REFERENCES `estados` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contactos
-- ----------------------------

-- ----------------------------
-- Table structure for departamentos
-- ----------------------------
DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE `departamentos`  (
  `id_departamento` int NOT NULL AUTO_INCREMENT,
  `nombre_departamento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `id_provincia` int NULL DEFAULT NULL,
  `zona` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_departamento`) USING BTREE,
  INDEX `fk_departamentos_provincias1_idx`(`id_provincia`) USING BTREE,
  CONSTRAINT `departamentos_ibfk_1` FOREIGN KEY (`id_provincia`) REFERENCES `provincias` (`id_provincia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 171 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departamentos
-- ----------------------------

-- ----------------------------
-- Table structure for estados
-- ----------------------------
DROP TABLE IF EXISTS `estados`;
CREATE TABLE `estados`  (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `nombre_estado` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_uca1400_ai_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_estado`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of estados
-- ----------------------------

-- ----------------------------
-- Table structure for imagenes
-- ----------------------------
DROP TABLE IF EXISTS `imagenes`;
CREATE TABLE `imagenes`  (
  `id_imagen` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_imagen`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of imagenes
-- ----------------------------

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs`  (
  `idlog` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`idlog`) USING BTREE,
  INDEX `fk_logs_usuarios1_idx`(`id_usuario`) USING BTREE,
  CONSTRAINT `fk_logs_usuarios1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of logs
-- ----------------------------

-- ----------------------------
-- Table structure for modalidad_pagos
-- ----------------------------
DROP TABLE IF EXISTS `modalidad_pagos`;
CREATE TABLE `modalidad_pagos`  (
  `id_modalidad_pago` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(65) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `porcentaje` int NULL DEFAULT NULL,
  `estado` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_modalidad_pago`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of modalidad_pagos
-- ----------------------------

-- ----------------------------
-- Table structure for ordenes
-- ----------------------------
DROP TABLE IF EXISTS `ordenes`;
CREATE TABLE `ordenes`  (
  `id_orden` int NOT NULL AUTO_INCREMENT,
  `id_carrito` int NULL DEFAULT NULL,
  `total_abonado` decimal(10, 2) NULL DEFAULT NULL,
  `estado` int NULL DEFAULT NULL,
  `id_modalidad_pago` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_orden`) USING BTREE,
  INDEX `fk_ordenes_carritos1_idx`(`id_carrito`) USING BTREE,
  INDEX `fk_ordenes_modalidad_pagos1_idx`(`id_modalidad_pago`) USING BTREE,
  CONSTRAINT `fk_ordenes_carritos1` FOREIGN KEY (`id_carrito`) REFERENCES `carritos` (`id_carrito`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordenes_modalidad_pagos1` FOREIGN KEY (`id_modalidad_pago`) REFERENCES `modalidad_pagos` (`id_modalidad_pago`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_uca1400_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ordenes
-- ----------------------------

-- ----------------------------
-- Table structure for paises
-- ----------------------------
DROP TABLE IF EXISTS `paises`;
CREATE TABLE `paises`  (
  `id_pais` int NOT NULL AUTO_INCREMENT,
  `abreviatura_pais` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `nombre_pais` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `iso_pais` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_pais`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 202 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paises
-- ----------------------------

-- ----------------------------
-- Table structure for productos
-- ----------------------------
DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos`  (
  `id_producto` int NOT NULL,
  `imagen_principal` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `nombre_producto` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `codigo` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `precio` decimal(10, 2) NULL DEFAULT NULL,
  `id_categoria` int NULL DEFAULT NULL,
  `precio_contado` decimal(10, 2) NULL DEFAULT NULL,
  `precio_mercadopago` decimal(10, 2) NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_producto`) USING BTREE,
  INDEX `fk_productos_categorias_idx`(`id_categoria`) USING BTREE,
  CONSTRAINT `fk_productos_categorias` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productos
-- ----------------------------

-- ----------------------------
-- Table structure for productos_imagenes
-- ----------------------------
DROP TABLE IF EXISTS `productos_imagenes`;
CREATE TABLE `productos_imagenes`  (
  `id_producto_imagen` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NULL DEFAULT NULL,
  `id_imagen` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_producto_imagen`) USING BTREE,
  INDEX `fk_productos_imagenes_imagenes1_idx`(`id_imagen`) USING BTREE,
  INDEX `fk_productos_imagenes_productos1_idx`(`id_producto`) USING BTREE,
  CONSTRAINT `fk_productos_imagenes_imagenes1` FOREIGN KEY (`id_imagen`) REFERENCES `imagenes` (`id_imagen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_imagenes_productos1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productos_imagenes
-- ----------------------------

-- ----------------------------
-- Table structure for provincias
-- ----------------------------
DROP TABLE IF EXISTS `provincias`;
CREATE TABLE `provincias`  (
  `id_provincia` int NOT NULL AUTO_INCREMENT,
  `nombre_provincia` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `id_pais` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_provincia`) USING BTREE,
  INDEX `fk_tb_provincias_tb_paises1_idx`(`id_pais`) USING BTREE,
  CONSTRAINT `fk_tb_provincias_tb_paises1` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id_pais`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of provincias
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `idrole` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(65) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`idrole`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `id_rol` int NULL DEFAULT NULL,
  `apellido` varchar(65) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `nombre` varchar(75) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `dni` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `telefono` varchar(65) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `barrio` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `calle` varchar(65) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `numero` int NULL DEFAULT NULL,
  `id_localidad` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `id_estado` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`) USING BTREE,
  INDEX `fk_usuarios_roles1_idx`(`id_rol`) USING BTREE,
  INDEX `fk_usuarios_tb_localidades1_idx`(`id_localidad`) USING BTREE,
  INDEX `fk_usuarios_estados1_idx`(`id_estado`) USING BTREE,
  CONSTRAINT `fk_usuarios_estados1` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_roles1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`idrole`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_tb_localidades1` FOREIGN KEY (`id_localidad`) REFERENCES `localidades` (`id_localidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usuarios
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
