//agrego los módulos necesarios
const express = require('express');
const Router = express.Router();
const usuariosController = require('../controller/usuariosController');


//generamos las distintas rutas
Router.get('/login',usuariosController.index);
Router.get('/contacto',usuariosController.formContacto);
Router.get('/perfil',usuariosController.formPerfil);

module.exports = Router;