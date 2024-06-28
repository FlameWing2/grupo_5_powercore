const express = require('express');
let router = express.Router();
let registerController = require('../controller/registerController');

//manejo de rutas segun clase 25 - MVC

router.get('/',registerController.index);
router.post('/',registerController.create);

module.exports = router;