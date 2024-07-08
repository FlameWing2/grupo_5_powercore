// asi vamos a manejar las rutas src/controllers/indexController.js
//agrego la ruta para poder usar path
const path = require('path');

let loginController = {
    login: (req, res)=>{
        //res.sendFile(path.resolve(__dirname, '../views/users/login.html'));
        res.render("users/login");
    },
    validar: (req, res)=>{
        //res.sendFile(path.resolve(__dirname, '../views/users/login.html'));
        res.render('users/login');
    },
}

module.exports = loginController;