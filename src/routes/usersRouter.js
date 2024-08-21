const express = require("express");
let router = express.Router();
const multer = require("multer");
const path = require("path");

let usersController = require("../controller/usersController");

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    const folder = path.join(__dirname, "../../public/images/userImages");
    cb(null, folder);
  },
  filename: (req, file, cb) => {
    console.log("FILE:", file);

    const imageName = "user-" + Date.now() + path.extname(file.originalname);
    cb(null, imageName);
  },
});

const upload = multer({ storage: storage });

//manejo de rutas segun clase 25 - MVC
/**
 * Pagina de Login
 * */

/**ruta que muestra un formulario de login, formulario de recuperar clave */
router.get("/login", usersController.formLogin);

/**ruta que se encarga de validar el usuario, falta middleware */
router.post("/login", usersController.validar);

/**ruta que que se encarga de borrar la session*/
router.get("/salir", usersController.salir);
/**------------------------------------------------------------------------------------------------------- */

/**
 * Pagina de Registro
 * */

/**ruta que muestra un formulario de registro */
router.get("/register", usersController.formRegister);

/**ruta que captura lo que la persona envia en el registro */
router.post("/register", upload.single("avatar"), usersController.createUser);

/**ruta que captura el avatar del perfil(NO CREADO POR AHORA) */
//router.post('/create-avatar', fileUpload.single('filenamehtml'),usersController.createAvatar);

module.exports = router;
