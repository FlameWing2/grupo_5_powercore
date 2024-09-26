//agrego los módulos necesarios
const express = require('express');
const Router = express.Router();
const usuarioController = require('../controller/usuarioController');


//generamos las distintas rutas
Router.get('/login',usuarioController.index);
Router.get('/contacto',usuarioController.formContacto);

module.exports = Router;