// asi vamos a manejar las rutas src/controllers/indexController.js
//agrego la ruta para poder usar path
const path = require('path');

let loginController = {
    login: (req, res)=>{
        //res.sendFile(path.resolve(__dirname, '../views/users/login.html'));
        const datos={
            titulo: "PowerCore",
            pie: "&copy; 2024 PowerCore. Trabajo grupal N&deg; 5."
        }
        res.render("users/login",{'datos':datos});
    },
    validar: (req, res)=>{
        //res.sendFile(path.resolve(__dirname, '../views/users/login.html'));
        const datos={
            titulo: "PowerCore",
            pie: "&copy; 2024 PowerCore. Trabajo grupal N&deg; 5."
        }
        res.render('users/login',{'datos':datos});
    },
}

module.exports = loginController;