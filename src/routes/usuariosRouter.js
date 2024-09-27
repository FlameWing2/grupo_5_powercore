//agrego los módulos necesarios
const express = require('express');
const Router = express.Router();
const usuariosController = require('../controller/usuariosController');


//generamos las distintas rutas
Router.get('/login',usuariosController.formLoginRegistro);
Router.get('/contacto',usuariosController.formContacto);
Router.post('/contacto',usuariosController.crearContacto);
Router.get('/perfil',usuariosController.formPerfil);

Router.post('/autenticar',usuariosController.validarUsuario);

module.exports = Router;