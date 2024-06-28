const express = require('express');
let router = express.Router();
let productCartController = require('../controller/productCartController');

//manejo de rutas segun clase 25 - MVC

router.get('/',productCartController.index);

module.exports = router;