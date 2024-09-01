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

 Date: 01/09/2024 04:35:33
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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of areas
-- ----------------------------
INSERT INTO `areas` VALUES (1, 'Venta', '2024-09-01 04:30:27', '2024-09-01 04:30:33');
INSERT INTO `areas` VALUES (2, 'Reparacion', '2024-09-01 04:30:36', '2024-09-01 04:30:39');
INSERT INTO `areas` VALUES (3, 'Ofertas', '2024-09-01 04:33:41', '2024-09-01 04:33:45');

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_uca1400_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of carrito_productos
-- ----------------------------
INSERT INTO `carrito_productos` VALUES (1, 1, 1, 1, 35000.00, '2024-09-01 04:29:05', '2024-09-01 04:29:05');
INSERT INTO `carrito_productos` VALUES (2, 1, 2, 2, 24000.00, '2024-09-01 04:29:05', '2024-09-01 04:29:05');
INSERT INTO `carrito_productos` VALUES (3, 2, 3, 1, 25000.00, '2024-09-01 04:29:05', '2024-09-01 04:29:05');

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of carritos
-- ----------------------------
INSERT INTO `carritos` VALUES (1, 1, 'Pendiente', '2024-09-01 04:28:54', '2024-09-01 04:28:54');
INSERT INTO `carritos` VALUES (2, 2, 'Activo', '2024-09-01 04:28:54', '2024-09-01 04:28:54');
INSERT INTO `carritos` VALUES (3, 3, 'Inactivo', '2024-09-01 04:28:54', '2024-09-01 04:28:54');

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categorias
-- ----------------------------
INSERT INTO `categorias` VALUES (1, 'Electrónica', '2024-09-01 04:27:55', '2024-09-01 04:27:55');
INSERT INTO `categorias` VALUES (2, 'Hogar', '2024-09-01 04:27:55', '2024-09-01 04:27:55');
INSERT INTO `categorias` VALUES (3, 'Deportes', '2024-09-01 04:27:55', '2024-09-01 04:27:55');

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of contactos
-- ----------------------------
INSERT INTO `contactos` VALUES (1, 'Pérez', 'Juan', 'juan.perez@example.com', 1, 'Consulta sobre producto A', '2024-09-01 04:34:39', '2024-09-01 04:34:39', 1);
INSERT INTO `contactos` VALUES (2, 'Gómez', 'María', 'maria.gomez@example.com', 2, 'Pregunta sobre el servicio B', '2024-09-01 04:34:39', '2024-09-01 04:34:39', 1);
INSERT INTO `contactos` VALUES (3, 'Rodríguez', 'Carlos', 'carlos.rodriguez@example.com', 1, 'Problema con la instalación', '2024-09-01 04:34:39', '2024-09-01 04:34:39', 2);
INSERT INTO `contactos` VALUES (4, 'Fernández', 'Lucía', 'lucia.fernandez@example.com', 2, 'Consulta sobre la facturación', '2024-09-01 04:34:39', '2024-09-01 04:34:39', 1);
INSERT INTO `contactos` VALUES (5, 'López', 'Ana', 'ana.lopez@example.com', 1, 'Solicitud de soporte técnico', '2024-09-01 04:34:39', '2024-09-01 04:34:39', 3);

-- ----------------------------
-- Table structure for departamentos
-- ----------------------------
DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE `departamentos`  (
  `id_departamento` int NOT NULL AUTO_INCREMENT,
  `nombre_departamento` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_provincia` int NULL DEFAULT NULL,
  `zona` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_departamento`) USING BTREE,
  INDEX `fk_departamentos_provincias1_idx`(`id_provincia`) USING BTREE,
  CONSTRAINT `fk_departamentos_provincias1` FOREIGN KEY (`id_provincia`) REFERENCES `provincias` (`id_provincia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departamentos
-- ----------------------------
INSERT INTO `departamentos` VALUES (1, 'CAPITAL', 11, 'IV');
INSERT INTO `departamentos` VALUES (2, 'ARAUCO', 11, 'III');
INSERT INTO `departamentos` VALUES (3, 'SANAGASTA', 11, 'IV');
INSERT INTO `departamentos` VALUES (4, 'CHAMICAL', 11, 'V');
INSERT INTO `departamentos` VALUES (5, 'FAMATINA', 11, 'II');
INSERT INTO `departamentos` VALUES (6, 'CHILECITO', 11, 'II');
INSERT INTO `departamentos` VALUES (7, 'CASTRO BARROS', 11, 'III');
INSERT INTO `departamentos` VALUES (8, 'SAN MARTIN', 11, 'VI');
INSERT INTO `departamentos` VALUES (9, 'GRAL. OCAMPO', 11, 'VII');
INSERT INTO `departamentos` VALUES (10, 'INDEPENDENCIA', 11, 'IV');
INSERT INTO `departamentos` VALUES (11, 'GRAL. BELGRANO', 11, 'V');
INSERT INTO `departamentos` VALUES (12, 'FELIPE VARELA', 11, 'I');
INSERT INTO `departamentos` VALUES (13, 'GRAL. LAMADRID', 11, 'I');
INSERT INTO `departamentos` VALUES (14, 'S. B. DE LOS SAUCES', 11, 'III');
INSERT INTO `departamentos` VALUES (15, 'GRAL J.F.QUIROGA', 11, 'VI');
INSERT INTO `departamentos` VALUES (16, 'VINCHINA', 11, 'I');
INSERT INTO `departamentos` VALUES (17, 'GRAL ANGEL V. PEÑALOZA', 11, 'V');
INSERT INTO `departamentos` VALUES (18, 'ROSARIO V. PEÑALOZA', 11, 'VI');

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_uca1400_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of estados
-- ----------------------------
INSERT INTO `estados` VALUES (1, 'Activo', '2024-09-01 04:27:37', '2024-09-01 04:27:37');
INSERT INTO `estados` VALUES (2, 'Inactivo', '2024-09-01 04:27:37', '2024-09-01 04:27:37');
INSERT INTO `estados` VALUES (3, 'Pendiente', '2024-09-01 04:27:37', '2024-09-01 04:27:37');

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of imagenes
-- ----------------------------
INSERT INTO `imagenes` VALUES (1, 'imagen_producto1_1.jpg', '2024-09-01 04:28:27', '2024-09-01 04:28:27');
INSERT INTO `imagenes` VALUES (2, 'imagen_producto1_2.jpg', '2024-09-01 04:28:27', '2024-09-01 04:28:27');
INSERT INTO `imagenes` VALUES (3, 'imagen_producto2_1.jpg', '2024-09-01 04:28:27', '2024-09-01 04:28:27');
INSERT INTO `imagenes` VALUES (4, 'imagen_producto3_1.jpg', '2024-09-01 04:28:27', '2024-09-01 04:28:27');

-- ----------------------------
-- Table structure for localidades
-- ----------------------------
DROP TABLE IF EXISTS `localidades`;
CREATE TABLE `localidades`  (
  `id_localidad` int NOT NULL AUTO_INCREMENT,
  `localidad` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  `id_departamento` int NULL DEFAULT NULL,
  `codigo_postal` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_localidad`) USING BTREE,
  INDEX `fk_localidades_departamentos1_idx`(`id_departamento`) USING BTREE,
  CONSTRAINT `fk_localidades_departamentos1` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id_departamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 390 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of localidades
