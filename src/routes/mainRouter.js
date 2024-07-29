/**agrego requisitos */
const express = require('express');
let router = express.Router();
let indexController = require('../controller/mainController');

//manejo de rutas segun clase 25 - MVC
/**ruta encargada de mostrar la pagina de inicio con sus productos */
router.get('/',indexController.index);

/**ruta encargada de mostrar un formulario para que puedan contactarse */
router.get('/contact',indexController.contact);

/**ruta para que los usuarios puedan dejar una consulta */
router.post('/contact',indexController.consultaCrear);

/**ruta de prueba de escritura en archivo */
router.get('/archivo',indexController.archivo);

module.exports = router;