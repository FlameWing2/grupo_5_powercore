const express = require('express');
let router = express.Router();
let productsController = require('../controller/productsController');

//manejo de rutas segun clase 25 - MVC
//lista de productos en carrito
router.get('/cart',productsController.showCart);

//producto detallado mediante su id
router.get('/:idproduct',productsController.showDetails);

//creando un producto nuevo
router.post('/',productsController.createProduct);

//creando un producto nuevo
router.put('/:id',productsController.updateProduct);

/**el uso de delete product lo tenemos en adminRouter */
module.exports = router;