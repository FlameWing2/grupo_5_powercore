const express = require('express');
let router = express.Router();
let productDetailController = require('../controller/productDetailController');

//manejo de rutas segun clase 25 - MVC

router.get('/articulo/:idArticulo',productDetailController.detalleArticulo);
router.get('/',productDetailController.index);

module.exports = router;