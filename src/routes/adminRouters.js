const express = require('express');
let router = express.Router();
let adminController = require('../controller/adminController');

//manejo de rutas segun clase 25 - MVC

/**rutas para recibir y editar */
router.get('/edit/:id',adminController.edit);
router.put('/edit/:id',adminController.editProduct);

/**rutas para crear un producto nuevo */
router.get('/register',adminController.register);
router.post('/register',adminController.registerProduct);
module.exports = router;