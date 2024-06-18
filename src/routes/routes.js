// Aqui manejaremos todo lo que es rutas
//cargo express para manejar transacciones
const express = require('express');
//mediante el metodo Router, armo un objeto que se encarga de el ruteo por grupos
const router = express.Router();


// Importar controladores
const indexController = require('../controller/indexController');
const loginController = require('../controller/loginController');
const registerController = require('../controller/registerController');
const productCartController = require('../controller/productCartController');
const productDetailController = require('../controller/productDetailController');

// Definir rutas mediante objeto router
router.get('/', indexController.getIndexPage);
router.get('/login', loginController.getLoginPage);
router.get('/register', registerController.getRegisterPage);
/**en caso de necesitar post, asi lo manejamos */
router.post('/register', registerController.postRegisterPage);

router.get('/productCart', productCartController.getProductCartPage);
router.get('/productDetail', productDetailController.getProductDetailPage);


module.exports = router;