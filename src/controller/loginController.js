// asi vamos a manejar las rutas src/controllers/indexController.js
//agrego la ruta para poder usar path
const path = require('path');

let loginController = {
    index: (req, res)=>{
        res.sendFile(path.resolve(__dirname, '../views/login.html'));
    },
    validar: (req, res)=>{
        res.sendFile(path.resolve(__dirname, '../views/login.html'));
    },
}

module.exports = loginController;