const express = require('express');
let router = express.Router();
let productsController = require('../controller/productsController');

//manejo de rutas segun clase 25 - MVC
router.get('/show',productsController.showCart);
router.get('/:idProduct/show',productsController.showDetails);

module.exports = router;