const express = require('express');
let router = express.Router();
let indexController = require('../controller/indexController');

//manejo de rutas segun clase 25 - MVC

router.get('/',indexController.index);

module.exports = router;