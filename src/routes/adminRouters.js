const express = require('express');
let router = express.Router();
let adminController = require('../controller/adminController');

//manejo de rutas segun clase 25 - MVC

router.get('/edit',adminController.edit);
router.post('/edit',adminController.edit);
router.get('/create',adminController.create);
router.get('/register',adminController.register);

module.exports = router;