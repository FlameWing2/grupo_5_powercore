//agrego los módulos necesarios
const express = require('express');
const Router = express.Router();
const adminController = require('../controller/adminController');


//generamos las distintas rutas
Router.get('/crear_objeto',adminController.formCrear);
Router.post('/crear_objeto',adminController.crearObjeto);
Router.get('/editar_objeto/:id',adminController.formEditar);
Router.get('/eliminar_objeto',adminController.eliminar);

module.exports = Router;