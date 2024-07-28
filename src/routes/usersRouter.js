const express = require('express');
let router = express.Router();


let usersController = require('../controller/usersController');

//manejo de rutas segun clase 25 - MVC
/**
 * Pagina de Login
 * */

/**ruta que muestra un formulario de login, formulario de recuperar clave */
router.get('/login',usersController.formLogin);

/**ruta que se encarga de validar el usuario, falta middleware */
router.post('/login',usersController.validar);


/**------------------------------------------------------------------------------------------------------- */




/**
 * Pagina de Registro
 * */

/**ruta que muestra un formulario de registro */
router.get('/register',usersController.formRegister);

/**ruta que captura lo que la persona envia en el registro */
router.post('/register',usersController.createUser);

/**ruta que captura el avatar del perfil(NO CREADO POR AHORA) */
//router.post('/create-avatar', fileUpload.single('filenamehtml'),usersController.createAvatar);

module.exports = router;