-- ----------------------------
INSERT INTO `localidades` VALUES (1, 'ARAUCO', 2, '5315');
INSERT INTO `localidades` VALUES (2, 'AIMOGASTA', 2, '5310');
INSERT INTO `localidades` VALUES (3, 'UDPINANGO', 2, '5387');
INSERT INTO `localidades` VALUES (4, 'LA CAUCHITA', 2, '5361');
INSERT INTO `localidades` VALUES (5, 'TINOCAN', 2, '5363');
INSERT INTO `localidades` VALUES (6, 'LA CIMBRITA', 2, '5365');
INSERT INTO `localidades` VALUES (7, 'TERMAS DE SANTA TERESITA', 2, '5311');
INSERT INTO `localidades` VALUES (8, 'SAN ANTONIO', 2, '5370');
INSERT INTO `localidades` VALUES (9, 'ESTACION MAZAN', 2, '5317');
INSERT INTO `localidades` VALUES (10, 'VILLA MAZAN', 2, '5317');
INSERT INTO `localidades` VALUES (11, 'BAÑADO DE LOS PANTANOS', 2, '5381');
INSERT INTO `localidades` VALUES (12, 'MACHIGASTA', 2, '5370');
INSERT INTO `localidades` VALUES (13, 'LA CANCHITA', 2, '5370');
INSERT INTO `localidades` VALUES (14, 'BAZAN', 1, '5381');
INSERT INTO `localidades` VALUES (15, 'SALADILLO', 1, '5365');
INSERT INTO `localidades` VALUES (16, 'LAS CATAS', 1, '5363');
INSERT INTO `localidades` VALUES (17, 'ANCHICO', 1, '5361');
INSERT INTO `localidades` VALUES (18, 'SAN JOSE', 1, '5313');
INSERT INTO `localidades` VALUES (19, 'EL CANTADERO', 1, '5361');
INSERT INTO `localidades` VALUES (20, 'LA LANCHA', 1, '5370');
INSERT INTO `localidades` VALUES (21, 'SAN LORENZO', 1, '5317');
INSERT INTO `localidades` VALUES (22, 'SIERRA BRAVA', 1, '5385');
INSERT INTO `localidades` VALUES (23, 'TRAMPA DEL TIGRE', 1, '5365');
INSERT INTO `localidades` VALUES (24, 'EL ROSARIO', 1, '5365');
INSERT INTO `localidades` VALUES (25, 'ESTANCIA SAN JOSE', 1, '5370');
INSERT INTO `localidades` VALUES (26, 'AMPATA', 1, '5311');
INSERT INTO `localidades` VALUES (27, 'LA CAÑADA', 1, '5361');
INSERT INTO `localidades` VALUES (28, 'POZO DE LA YEGUA', 1, '5363');
INSERT INTO `localidades` VALUES (29, 'EL TALA', 1, '5311');
INSERT INTO `localidades` VALUES (30, 'BAJO HONDO', 1, '5313');
INSERT INTO `localidades` VALUES (31, 'PUERTO ALEGRE', 1, '5374');
INSERT INTO `localidades` VALUES (32, 'EL SUNCHAL', 1, '5385');
INSERT INTO `localidades` VALUES (33, 'EL QUEBRACHO', 1, '5365');
INSERT INTO `localidades` VALUES (34, 'SAN NICOLAS DEL RECREO', 1, '5381');
INSERT INTO `localidades` VALUES (35, 'SAN PEDRO', 1, '5315');
INSERT INTO `localidades` VALUES (36, 'SAN NICOLAS', 1, '5387');
INSERT INTO `localidades` VALUES (37, 'SANTO DOMINGO', 1, '5374');
INSERT INTO `localidades` VALUES (38, 'LA RIOJA', 1, '5300');
INSERT INTO `localidades` VALUES (39, 'LA RAMADITA', 1, '5374');
INSERT INTO `localidades` VALUES (40, 'SAN BERNARDO', 1, '5361');
INSERT INTO `localidades` VALUES (41, 'LA ANTIGUA', 1, '5311');
INSERT INTO `localidades` VALUES (42, 'COLONIA FRUTIHORTICOLA', 1, '5374');
INSERT INTO `localidades` VALUES (43, 'LA LATA', 1, '5361');
INSERT INTO `localidades` VALUES (44, 'TALAMUYUNA', 1, '5381');
INSERT INTO `localidades` VALUES (45, 'SAN RAFAEL', 1, '5315');
INSERT INTO `localidades` VALUES (46, 'SAN JUAN', 1, '5363');
INSERT INTO `localidades` VALUES (47, 'CARRIZAL', 1, '5313');
INSERT INTO `localidades` VALUES (48, 'SAN ANTONIO', 1, '5361');
INSERT INTO `localidades` VALUES (49, 'SAN MIGUEL', 1, '5387');
INSERT INTO `localidades` VALUES (50, 'CEBOLLAR', 1, '5313');
INSERT INTO `localidades` VALUES (51, 'LAS HIGUERILLAS', 1, '5385');
INSERT INTO `localidades` VALUES (52, 'EL DURAZNILLO', 1, '5374');
INSERT INTO `localidades` VALUES (53, 'EL BARREAL', 1, '5365');
INSERT INTO `localidades` VALUES (54, 'SANTA VERA CRUZ', 7, '5370');
INSERT INTO `localidades` VALUES (55, 'PINCHAS', 7, '5381');
INSERT INTO `localidades` VALUES (56, 'ISMIANGO', 7, '5381');
INSERT INTO `localidades` VALUES (57, 'ANJULLON', 7, '5387');
INSERT INTO `localidades` VALUES (58, 'AGUA BLANCA', 7, '5370');
INSERT INTO `localidades` VALUES (59, 'LOS MOLINOS', 7, '5313');
INSERT INTO `localidades` VALUES (60, 'SANTA CRUZ', 7, '5381');
INSERT INTO `localidades` VALUES (61, 'AMINGA', 7, '5385');
INSERT INTO `localidades` VALUES (62, 'CHUQUIS', 7, '5363');
INSERT INTO `localidades` VALUES (63, 'SAN PEDRO', 7, '5361');
INSERT INTO `localidades` VALUES (64, 'ANILLACO', 7, '5313');
INSERT INTO `localidades` VALUES (65, 'LAS FLORES', 4, '5387');
INSERT INTO `localidades` VALUES (66, 'POLCO', 4, '5370');
INSERT INTO `localidades` VALUES (67, 'EL GARABATO', 4, '5311');
INSERT INTO `localidades` VALUES (68, 'SANTA RITA DE LA ZANJA', 4, '5301');
INSERT INTO `localidades` VALUES (69, 'VILLA CARMELA', 4, '5301');
INSERT INTO `localidades` VALUES (70, 'SANTA LUCIA', 4, '5367');
INSERT INTO `localidades` VALUES (71, 'BASE CHAMICAL', 4, '5367');
INSERT INTO `localidades` VALUES (72, 'ESQUINA DEL NORTE', 4, '5360');
INSERT INTO `localidades` VALUES (73, 'CHAMICAL', 4, '5367');
INSERT INTO `localidades` VALUES (74, 'LA RESISTENCIA', 4, '5367');
INSERT INTO `localidades` VALUES (75, 'EL RETAMO', 4, '5367');
INSERT INTO `localidades` VALUES (76, 'POZO REDONDO', 4, '5367');
INSERT INTO `localidades` VALUES (77, 'POZO DE LA VACA', 4, '5367');
INSERT INTO `localidades` VALUES (78, 'LA AGUADITA', 4, '5367');
INSERT INTO `localidades` VALUES (79, 'ROSILLO MUERTO', 4, '5367');
INSERT INTO `localidades` VALUES (80, 'CHULO', 4, '5367');
INSERT INTO `localidades` VALUES (81, 'EL QUEBRACHAL', 4, '5367');
INSERT INTO `localidades` VALUES (82, 'EL CARMEN', 4, '5367');
INSERT INTO `localidades` VALUES (83, 'BELLA VISTA', 4, '5367');
INSERT INTO `localidades` VALUES (84, 'LAS TALAS', 4, '5367');
INSERT INTO `localidades` VALUES (85, 'LOS BALDES', 4, '5367');
INSERT INTO `localidades` VALUES (86, 'LOS BORDOS', 4, '5367');
INSERT INTO `localidades` VALUES (87, 'EL MOLLAR', 4, '5367');
INSERT INTO `localidades` VALUES (88, 'LAS AMOLADERAS', 4, '5367');
INSERT INTO `localidades` VALUES (89, 'BAJO DE LUCAS', 4, '5367');
INSERT INTO `localidades` VALUES (90, 'SANTA BARBARA', 4, '5367');
INSERT INTO `localidades` VALUES (91, 'LA CORTADA', 4, '5367');
INSERT INTO `localidades` VALUES (92, 'LA SERENA', 4, '5367');
INSERT INTO `localidades` VALUES (93, 'SAN RAFAEL', 4, '5367');
INSERT INTO `localidades` VALUES (94, 'MALLIGASTA', 6, '5367');
INSERT INTO `localidades` VALUES (95, 'LAS HIGUERITAS', 6, '5367');
INSERT INTO `localidades` VALUES (96, 'SAN MIGUEL', 6, '5367');
INSERT INTO `localidades` VALUES (97, 'SANTA FLORENTINA', 6, '5367');
INSERT INTO `localidades` VALUES (98, 'GUANCHIN', 6, '5367');
INSERT INTO `localidades` VALUES (99, 'MIRANDA', 6, '5367');
INSERT INTO `localidades` VALUES (100, 'SAÑOGASTA', 6, '5367');
INSERT INTO `localidades` VALUES (101, 'COLONIA VICHIGASTA', 6, '5367');
INSERT INTO `localidades` VALUES (102, 'COLONIA MALLIGASTA', 6, '5367');
INSERT INTO `localidades` VALUES (103, 'ANGUINAN', 6, '5367');
INSERT INTO `localidades` VALUES (104, 'VICHIGASTA', 6, '5367');
INSERT INTO `localidades` VALUES (105, 'NONOGASTA', 6, '5360');
INSERT INTO `localidades` VALUES (106, 'CHILECITO', 6, '5367');
INSERT INTO `localidades` VALUES (107, 'COLONIA ANGUINAN', 6, '5367');
INSERT INTO `localidades` VALUES (108, 'TILIMUQUI', 6, '5360');
INSERT INTO `localidades` VALUES (109, 'LOS SARMIENTOS', 6, '5367');
INSERT INTO `localidades` VALUES (110, 'SAN NICOLAS', 6, '5367');
INSERT INTO `localidades` VALUES (111, 'COLONIA CATINZACO', 6, '5367');
INSERT INTO `localidades` VALUES (112, 'LA PUNTILLA', 6, '5367');
INSERT INTO `localidades` VALUES (113, 'VILLA UNION', 12, '5367');
INSERT INTO `localidades` VALUES (114, 'ANCHUMBIL', 12, '5367');
INSERT INTO `localidades` VALUES (115, 'LA MARAVILLA', 12, '5367');
INSERT INTO `localidades` VALUES (116, 'EL CARDON', 12, '5367');
INSERT INTO `localidades` VALUES (117, 'EL CHUSCHIN', 12, '5367');
INSERT INTO `localidades` VALUES (118, 'PIEDRA PINTADA', 12, '5367');
INSERT INTO `localidades` VALUES (119, 'LA BREA', 12, '5367');
INSERT INTO `localidades` VALUES (120, 'LA CIENAGA', 12, '5367');
INSERT INTO `localidades` VALUES (121, 'MINA DELINA', 12, '5367');
INSERT INTO `localidades` VALUES (122, 'SAN JOSE', 12, '5367');
INSERT INTO `localidades` VALUES (123, 'LOS TAMBILLOS', 12, '5367');
INSERT INTO `localidades` VALUES (124, 'EL MOLLE', 12, '5367');
INSERT INTO `localidades` VALUES (125, 'VILLA ESTHER', 12, '5367');
INSERT INTO `localidades` VALUES (126, 'LAS CUEVAS', 12, '5367');
INSERT INTO `localidades` VALUES (127, 'GUANDACOL', 12, '5367');
INSERT INTO `localidades` VALUES (128, 'SANTA CLARA', 12, '5367');
INSERT INTO `localidades` VALUES (129, 'LOS PATILLOS', 12, '5367');
INSERT INTO `localidades` VALUES (130, 'PASO SAN ISIDRO', 12, '5367');
INSERT INTO `localidades` VALUES (131, 'AICUÑA', 12, '5367');
INSERT INTO `localidades` VALUES (132, 'EL FUERTE', 12, '5367');
INSERT INTO `localidades` VALUES (133, 'EL ZAPALLAR', 12, '5367');
INSERT INTO `localidades` VALUES (134, 'LOS NACIMIENTOS', 12, '5367');
INSERT INTO `localidades` VALUES (135, 'LOS PALACIOS', 12, '5367');
INSERT INTO `localidades` VALUES (136, 'PUERTO ALEGRE', 12, '5367');
INSERT INTO `localidades` VALUES (137, 'PAGANCILLO', 12, '5367');
INSERT INTO `localidades` VALUES (138, 'BANDA FLORIDA', 12, '5367');
INSERT INTO `localidades` VALUES (139, 'ANGULOS', 5, '5367');
INSERT INTO `localidades` VALUES (140, 'SANTA CRUZ', 5, '5367');
INSERT INTO `localidades` VALUES (141, 'PLAZA VIEJA', 5, '5367');
INSERT INTO `localidades` VALUES (142, 'CAMPANAS', 5, '5367');
INSERT INTO `localidades` VALUES (143, 'SANTO DOMINGO', 5, '5367');
INSERT INTO `localidades` VALUES (144, 'FAMATINA', 5, '5367');
INSERT INTO `localidades` VALUES (145, 'BAJO CARRIZAL', 5, '5367');
INSERT INTO `localidades` VALUES (146, 'ALTO CARRIZAL', 5, '5367');
INSERT INTO `localidades` VALUES (147, 'EL POTRERILLO', 5, '5367');
INSERT INTO `localidades` VALUES (148, 'PITUIL', 5, '5367');
INSERT INTO `localidades` VALUES (149, 'LA CUADRA', 5, '5367');
INSERT INTO `localidades` VALUES (150, 'ANTINACO', 5, '5367');
INSERT INTO `localidades` VALUES (151, 'EL JUMEAL', 5, '5367');
INSERT INTO `localidades` VALUES (152, 'BARRIO DE GALLI', 5, '5367');
INSERT INTO `localidades` VALUES (153, 'CHAÑARMUYO', 5, '5367');
INSERT INTO `localidades` VALUES (154, 'LAS LOMITAS', 17, '5367');
INSERT INTO `localidades` VALUES (155, 'PUNTA DE LOS LLANOS', 17, '5367');
INSERT INTO `localidades` VALUES (156, 'LAS AGUADITAS', 17, '5367');
INSERT INTO `localidades` VALUES (157, 'LA REPRESITA', 17, '5367');
INSERT INTO `localidades` VALUES (158, 'AGUADITA DE LOS VALDECES', 17, '5367');
INSERT INTO `localidades` VALUES (159, 'ALCAZAR', 17, '5367');
INSERT INTO `localidades` VALUES (160, 'TAMA', 17, '5367');
INSERT INTO `localidades` VALUES (161, 'BAJO VERDE', 17, '5367');
INSERT INTO `localidades` VALUES (162, 'TASQUIN', 17, '5367');
INSERT INTO `localidades` VALUES (163, 'SAN NICOLAS', 17, '5367');
INSERT INTO `localidades` VALUES (164, 'CHILA', 17, '5367');
INSERT INTO `localidades` VALUES (165, 'COLOZOCAN', 17, '5367');
INSERT INTO `localidades` VALUES (166, 'EL MONTE', 17, '5367');
INSERT INTO `localidades` VALUES (167, 'TUIZON', 17, '5367');
INSERT INTO `localidades` VALUES (168, 'SANTA TERESA', 17, '5367');
INSERT INTO `localidades` VALUES (169, 'PACATALA', 17, '5367');
INSERT INTO `localidades` VALUES (170, 'LA HUERTA', 11, '5367');
INSERT INTO `localidades` VALUES (171, 'SANTA CRUZ', 11, '5367');
INSERT INTO `localidades` VALUES (172, 'EL VIRQUE', 11, '5367');
INSERT INTO `localidades` VALUES (173, 'CORTADERAS', 11, '5367');
INSERT INTO `localidades` VALUES (174, 'EL SIMBOLAR', 11, '5367');
INSERT INTO `localidades` VALUES (175, 'CASTRO BARROS', 11, '5367');
INSERT INTO `localidades` VALUES (176, 'EL BORDO', 11, '5367');
INSERT INTO `localidades` VALUES (177, 'BAJO HONDO', 11, '5367');
INSERT INTO `localidades` VALUES (178, 'LA AGUADA', 11, '5367');
INSERT INTO `localidades` VALUES (179, 'MONTE GRANDE', 11, '5367');
INSERT INTO `localidades` VALUES (180, 'MONTE NEGRO', 11, '5367');
INSERT INTO `localidades` VALUES (181, 'SAN ISIDRO', 11, '5367');
INSERT INTO `localidades` VALUES (182, 'EL CONSUELO', 11, '5367');
INSERT INTO `localidades` VALUES (183, 'TALA VERDE', 11, '5367');
INSERT INTO `localidades` VALUES (184, 'NEPES', 11, '5367');
INSERT INTO `localidades` VALUES (185, 'COLONIA EL CISCO', 11, '5367');
INSERT INTO `localidades` VALUES (186, 'TALVA', 11, '5367');
INSERT INTO `localidades` VALUES (187, 'LOMA BLANCA', 11, '5367');
INSERT INTO `localidades` VALUES (188, 'AGUA COLORADA', 11, '5367');
INSERT INTO `localidades` VALUES (189, 'OLTA', 11, '5367');
INSERT INTO `localidades` VALUES (190, 'ESQUINA DEL SUD', 11, '5367');
INSERT INTO `localidades` VALUES (191, 'S.DE LAS HIGUERAS', 11, '5367');
INSERT INTO `localidades` VALUES (192, 'CHAÑAR', 11, '5367');
INSERT INTO `localidades` VALUES (193, 'MIRAFLORES', 11, '5367');
INSERT INTO `localidades` VALUES (194, 'LOMA ALTA', 11, '5367');
INSERT INTO `localidades` VALUES (195, 'CORRAL DEL NEGRO', 11, '5367');
INSERT INTO `localidades` VALUES (196, 'SIERRA DE LOS QUINTEROS', 11, '5367');
INSERT INTO `localidades` VALUES (197, 'LA FLORIDA', 11, '5367');
INSERT INTO `localidades` VALUES (198, 'SAN PEDRO', 11, '5367');
INSERT INTO `localidades` VALUES (199, 'SANTA MARIA', 15, '5367');
INSERT INTO `localidades` VALUES (200, 'EL PORONGO', 15, '5367');
INSERT INTO `localidades` VALUES (201, 'NACATE', 15, '5367');
INSERT INTO `localidades` VALUES (202, 'UNQUILLAL', 15, '5367');
INSERT INTO `localidades` VALUES (203, 'LA CHIMENEA', 15, '5367');
INSERT INTO `localidades` VALUES (204, 'EL RETAMAL', 15, '5367');
INSERT INTO `localidades` VALUES (205, 'CASANGATE', 15, '5367');
INSERT INTO `localidades` VALUES (206, 'LOMA LARGA', 15, '5367');
INSERT INTO `localidades` VALUES (207, 'TOSQUEA', 15, '5367');
INSERT INTO `localidades` VALUES (208, 'PORTEZUELO', 15, '5367');
INSERT INTO `localidades` VALUES (209, 'SAN RAMON', 15, '5367');
INSERT INTO `localidades` VALUES (210, 'SOLCA', 15, '5367');
INSERT INTO `localidades` VALUES (211, 'SAN ANTONIO', 15, '5367');
INSERT INTO `localidades` VALUES (212, 'EL CHORRO', 15, '5367');
INSERT INTO `localidades` VALUES (213, 'QUEBRADA DEL VALLECITO', 15, '5367');
INSERT INTO `localidades` VALUES (214, 'LOS BARREALES', 15, '5367');
INSERT INTO `localidades` VALUES (215, 'SALANA', 15, '5367');
INSERT INTO `localidades` VALUES (216, 'LOS ALGARROBOS', 15, '5367');
INSERT INTO `localidades` VALUES (217, 'LAS BARRANCAS', 15, '5367');
INSERT INTO `localidades` VALUES (218, 'PULUCHAN', 15, '5367');
INSERT INTO `localidades` VALUES (219, 'MALANZAN', 15, '5367');
INSERT INTO `localidades` VALUES (220, 'TUANI', 15, '5367');
INSERT INTO `localidades` VALUES (221, 'SAN RAMON', 15, '5367');
INSERT INTO `localidades` VALUES (222, 'TRES CRUCES', 15, '5367');
INSERT INTO `localidades` VALUES (223, 'BALDE DE AMAYA', 15, '5367');
INSERT INTO `localidades` VALUES (224, 'SAN PEDRO', 15, '5367');
INSERT INTO `localidades` VALUES (225, 'ATILES', 15, '5367');
INSERT INTO `localidades` VALUES (226, 'SAN ROQUE', 15, '5367');
INSERT INTO `localidades` VALUES (227, 'EL POTRERO', 15, '5367');
INSERT INTO `localidades` VALUES (228, 'VILLA CASTELLI', 13, '5367');
INSERT INTO `localidades` VALUES (229, 'RIVADAVIA', 13, '5367');
INSERT INTO `localidades` VALUES (230, 'EL CONDADO', 13, '5367');
INSERT INTO `localidades` VALUES (231, 'PARECITAS', 13, '5367');
INSERT INTO `localidades` VALUES (232, 'LOS AGUIRRES', 9, '5367');
INSERT INTO `localidades` VALUES (233, 'POZO DEL MEDIO', 9, '5367');
INSERT INTO `localidades` VALUES (234, 'LA COLONIA', 9, '5367');
INSERT INTO `localidades` VALUES (235, 'MOLLACO', 9, '5367');
INSERT INTO `localidades` VALUES (236, 'MILAGRO', 9, '5367');
INSERT INTO `localidades` VALUES (237, 'EL QUEMADO', 9, '5367');
INSERT INTO `localidades` VALUES (238, 'MOLLACO', 9, '5367');
INSERT INTO `localidades` VALUES (239, 'SAN RAMON', 9, '5367');
INSERT INTO `localidades` VALUES (240, 'LAS CORTADERAS', 9, '5367');
INSERT INTO `localidades` VALUES (241, 'SAN JOSE', 9, '5367');
INSERT INTO `localidades` VALUES (242, 'SAN ROQUE', 9, '5367');
INSERT INTO `localidades` VALUES (243, 'LA MARAVILLA', 9, '5367');
INSERT INTO `localidades` VALUES (244, 'AGUADITA DE LOS PERALTA', 9, '5367');
INSERT INTO `localidades` VALUES (245, 'LA REPRESA', 9, '5367');
INSERT INTO `localidades` VALUES (246, 'OLPAS', 9, '5367');
INSERT INTO `localidades` VALUES (247, 'RIO GRANDE', 9, '5367');
INSERT INTO `localidades` VALUES (248, 'SAN CRISTOBAL', 9, '5367');
INSERT INTO `localidades` VALUES (249, 'LA BARRERA', 9, '5367');
INSERT INTO `localidades` VALUES (250, 'AGUA COLORADA', 9, '5367');
INSERT INTO `localidades` VALUES (251, 'EL CERCO', 9, '5367');
INSERT INTO `localidades` VALUES (252, 'LA BANDERITA', 9, '5367');
INSERT INTO `localidades` VALUES (253, 'LA DORADA', 9, '5367');
INSERT INTO `localidades` VALUES (254, 'SANTA RITA DE CATUNA', 9, '5367');
INSERT INTO `localidades` VALUES (255, 'LA RIPIEDRA', 9, '5367');
INSERT INTO `localidades` VALUES (256, 'LA MARUJA', 9, '5367');
INSERT INTO `localidades` VALUES (257, 'EL FRAILE', 9, '5367');
INSERT INTO `localidades` VALUES (258, 'LOS TELLOS', 9, '5367');
INSERT INTO `localidades` VALUES (259, 'AMBIL', 9, '5367');
INSERT INTO `localidades` VALUES (260, 'COLONIA ORTIZ DE OCAMPO', 9, '5367');
INSERT INTO `localidades` VALUES (261, 'EL BARRANCO', 9, '5367');
INSERT INTO `localidades` VALUES (262, 'LOS BARRIALITOS', 9, '5367');
INSERT INTO `localidades` VALUES (263, 'TORRECITAS', 9, '5367');
INSERT INTO `localidades` VALUES (264, 'LA ISLA', 9, '5367');
INSERT INTO `localidades` VALUES (265, 'LA PLAYA', 9, '5367');
INSERT INTO `localidades` VALUES (266, 'LOS MISTOLES', 9, '5367');
INSERT INTO `localidades` VALUES (267, 'ESQUINA GRANDE', 9, '5367');
INSERT INTO `localidades` VALUES (268, 'BALDE SALADO', 9, '5367');
INSERT INTO `localidades` VALUES (269, 'LA AGUADITA', 9, '5367');
INSERT INTO `localidades` VALUES (270, 'SAN PEDRO', 9, '5367');
INSERT INTO `localidades` VALUES (271, 'LA SUSPENSION', 8, '5367');
INSERT INTO `localidades` VALUES (272, 'TRES DE MAYO', 8, '5367');
INSERT INTO `localidades` VALUES (273, 'LA PORFIA', 8, '5367');
INSERT INTO `localidades` VALUES (274, 'ISLA DEL TIGRE', 8, '5367');
INSERT INTO `localidades` VALUES (275, 'SIEMPRE VERDE', 8, '5367');
INSERT INTO `localidades` VALUES (276, 'EL BALDE DE LA VIUDA', 8, '5367');
INSERT INTO `localidades` VALUES (277, 'LA LOMITA', 8, '5367');
INSERT INTO `localidades` VALUES (278, 'LAS MALVINAS', 8, '5367');
INSERT INTO `localidades` VALUES (279, 'VILLA NIDIA', 8, '5367');
INSERT INTO `localidades` VALUES (280, 'SAN LORENZO', 8, '5367');
INSERT INTO `localidades` VALUES (281, 'EL ABRA', 8, '5367');
INSERT INTO `localidades` VALUES (282, 'EL CADILLO', 8, '5367');
INSERT INTO `localidades` VALUES (283, 'KILOMETRO 14', 8, '5367');
INSERT INTO `localidades` VALUES (284, 'VILLA LUISA', 8, '5367');
INSERT INTO `localidades` VALUES (285, 'LA INDUSTRIA', 8, '5367');
INSERT INTO `localidades` VALUES (286, 'LA ISLA', 8, '5367');
INSERT INTO `localidades` VALUES (287, 'BAJO HONDO', 8, '5367');
INSERT INTO `localidades` VALUES (288, 'EL MOSQUITO', 8, '5367');
INSERT INTO `localidades` VALUES (289, 'EL CALDEN', 8, '5367');
INSERT INTO `localidades` VALUES (290, 'LA CHILCA', 8, '5367');
INSERT INTO `localidades` VALUES (291, 'PUESTO LOS CORNEJOS', 8, '5367');
INSERT INTO `localidades` VALUES (292, 'LA REPRESA', 8, '5367');
INSERT INTO `localidades` VALUES (293, 'LA REPRESITA', 8, '5367');
INSERT INTO `localidades` VALUES (294, 'LAS VENTANITAS', 8, '5367');
INSERT INTO `localidades` VALUES (295, 'ULAPES', 8, '5367');
INSERT INTO `localidades` VALUES (296, 'AGUAYO', 8, '5367');
INSERT INTO `localidades` VALUES (297, 'EL MEDANITO', 8, '5367');
INSERT INTO `localidades` VALUES (298, 'SAN RAFAEL', 8, '5367');
INSERT INTO `localidades` VALUES (299, 'ALGARROBO GRANDE', 8, '5367');
INSERT INTO `localidades` VALUES (300, 'CORRAL DE ISAAC', 8, '5367');
INSERT INTO `localidades` VALUES (301, 'CUATRO ESQUINAS', 8, '5367');
INSERT INTO `localidades` VALUES (302, 'LA RESERVA', 8, '5367');
INSERT INTO `localidades` VALUES (303, 'PUESTO DICHOSO', 8, '5367');
INSERT INTO `localidades` VALUES (304, 'ENTRE RIOS', 8, '5367');
INSERT INTO `localidades` VALUES (305, 'SANTA ELENA', 8, '5367');
INSERT INTO `localidades` VALUES (306, 'LA LILIA', 8, '5367');
INSERT INTO `localidades` VALUES (307, 'EL BUEN RETIRO', 8, '5367');
INSERT INTO `localidades` VALUES (308, 'SAN SOLANO', 8, '5367');
INSERT INTO `localidades` VALUES (309, 'VIRGEN DEL VALLE', 8, '5367');
INSERT INTO `localidades` VALUES (310, 'NUEVA ESPERANZA', 8, '5367');
INSERT INTO `localidades` VALUES (311, 'PATQUIA VIEJO', 10, '5367');
INSERT INTO `localidades` VALUES (312, 'LA MESADA', 10, '5367');
INSERT INTO `localidades` VALUES (313, 'AMANA', 10, '5367');
INSERT INTO `localidades` VALUES (314, 'LA TORRE', 10, '5367');
INSERT INTO `localidades` VALUES (315, 'PATQUIA', 10, '5367');
INSERT INTO `localidades` VALUES (316, 'LOS COLORADOS', 10, '5367');
INSERT INTO `localidades` VALUES (317, 'PAGANZO', 10, '5367');
INSERT INTO `localidades` VALUES (318, 'AGUANGO', 10, '5367');
INSERT INTO `localidades` VALUES (319, 'REPRESA DE LA PUNTA', 10, '5367');
INSERT INTO `localidades` VALUES (320, 'LOS BALDECITOS', 10, '5367');
INSERT INTO `localidades` VALUES (321, 'BALDE SAN ISIDRO', 10, '5367');
INSERT INTO `localidades` VALUES (322, 'EL CHIFLON', 10, '5367');
INSERT INTO `localidades` VALUES (323, 'MASCASIN', 18, '5367');
INSERT INTO `localidades` VALUES (324, 'LA JARILLA', 18, '5367');
INSERT INTO `localidades` VALUES (325, 'LA LAGUNA', 18, '5367');
INSERT INTO `localidades` VALUES (326, 'LA AGUADA', 18, '5367');
INSERT INTO `localidades` VALUES (327, 'EL TOTORAL', 18, '5367');
INSERT INTO `localidades` VALUES (328, 'EL TALA', 18, '5367');
INSERT INTO `localidades` VALUES (329, 'ABRA VERDE', 18, '5367');
INSERT INTO `localidades` VALUES (330, 'MASCASIN', 18, '5367');
INSERT INTO `localidades` VALUES (331, 'EL RODEO', 18, '5367');
INSERT INTO `localidades` VALUES (332, 'CASAS VIEJAS', 18, '5367');
INSERT INTO `localidades` VALUES (333, 'EL POTRERILLO', 18, '5367');
INSERT INTO `localidades` VALUES (334, 'EL DIVISADERO', 18, '5367');
INSERT INTO `localidades` VALUES (335, 'LAS TOSCAS', 18, '5367');
INSERT INTO `localidades` VALUES (336, 'VALLE HERMOSO', 18, '5367');
INSERT INTO `localidades` VALUES (337, 'SANTA CRUZ', 18, '5367');
INSERT INTO `localidades` VALUES (338, 'EL ROSARIO', 18, '5367');
INSERT INTO `localidades` VALUES (339, 'VILLA CASANA', 18, '5367');
INSERT INTO `localidades` VALUES (340, 'REAL DEL CADILLO', 18, '5367');
INSERT INTO `localidades` VALUES (341, 'LOS LAGARCITOS', 18, '5367');
INSERT INTO `localidades` VALUES (342, 'LA CALERA', 18, '5367');
INSERT INTO `localidades` VALUES (343, 'RODEO GRANDE', 18, '5367');
INSERT INTO `localidades` VALUES (344, 'LA CONSULTA', 18, '5367');
INSERT INTO `localidades` VALUES (345, 'SANTA RITA', 18, '5367');
INSERT INTO `localidades` VALUES (346, 'EL BARRIAL', 18, '5367');
INSERT INTO `localidades` VALUES (347, 'CHELCOS', 18, '5367');
INSERT INTO `localidades` VALUES (348, 'AGUA DE AGUIRRE', 18, '5367');
INSERT INTO `localidades` VALUES (349, 'SAN ISIDRO', 18, '5367');
INSERT INTO `localidades` VALUES (350, 'LA CALLANA', 18, '5367');
INSERT INTO `localidades` VALUES (351, 'LOS OROS', 18, '5367');
INSERT INTO `localidades` VALUES (352, 'AGUA BLANCA', 18, '5367');
INSERT INTO `localidades` VALUES (353, 'EL CARDON', 18, '5367');
INSERT INTO `localidades` VALUES (354, 'SAN JOSE', 18, '5367');
INSERT INTO `localidades` VALUES (355, 'CHEPES', 18, '5367');
INSERT INTO `localidades` VALUES (356, 'SAN PEDRO', 18, '5367');
INSERT INTO `localidades` VALUES (357, 'ALTO BAYO', 18, '5367');
INSERT INTO `localidades` VALUES (358, 'AGUA DE LA PIEDRA', 18, '5367');
INSERT INTO `localidades` VALUES (359, 'DESIDERIO TELLO (ZONA VII-SUPERIOR)', 18, '5367');
INSERT INTO `localidades` VALUES (360, 'SAN ANTONIO', 18, '5367');
INSERT INTO `localidades` VALUES (361, 'EL ZAMPAL', 18, '5367');
INSERT INTO `localidades` VALUES (362, 'LOS ROBLES', 14, '5367');
INSERT INTO `localidades` VALUES (363, 'ANDOLUCAS', 14, '5367');
INSERT INTO `localidades` VALUES (364, 'SHAQUI', 14, '5367');
INSERT INTO `localidades` VALUES (365, 'LAS TALAS', 14, '5367');
INSERT INTO `localidades` VALUES (366, 'ALPASINCHE', 14, '5367');
INSERT INTO `localidades` VALUES (367, 'CUIPAN', 14, '5367');
INSERT INTO `localidades` VALUES (368, 'TUYUBIL', 14, '5367');
INSERT INTO `localidades` VALUES (369, 'EL RETIRO', 14, '5367');
INSERT INTO `localidades` VALUES (370, 'CHAUPIHUASI', 14, '5367');
INSERT INTO `localidades` VALUES (371, 'SALICAS', 14, '5367');
INSERT INTO `localidades` VALUES (372, 'SAN BLAS', 14, '5367');
INSERT INTO `localidades` VALUES (373, 'AMUSCHINA', 14, '5367');
INSERT INTO `localidades` VALUES (374, 'SURIYACO', 14, '5367');
INSERT INTO `localidades` VALUES (375, 'LA ESCALERA', 3, '5367');
INSERT INTO `localidades` VALUES (376, 'LA TORRECITA', 3, '5367');
INSERT INTO `localidades` VALUES (377, 'HUACO', 3, '5367');
INSERT INTO `localidades` VALUES (378, 'VILLA SANAGASTA', 3, '5367');
INSERT INTO `localidades` VALUES (379, 'LA CIENAGA', 16, '5367');
INSERT INTO `localidades` VALUES (380, 'BOCA DE LA QUEBRADA', 16, '5367');
INSERT INTO `localidades` VALUES (381, 'VALLE HERMOSO', 16, '5367');
INSERT INTO `localidades` VALUES (382, 'EL HORNO', 16, '5367');
INSERT INTO `localidades` VALUES (383, 'POTRERO GRANDE', 16, '5367');
INSERT INTO `localidades` VALUES (384, 'LA ARMONIA', 16, '5367');
INSERT INTO `localidades` VALUES (385, 'CASA PINTADA', 16, '5367');
INSERT INTO `localidades` VALUES (386, 'DISTRITO PUEBLO', 16, '5367');
INSERT INTO `localidades` VALUES (387, 'LA BANDA', 16, '5367');
INSERT INTO `localidades` VALUES (388, 'VILLA SAN JOSE DE VINCHINA', 16, '5367');
INSERT INTO `localidades` VALUES (389, 'JAGUE', 16, '5367');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of modalidad_pagos
-- ----------------------------
INSERT INTO `modalidad_pagos` VALUES (1, 'Contado', 0, 1, '2024-09-01 04:29:16', '2024-09-01 04:29:16');
INSERT INTO `modalidad_pagos` VALUES (2, 'MercadoPago', 10, 1, '2024-09-01 04:29:16', '2024-09-01 04:29:16');

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_uca1400_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ordenes
-- ----------------------------
INSERT INTO `ordenes` VALUES (1, 1, 59000.00, 1, 1, '2024-09-01 04:29:31', '2024-09-01 04:29:31');
INSERT INTO `ordenes` VALUES (2, 2, 25000.00, 2, 2, '2024-09-01 04:29:31', '2024-09-01 04:29:31');

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
INSERT INTO `paises` VALUES (1, 'Afganistán', 'AFGANA', 'AFG');
INSERT INTO `paises` VALUES (2, 'Albania', 'ALBANESA', 'ALB');
INSERT INTO `paises` VALUES (3, 'Alemania', 'ALEMANA', 'DEU');
INSERT INTO `paises` VALUES (4, 'Andorra', 'ANDORRANA', 'AND');
INSERT INTO `paises` VALUES (5, 'Angola', 'ANGOLEÑA', 'AGO');
INSERT INTO `paises` VALUES (6, 'AntiguayBarbuda', 'ANTIGUANA', 'ATG');
INSERT INTO `paises` VALUES (7, 'ArabiaSaudita', 'SAUDÍ', 'SAU');
INSERT INTO `paises` VALUES (8, 'Argelia', 'ARGELINA', 'DZA');
INSERT INTO `paises` VALUES (9, 'Argentina', 'ARGENTINA', 'ARG');
INSERT INTO `paises` VALUES (10, 'Armenia', 'ARMENIA', 'ARM');
INSERT INTO `paises` VALUES (11, 'Aruba', 'ARUBEÑA', 'ABW');
INSERT INTO `paises` VALUES (12, 'Australia', 'AUSTRALIANA', 'AUS');
INSERT INTO `paises` VALUES (13, 'Austria', 'AUSTRIACA', 'AUT');
INSERT INTO `paises` VALUES (14, 'Azerbaiyán', 'AZERBAIYANA', 'AZE');
INSERT INTO `paises` VALUES (15, 'Bahamas', 'BAHAMEÑA', 'BHS');
INSERT INTO `paises` VALUES (16, 'Bangladés', 'BANGLADESÍ', 'BGD');
INSERT INTO `paises` VALUES (17, 'Barbados', 'BARBADENSE', 'BRB');
INSERT INTO `paises` VALUES (18, 'Baréin', 'BAREINÍ', 'BHR');
INSERT INTO `paises` VALUES (19, 'Bélgica', 'BELGA', 'BEL');
INSERT INTO `paises` VALUES (20, 'Belice', 'BELICEÑA', 'BLZ');
INSERT INTO `paises` VALUES (21, 'Benín', 'BENINÉSA', 'BEN');
INSERT INTO `paises` VALUES (22, 'Bielorrusia', 'BIELORRUSA', 'BLR');
INSERT INTO `paises` VALUES (23, 'Birmania', 'BIRMANA', 'MMR');
INSERT INTO `paises` VALUES (24, 'Bolivia', 'BOLIVIANA', 'BOL');
INSERT INTO `paises` VALUES (25, 'BosniayHerzegovina', 'BOSNIA', 'BIH');
INSERT INTO `paises` VALUES (26, 'Botsuana', 'BOTSUANA', 'BWA');
INSERT INTO `paises` VALUES (27, 'Brasil', 'BRASILEÑA', 'BRA');
INSERT INTO `paises` VALUES (28, 'Brunéi', 'BRUNEANA', 'BRN');
INSERT INTO `paises` VALUES (29, 'Bulgaria', 'BÚLGARA', 'BGR');
INSERT INTO `paises` VALUES (30, 'BurkinaFaso', 'BURKINÉS', 'BFA');
INSERT INTO `paises` VALUES (31, 'Burundi', 'BURUNDÉSA', 'BDI');
INSERT INTO `paises` VALUES (32, 'Bután', 'BUTANÉSA', 'BTN');
INSERT INTO `paises` VALUES (33, 'CaboVerde', 'CABOVERDIANA', 'CPV');
INSERT INTO `paises` VALUES (34, 'Camboya', 'CAMBOYANA', 'KHM');
INSERT INTO `paises` VALUES (35, 'Camerún', 'CAMERUNESA', 'CMR');
INSERT INTO `paises` VALUES (36, 'Canadá', 'CANADIENSE', 'CAN');
INSERT INTO `paises` VALUES (37, 'Catar', 'CATARÍ', 'QAT');
INSERT INTO `paises` VALUES (38, 'Chad', 'CHADIANA', 'TCD');
INSERT INTO `paises` VALUES (39, 'Chile', 'CHILENA', 'CHL');
INSERT INTO `paises` VALUES (40, 'China', 'CHINA', 'CHN');
INSERT INTO `paises` VALUES (41, 'Chipre', 'CHIPRIOTA', 'CYP');
INSERT INTO `paises` VALUES (42, 'CiudaddelVaticano', 'VATICANA', 'VAT');
INSERT INTO `paises` VALUES (43, 'Colombia', 'COLOMBIANA', 'COL');
INSERT INTO `paises` VALUES (44, 'Comoras', 'COMORENSE', 'COM');
INSERT INTO `paises` VALUES (45, 'CoreadelNorte', 'NORCOREANA', 'PRK');
INSERT INTO `paises` VALUES (46, 'CoreadelSur', 'SURCOREANA', 'KOR');
INSERT INTO `paises` VALUES (47, 'CostadeMarfil', 'MARFILEÑA', 'CIV');
INSERT INTO `paises` VALUES (48, 'CostaRica', 'COSTARRICENSE', 'CRI');
INSERT INTO `paises` VALUES (49, 'Croacia', 'CROATA', 'HRV');
INSERT INTO `paises` VALUES (50, 'Cuba', 'CUBANA', 'CUB');
INSERT INTO `paises` VALUES (51, 'Dinamarca', 'DANÉSA', 'DNK');
INSERT INTO `paises` VALUES (52, 'Dominica', 'DOMINIQUÉS', 'DMA');
INSERT INTO `paises` VALUES (53, 'Ecuador', 'ECUATORIANA', 'ECU');
INSERT INTO `paises` VALUES (54, 'Egipto', 'EGIPCIA', 'EGY');
INSERT INTO `paises` VALUES (55, 'ElSalvador', 'SALVADOREÑA', 'SLV');
INSERT INTO `paises` VALUES (56, 'EmiratosÁrabesUnidos', 'EMIRATÍ', 'ARE');
INSERT INTO `paises` VALUES (57, 'Eritrea', 'ERITREA', 'ERI');
INSERT INTO `paises` VALUES (58, 'Eslovaquia', 'ESLOVACA', 'SVK');
INSERT INTO `paises` VALUES (59, 'Eslovenia', 'ESLOVENA', 'SVN');
INSERT INTO `paises` VALUES (60, 'España', 'ESPAÑOLA', 'ESP');
INSERT INTO `paises` VALUES (61, 'EstadosUnidos', 'ESTADOUNIDENSE', 'USA');
INSERT INTO `paises` VALUES (62, 'Estonia', 'ESTONIA', 'EST');
INSERT INTO `paises` VALUES (63, 'Etiopía', 'ETÍOPE', 'ETH');
INSERT INTO `paises` VALUES (64, 'Filipinas', 'FILIPINA', 'PHL');
INSERT INTO `paises` VALUES (65, 'Finlandia', 'FINLANDÉSA', 'FIN');
INSERT INTO `paises` VALUES (66, 'Fiyi', 'FIYIANA', 'FJI');
INSERT INTO `paises` VALUES (67, 'Francia', 'FRANCÉSA', 'FRA');
INSERT INTO `paises` VALUES (68, 'Gabón', 'GABONÉSA', 'GAB');
INSERT INTO `paises` VALUES (69, 'Gambia', 'GAMBIANA', 'GMB');
INSERT INTO `paises` VALUES (70, 'Georgia', 'GEORGIANA', 'GEO');
INSERT INTO `paises` VALUES (71, 'Gibraltar', 'GIBRALTAREÑA', 'GIB');
INSERT INTO `paises` VALUES (72, 'Ghana', 'GHANÉSA', 'GHA');
INSERT INTO `paises` VALUES (73, 'Granada', 'GRANADINA', 'GRD');
INSERT INTO `paises` VALUES (74, 'Grecia', 'GRIEGA', 'GRC');
INSERT INTO `paises` VALUES (75, 'Groenlandia', 'GROENLANDÉSA', 'GRL');
INSERT INTO `paises` VALUES (76, 'Guatemala', 'GUATEMALTECA', 'GTM');
INSERT INTO `paises` VALUES (77, 'Guineaecuatorial', 'ECUATOGUINEANA', 'GNQ');
INSERT INTO `paises` VALUES (78, 'Guinea', 'GUINEANA', 'GIN');
INSERT INTO `paises` VALUES (79, 'Guinea-Bisáu', 'GUINEANA', 'GNB');
INSERT INTO `paises` VALUES (80, 'Guyana', 'GUYANESA', 'GUY');
INSERT INTO `paises` VALUES (81, 'Haití', 'HAITIANA', 'HTI');
INSERT INTO `paises` VALUES (82, 'Honduras', 'HONDUREÑA', 'HND');
INSERT INTO `paises` VALUES (83, 'Hungría', 'HÚNGARA', 'HUN');
INSERT INTO `paises` VALUES (84, 'India', 'HINDÚ', 'IND');
INSERT INTO `paises` VALUES (85, 'Indonesia', 'INDONESIA', 'IDN');
INSERT INTO `paises` VALUES (86, 'Irak', 'IRAQUÍ', 'IRQ');
INSERT INTO `paises` VALUES (87, 'Irán', 'IRANÍ', 'IRN');
INSERT INTO `paises` VALUES (88, 'Irlanda', 'IRLANDÉSA', 'IRL');
INSERT INTO `paises` VALUES (89, 'Islandia', 'ISLANDÉSA', 'ISL');
INSERT INTO `paises` VALUES (90, 'IslasCook', 'COOKIANA', 'COK');
INSERT INTO `paises` VALUES (91, 'IslasMarshall', 'MARSHALÉSA', 'MHL');
INSERT INTO `paises` VALUES (92, 'IslasSalomón', 'SALOMONENSE', 'SLB');
INSERT INTO `paises` VALUES (93, 'Israel', 'ISRAELÍ', 'ISR');
INSERT INTO `paises` VALUES (94, 'Italia', 'ITALIANA', 'ITA');
INSERT INTO `paises` VALUES (95, 'Jamaica', 'JAMAIQUINA', 'JAM');
INSERT INTO `paises` VALUES (96, 'Japón', 'JAPONÉSA', 'JPN');
INSERT INTO `paises` VALUES (97, 'Jordania', 'JORDANA', 'JOR');
INSERT INTO `paises` VALUES (98, 'Kazajistán', 'KAZAJA', 'KAZ');
INSERT INTO `paises` VALUES (99, 'Kenia', 'KENIATA', 'KEN');
INSERT INTO `paises` VALUES (100, 'Kirguistán', 'KIRGUISA', 'KGZ');
INSERT INTO `paises` VALUES (101, 'Kiribati', 'KIRIBATIANA', 'KIR');
INSERT INTO `paises` VALUES (102, 'Kuwait', 'KUWAITÍ', 'KWT');
INSERT INTO `paises` VALUES (103, 'Laos', 'LAOSIANA', 'LAO');
INSERT INTO `paises` VALUES (104, 'Lesoto', 'LESOTENSE', 'LSO');
INSERT INTO `paises` VALUES (105, 'Letonia', 'LETÓNA', 'LVA');
INSERT INTO `paises` VALUES (106, 'Líbano', 'LIBANÉSA', 'LBN');
INSERT INTO `paises` VALUES (107, 'Liberia', 'LIBERIANA', 'LBR');
INSERT INTO `paises` VALUES (108, 'Libia', 'LIBIA', 'LBY');
INSERT INTO `paises` VALUES (109, 'Liechtenstein', 'LIECHTENSTEINIANA', 'LIE');
INSERT INTO `paises` VALUES (110, 'Lituania', 'LITUANA', 'LTU');
INSERT INTO `paises` VALUES (111, 'Luxemburgo', 'LUXEMBURGUÉSA', 'LUX');
INSERT INTO `paises` VALUES (112, 'Madagascar', 'MALGACHE', 'MDG');
INSERT INTO `paises` VALUES (113, 'Malasia', 'MALASIA', 'MYS');
INSERT INTO `paises` VALUES (114, 'Malaui', 'MALAUÍ', 'MWI');
INSERT INTO `paises` VALUES (115, 'Maldivas', 'MALDIVA', 'MDV');
INSERT INTO `paises` VALUES (116, 'Malí', 'MALIENSE', 'MLI');
INSERT INTO `paises` VALUES (117, 'Malta', 'MALTÉSA', 'MLT');
INSERT INTO `paises` VALUES (118, 'Marruecos', 'MARROQUÍ', 'MAR');
INSERT INTO `paises` VALUES (119, 'Martinica', 'MARTINIQUÉS', 'MTQ');
INSERT INTO `paises` VALUES (120, 'Mauricio', 'MAURICIANA', 'MUS');
INSERT INTO `paises` VALUES (121, 'Mauritania', 'MAURITANA', 'MRT');
INSERT INTO `paises` VALUES (122, 'México', 'MEXICANA', 'MEX');
INSERT INTO `paises` VALUES (123, 'Micronesia', 'MICRONESIA', 'FSM');
INSERT INTO `paises` VALUES (124, 'Moldavia', 'MOLDAVA', 'MDA');
INSERT INTO `paises` VALUES (125, 'Mónaco', 'MONEGASCA', 'MCO');
INSERT INTO `paises` VALUES (126, 'Mongolia', 'MONGOLA', 'MNG');
INSERT INTO `paises` VALUES (127, 'Montenegro', 'MONTENEGRINA', 'MNE');
INSERT INTO `paises` VALUES (128, 'Mozambique', 'MOZAMBIQUEÑA', 'MOZ');
INSERT INTO `paises` VALUES (129, 'Namibia', 'NAMIBIA', 'NAM');
INSERT INTO `paises` VALUES (130, 'Nauru', 'NAURUANA', 'NRU');
INSERT INTO `paises` VALUES (131, 'Nepal', 'NEPALÍ', 'NPL');
INSERT INTO `paises` VALUES (132, 'Nicaragua', 'NICARAGÜENSE', 'NIC');
INSERT INTO `paises` VALUES (133, 'Níger', 'NIGERINA', 'NER');
INSERT INTO `paises` VALUES (134, 'Nigeria', 'NIGERIANA', 'NGA');
INSERT INTO `paises` VALUES (135, 'Noruega', 'NORUEGA', 'NOR');
INSERT INTO `paises` VALUES (136, 'NuevaZelanda', 'NEOZELANDÉSA', 'NZL');
INSERT INTO `paises` VALUES (137, 'Omán', 'OMANÍ', 'OMN');
INSERT INTO `paises` VALUES (138, 'PaísesBajos', 'NEERLANDÉSA', 'NLD');
INSERT INTO `paises` VALUES (139, 'Pakistán', 'PAKISTANÍ', 'PAK');
INSERT INTO `paises` VALUES (140, 'Palaos', 'PALAUANA', 'PLW');
INSERT INTO `paises` VALUES (141, 'Palestina', 'PALESTINA', 'PSE');
INSERT INTO `paises` VALUES (142, 'Panamá', 'PANAMEÑA', 'PAN');
INSERT INTO `paises` VALUES (143, 'PapúaNuevaGuinea', 'PAPÚ', 'PNG');
INSERT INTO `paises` VALUES (144, 'Paraguay', 'PARAGUAYA', 'PRY');
INSERT INTO `paises` VALUES (145, 'Perú', 'PERUANA', 'PER');
INSERT INTO `paises` VALUES (146, 'Polonia', 'POLACA', 'POL');
INSERT INTO `paises` VALUES (147, 'Portugal', 'PORTUGUÉSA', 'PRT');
INSERT INTO `paises` VALUES (148, 'PuertoRico', 'PUERTORRIQUEÑA', 'PRI');
INSERT INTO `paises` VALUES (149, 'ReinoUnido', 'BRITÁNICA', 'GBR');
INSERT INTO `paises` VALUES (150, 'RepúblicaCentroafricana', 'CENTROAFRICANA', 'CAF');
INSERT INTO `paises` VALUES (151, 'RepúblicaCheca', 'CHECA', 'CZE');
INSERT INTO `paises` VALUES (152, 'RepúblicadeMacedonia', 'MACEDONIA', 'MKD');
INSERT INTO `paises` VALUES (153, 'RepúblicadelCongo', 'CONGOLEÑA', 'COG');
INSERT INTO `paises` VALUES (154, 'RepúblicaDemocráticadelCongo', 'CONGOLEÑA', 'COD');
INSERT INTO `paises` VALUES (155, 'RepúblicaDominicana', 'DOMINICANA', 'DOM');
INSERT INTO `paises` VALUES (156, 'RepúblicaSudafricana', 'SUDAFRICANA', 'ZAF');
INSERT INTO `paises` VALUES (157, 'Ruanda', 'RUANDÉSA', 'RWA');
INSERT INTO `paises` VALUES (158, 'Rumanía', 'RUMANA', 'ROU');
INSERT INTO `paises` VALUES (159, 'Rusia', 'RUSA', 'RUS');
INSERT INTO `paises` VALUES (160, 'Samoa', 'SAMOANA', 'WSM');
INSERT INTO `paises` VALUES (161, 'SanCristóbalyNieves', 'CRISTOBALEÑA', 'KNA');
INSERT INTO `paises` VALUES (162, 'SanMarino', 'SANMARINENSE', 'SMR');
INSERT INTO `paises` VALUES (163, 'SanVicenteylasGranadinas', 'SANVICENTINA', 'VCT');
INSERT INTO `paises` VALUES (164, 'SantaLucía', 'SANTALUCENSE', 'LCA');
INSERT INTO `paises` VALUES (165, 'SantoToméyPríncipe', 'SANTOTOMENSE', 'STP');
INSERT INTO `paises` VALUES (166, 'Senegal', 'SENEGALÉSA', 'SEN');
INSERT INTO `paises` VALUES (167, 'Serbia', 'SERBIA', 'SRB');
INSERT INTO `paises` VALUES (168, 'Seychelles', 'SEYCHELLENSE', 'SYC');
INSERT INTO `paises` VALUES (169, 'SierraLeona', 'SIERRALEONÉSA', 'SLE');
INSERT INTO `paises` VALUES (170, 'Singapur', 'SINGAPURENSE', 'SGP');
INSERT INTO `paises` VALUES (171, 'Siria', 'SIRIA', 'SYR');
INSERT INTO `paises` VALUES (172, 'Somalia', 'SOMALÍ', 'SOM');
INSERT INTO `paises` VALUES (173, 'SriLanka', 'CEILANÉSA', 'LKA');
INSERT INTO `paises` VALUES (174, 'Suazilandia', 'SUAZI', 'SWZ');
INSERT INTO `paises` VALUES (175, 'SudándelSur', 'SURSUDANÉSA', 'SSD');
INSERT INTO `paises` VALUES (176, 'Sudán', 'SUDANÉSA', 'SDN');
INSERT INTO `paises` VALUES (177, 'Suecia', 'SUECA', 'SWE');
INSERT INTO `paises` VALUES (178, 'Suiza', 'SUIZA', 'CHE');
INSERT INTO `paises` VALUES (179, 'Surinam', 'SURINAMESA', 'SUR');
INSERT INTO `paises` VALUES (180, 'Tailandia', 'TAILANDÉSA', 'THA');
INSERT INTO `paises` VALUES (181, 'Tanzania', 'TANZANA', 'TZA');
INSERT INTO `paises` VALUES (182, 'Tayikistán', 'TAYIKA', 'TJK');
INSERT INTO `paises` VALUES (183, 'TimorOriental', 'TIMORENSE', 'TLS');
INSERT INTO `paises` VALUES (184, 'Togo', 'TOGOLÉSA', 'TGO');
INSERT INTO `paises` VALUES (185, 'Tonga', 'TONGANA', 'TON');
INSERT INTO `paises` VALUES (186, 'TrinidadyTobago', 'TRINITENSE', 'TTO');
INSERT INTO `paises` VALUES (187, 'Túnez', 'TUNECINA', 'TUN');
INSERT INTO `paises` VALUES (188, 'Turkmenistán', 'TURCOMANA', 'TKM');
INSERT INTO `paises` VALUES (189, 'Turquía', 'TURCA', 'TUR');
INSERT INTO `paises` VALUES (190, 'Tuvalu', 'TUVALUANA', 'TUV');
INSERT INTO `paises` VALUES (191, 'Ucrania', 'UCRANIANA', 'UKR');
INSERT INTO `paises` VALUES (192, 'Uganda', 'UGANDÉSA', 'UGA');
INSERT INTO `paises` VALUES (193, 'Uruguay', 'URUGUAYA', 'URY');
INSERT INTO `paises` VALUES (194, 'Uzbekistán', 'UZBEKA', 'UZB');
INSERT INTO `paises` VALUES (195, 'Vanuatu', 'VANUATUENSE', 'VUT');
INSERT INTO `paises` VALUES (196, 'Venezuela', 'VENEZOLANA', 'VEN');
INSERT INTO `paises` VALUES (197, 'Vietnam', 'VIETNAMITA', 'VNM');
INSERT INTO `paises` VALUES (198, 'Yemen', 'YEMENÍ', 'YEM');
INSERT INTO `paises` VALUES (199, 'Yibuti', 'YIBUTIANA', 'DJI');
INSERT INTO `paises` VALUES (200, 'Zambia', 'ZAMBIANA', 'ZMB');
INSERT INTO `paises` VALUES (201, 'Zimbabue', 'ZIMBABUENSE', 'ZWE');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of productos
-- ----------------------------
INSERT INTO `productos` VALUES (1, 'producto1.jpg', 'Televisor 50 pulgadas', 'Televisor LED 4K', 'TV50', 35000.00, 1, 34000.00, 36000.00, '2024-09-01 04:28:10', '2024-09-01 04:28:10');
INSERT INTO `productos` VALUES (2, 'producto2.jpg', 'Microondas', 'Microondas 30L con grill', 'MIC30', 12000.00, 2, 11500.00, 12500.00, '2024-09-01 04:28:10', '2024-09-01 04:28:10');
INSERT INTO `productos` VALUES (3, 'producto3.jpg', 'Bicicleta', 'Bicicleta de montaña', 'BICI20', 25000.00, 3, 24000.00, 26000.00, '2024-09-01 04:28:10', '2024-09-01 04:28:10');

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of productos_imagenes
-- ----------------------------
INSERT INTO `productos_imagenes` VALUES (1, 1, 1, '2024-09-01 04:28:41', '2024-09-01 04:28:41');
INSERT INTO `productos_imagenes` VALUES (2, 1, 2, '2024-09-01 04:28:41', '2024-09-01 04:28:41');
INSERT INTO `productos_imagenes` VALUES (3, 2, 3, '2024-09-01 04:28:41', '2024-09-01 04:28:41');
INSERT INTO `productos_imagenes` VALUES (4, 3, 4, '2024-09-01 04:28:41', '2024-09-01 04:28:41');

