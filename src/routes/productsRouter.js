const express = require('express');
let router = express.Router();
let productCartController = require('../controller/productCartController');
let productDetailController = require('../controller/productDetailController');

//manejo de rutas segun clase 25 - MVC
router.get('/show',productCartController.show);
router.get('/:idProduct/show',productDetailController.show);

module.exports = router;