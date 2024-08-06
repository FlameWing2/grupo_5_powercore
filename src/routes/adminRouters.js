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

//ruta para borrar, modalidad enlace
router.get('/delete/:id',adminController.delete);

//ruta no implementada pero ya esta cargada para cuando este el formulario
router.delete('/deletepost/:id',adminController.deletePost);
module.exports = router;