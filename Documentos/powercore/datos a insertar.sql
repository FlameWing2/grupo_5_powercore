INSERT INTO `powercore`.`roles` (`descripcion`, `created_at`, `updated_at`) VALUES
('Admin', NOW(), NOW()),
('Cliente', NOW(), NOW()),
('Vendedor', NOW(), NOW());

INSERT INTO `powercore`.`estados` (`nombre_estado`, `created_at`, `updated_at`) VALUES
('Activo', NOW(), NOW()),
('Inactivo', NOW(), NOW()),
('Pendiente', NOW(), NOW());

INSERT INTO `powercore`.`usuarios` (`id_rol`, `apellido`, `nombre`, `dni`, `telefono`, `email`, `avatar`, `barrio`, `calle`, `numero`, `id_localidad`, `created_at`, `updated_at`, `id_estado`) VALUES
(1, 'Pérez', 'Juan', '12345678', '1122334455', 'juan.perez@example.com', 'avatar1.jpg', 'Palermo', 'Calle Falsa', 123, 1, NOW(), NOW(), 1),
(2, 'García', 'Ana', '23456789', '2233445566', 'ana.garcia@example.com', 'avatar2.jpg', 'Belgrano', 'Calle Real', 456, 2, NOW(), NOW(), 1),
(2, 'López', 'Carlos', '34567890', '3344556677', 'carlos.lopez@example.com', 'avatar3.jpg', 'Recoleta', 'Calle Verdadera', 789, 1, NOW(), NOW(), 2);

INSERT INTO `powercore`.`categorias` (`descripcion`, `created_at`, `updated_at`) VALUES
('Electrónica', NOW(), NOW()),
('Hogar', NOW(), NOW()),
('Deportes', NOW(), NOW());

INSERT INTO `powercore`.`productos` (`id_producto`, `imagen_principal`, `nombre_producto`, `descripcion`, `codigo`, `precio`, `id_categoria`, `precio_contado`, `precio_mercadopago`, `created_at`, `updated_at`) VALUES
(1, 'producto1.jpg', 'Televisor 50 pulgadas', 'Televisor LED 4K', 'TV50', 35000.00, 1, 34000.00, 36000.00, NOW(), NOW()),
(2, 'producto2.jpg', 'Microondas', 'Microondas 30L con grill', 'MIC30', 12000.00, 2, 11500.00, 12500.00, NOW(), NOW()),
(3, 'producto3.jpg', 'Bicicleta', 'Bicicleta de montaña', 'BICI20', 25000.00, 3, 24000.00, 26000.00, NOW(), NOW());

INSERT INTO `powercore`.`imagenes` (`descripcion`, `created_at`, `updated_at`) VALUES
('imagen_producto1_1.jpg', NOW(), NOW()),
('imagen_producto1_2.jpg', NOW(), NOW()),
('imagen_producto2_1.jpg', NOW(), NOW()),
('imagen_producto3_1.jpg', NOW(), NOW());

INSERT INTO `powercore`.`productos_imagenes` (`id_producto`, `id_imagen`, `created_at`, `updated_at`) VALUES
(1, 1, NOW(), NOW()),
(1, 2, NOW(), NOW()),
(2, 3, NOW(), NOW()),
(3, 4, NOW(), NOW());

INSERT INTO `powercore`.`carritos` (`id_usuario`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Pendiente', NOW(), NOW()),
(2, 'Activo', NOW(), NOW()),
(3, 'Inactivo', NOW(), NOW());

INSERT INTO `powercore`.`carrito_productos` (`id_carrito`, `id_producto`, `cantidad`, `precio_compra`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 35000.00, NOW(), NOW()),
(1, 2, 2, 24000.00, NOW(), NOW()),
(2, 3, 1, 25000.00, NOW(), NOW());

INSERT INTO `powercore`.`modalidad_pagos` (`descripcion`, `porcentaje`, `estado`, `created_at`, `updated_at`) VALUES
('Contado', 0, 1, NOW(), NOW()),
('MercadoPago', 10, 1, NOW(), NOW());

INSERT INTO `powercore`.`ordenes` (`id_carrito`, `total_abonado`, `estado`, `id_modalidad_pago`, `created_at`, `updated_at`) VALUES
(1, 59000.00, 1, 1, NOW(), NOW()),
(2, 25000.00, 2, 2, NOW(), NOW());

INSERT INTO `powercore`.`areas` (`nombre_area`, `created_at`, `updated_at`) VALUES
('Ventas', NOW(), NOW()),
('Reparacion', NOW(), NOW())
('Ofertas', NOW(), NOW());

INSERT INTO `powercore`.`contactos` (`apellido`, `nombre`, `email`, `id_area`, `consulta`, `created_at`, `updated_at`, `estado`) VALUES 
('Pérez', 'Juan', 'juan.perez@example.com', 1, 'Consulta sobre producto A', NOW(), NOW(), 1),
('Gómez', 'María', 'maria.gomez@example.com', 2, 'Pregunta sobre el servicio B', NOW(), NOW(), 1),
('Rodríguez', 'Carlos', 'carlos.rodriguez@example.com', 1, 'Problema con la instalación', NOW(), NOW(), 2),
('Fernández', 'Lucía', 'lucia.fernandez@example.com', 2, 'Consulta sobre la facturación', NOW(), NOW(), 1),
('López', 'Ana', 'ana.lopez@example.com', 1, 'Solicitud de soporte técnico', NOW(), NOW(), 3);