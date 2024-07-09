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




let loginController = require('../controller/loginController');
let registerController = require('../controller/registerController');

//manejo de rutas segun clase 25 - MVC
//login
router.get('/login',loginController.login);
router.post('/validar',loginController.validar);

//register
router.get('/register',registerController.register);
router.post('/create',registerController.create);
router.post('/createAvatar', fileUpload.single('filenamehtml'),registerController.createAvatar);

module.exports = router;