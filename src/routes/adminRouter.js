//agrego los módulos necesarios
const express = require('express');
const Router = express.Router();
const adminController = require('../controller/adminController');


//generamos las distintas rutas
Router.get('/crear_producto',adminController.formCrear);
Router.get('/editar_producto',adminController.formEditar);
Router.get('/eliminar_producto',adminController.eliminar);

module.exports = Router;