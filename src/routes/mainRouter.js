//agrego los módulos necesarios
const express = require('express');
const Router = express.Router();
const mainController = require('../controller/mainController');


//generamos las distintas rutas
Router.get('/',mainController.index);

module.exports = Router;
