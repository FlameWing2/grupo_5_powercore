const express = require('express');
let router = express.Router();
let loginController = require('../controller/loginController');

//manejo de rutas segun clase 25 - MVC

router.get('/',loginController.index);
router.post('/',loginController.validar);

module.exports = router;