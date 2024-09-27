//agrego los módulos necesarios
const express = require('express');
const Router = express.Router();
const productosController = require('../controller/productosController');


//generamos las distintas rutas
Router.get('/buscador',productosController.formBuscador);
Router.get('/carrito',productosController.formCarrito);
Router.get('/detalle/:id',productosController.formProductoDetalle);

module.exports = Router;