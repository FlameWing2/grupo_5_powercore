const express = require('express');
let router = express.Router();
let loginController = require('../controller/loginController');
let registerController = require('../controller/registerController');

//manejo de rutas segun clase 25 - MVC

//login
router.get('/login',loginController.login);
router.post('/validar',loginController.validar);

//register
router.get('/register',registerController.register);
router.post('/create',registerController.create);

module.exports = router;