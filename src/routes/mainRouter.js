const express = require('express');
let router = express.Router();
let indexController = require('../controller/mainController');

//manejo de rutas segun clase 25 - MVC

router.get('/',indexController.index);
router.get('/contact',indexController.contact);
module.exports = router;