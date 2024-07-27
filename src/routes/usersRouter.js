const express = require('express');
let router = express.Router();
const multer = require('multer');
/**si voy a usar multer con archivos */
const storageMulter = multer.diskStorage({
    destination: (req, file, cb)=>{
        /**alternativa folder*/
        /*const folder = path.join(__dirname,'ruta');*/
        cb(null,path.join(__dirname,'./public/images/avatars'));
    },
    /*alternativa*/
    //let imageName = Date.now() + path.extname(file.originalname)*/
    filename: (req, file, cb)=>{
        cb(null,`${Date.now()}_img_${path.extname(file.originalname)}`);
    }
})
/**----------fin multer */

/*configurar multer*/
let fileUpload = multer({storage:storageMulter});




let usersController = require('../controller/usersController');

//manejo de rutas segun clase 25 - MVC
/**
 * Pagina de Login
 * */

/**ruta que muestra un formulario de login, formulario de recuperar clave */
router.get('/login',usersController.formLogin);

/**ruta que se encarga de validar el usuario, falta middleware */
router.post('/validar',usersController.validar);


/**------------------------------------------------------------------------------------------------------- */




/**
 * Pagina de Registro
 * */

/**ruta que muestra un formulario de registro */
router.get('/register',usersController.formRegister);

/**ruta que captura lo que la persona envia en el registro */
router.post('/create',usersController.createUser);

/**ruta que captura el avatar del perfil(NO CREADO POR AHORA) */
router.post('/create-avatar', fileUpload.single('filenamehtml'),usersController.createAvatar);

module.exports = router;