-- ----------------------------
-- Table structure for provincias
-- ----------------------------
DROP TABLE IF EXISTS `provincias`;
CREATE TABLE `provincias`  (
  `id_provincia` int NOT NULL AUTO_INCREMENT,
  `nombre_provincia` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_pais` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_provincia`) USING BTREE,
  INDEX `fk_provincias_paises1_idx`(`id_pais`) USING BTREE,
  CONSTRAINT `fk_provincias_paises1` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id_pais`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of provincias
-- ----------------------------
INSERT INTO `provincias` VALUES (1, 'Buenos Aires', 9);
INSERT INTO `provincias` VALUES (2, 'CCatamarca', 9);
INSERT INTO `provincias` VALUES (3, 'Chaco', 9);
INSERT INTO `provincias` VALUES (4, 'Chubut', 9);
INSERT INTO `provincias` VALUES (5, 'Córdoba', 9);
INSERT INTO `provincias` VALUES (6, 'Corrientes', 9);
INSERT INTO `provincias` VALUES (7, 'Entre Ríos', 9);
INSERT INTO `provincias` VALUES (8, 'Formosa', 9);
INSERT INTO `provincias` VALUES (9, 'Jujuy', 9);
INSERT INTO `provincias` VALUES (10, 'La Pampa', 9);
INSERT INTO `provincias` VALUES (11, 'La Rioja', 9);
INSERT INTO `provincias` VALUES (12, 'Mendoza', 9);
INSERT INTO `provincias` VALUES (13, 'Misiones', 9);
INSERT INTO `provincias` VALUES (14, 'Neuquén', 9);
INSERT INTO `provincias` VALUES (15, 'Río Negro', 9);
INSERT INTO `provincias` VALUES (16, 'Salta', 9);
INSERT INTO `provincias` VALUES (17, 'San Juan', 9);
INSERT INTO `provincias` VALUES (18, 'San Luis', 9);
INSERT INTO `provincias` VALUES (19, 'Santa Cruz', 9);
INSERT INTO `provincias` VALUES (20, 'Santa Fe', 9);
INSERT INTO `provincias` VALUES (21, 'Santiago del Estero', 9);
INSERT INTO `provincias` VALUES (22, 'Tierra del Fuego', 9);
INSERT INTO `provincias` VALUES (23, 'Tucumán', 9);

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'Admin', '2024-09-01 04:27:37', '2024-09-01 04:27:37');
INSERT INTO `roles` VALUES (2, 'Cliente', '2024-09-01 04:27:37', '2024-09-01 04:27:37');
INSERT INTO `roles` VALUES (3, 'Vendedor', '2024-09-01 04:27:37', '2024-09-01 04:27:37');

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
  INDEX `fk_usuarios_estados1_idx`(`id_estado`) USING BTREE,
  INDEX `fk_usuarios_localidades1_idx`(`id_localidad`) USING BTREE,
  CONSTRAINT `fk_usuarios_estados1` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_localidades1` FOREIGN KEY (`id_localidad`) REFERENCES `localidades` (`id_localidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_roles1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`idrole`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES (1, 1, 'Pérez', 'Juan', '12345678', '1122334455', 'juan.perez@example.com', 'avatar1.jpg', 'Palermo', 'Calle Falsa', 123, 1, '2024-09-01 04:27:37', '2024-09-01 04:27:37', 1);
INSERT INTO `usuarios` VALUES (2, 2, 'García', 'Ana', '23456789', '2233445566', 'ana.garcia@example.com', 'avatar2.jpg', 'Belgrano', 'Calle Real', 456, 2, '2024-09-01 04:27:37', '2024-09-01 04:27:37', 1);
INSERT INTO `usuarios` VALUES (3, 2, 'López', 'Carlos', '34567890', '3344556677', 'carlos.lopez@example.com', 'avatar3.jpg', 'Recoleta', 'Calle Verdadera', 789, 1, '2024-09-01 04:27:37', '2024-09-01 04:27:37', 2);

SET FOREIGN_KEY_CHECKS = 1;
