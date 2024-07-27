// asi vamos a manejar las rutas src/controllers/indexController.js
//agrego la ruta para poder usar path
const path = require('path');

let usersController = {
    //procesos de login
    formLogin: (req, res)=>{
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
    //procesos de register
    formRegister: (req, res)=>{
        //res.sendFile(path.resolve(__dirname, '../views/users/register.html'));
        const datos={
            titulo: "PowerCore",
            pie: "&copy; 2024 PowerCore. Trabajo grupal N&deg; 5."
        }
        res.render("users/register",{'datos':datos});
    },
    createAvatar: (req, res)=>{
        //res.sendFile(path.resolve(__dirname, '../views/users/register.html'));
        const datos={
            titulo: "PowerCore",
            pie: "&copy; 2024 PowerCore. Trabajo grupal N&deg; 5."
        }
        /**si uso multer */
        //console.log(req.file);
        //if(req.file !== undefined) llego
        res.render("users/register",{'datos':datos});
    },
    createUser: (req, res) => {
        const { email, password,password2,nombre,apellido } = req.body;
        // Aquí vamos a manejar los datos, por ejemplo, guardarlos en una base de datos
        // o bien interactuar con ellos
        //verificamos si llegan
        console.log('Datos recibidos:', req.body);
        
        // Luego redirigir o renderizar una vista con una respuesta adecuada
        //res.send('Registro recibido: ' + nombre + " " + apellido);
        //res.redirect('/');
        
        const datos={
            titulo: "PowerCore",
            pie: "&copy; 2024 PowerCore. Trabajo grupal N&deg; 5."
        }
        res.render("users/register",{'datos':datos});
    }
}

module.exports = usersController;