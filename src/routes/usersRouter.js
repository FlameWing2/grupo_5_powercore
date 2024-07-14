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
//login
router.get('/login',usersController.login);
router.post('/validar',usersController.validar);

//register
router.get('/register',usersController.register);
router.post('/create',usersController.create);
router.post('/create-avatar', fileUpload.single('filenamehtml'),usersController.createAvatar);

module.exports = router;