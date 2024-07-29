const express = require('express');
let router = express.Router();
let productsController = require('../controller/productsController');

//manejo de rutas segun clase 25 - MVC
router.get('/cart',productsController.showCart);
router.get('/:idproduct',productsController.showDetails);

module.exports = router;