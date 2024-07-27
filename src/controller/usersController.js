// asi vamos a manejar las rutas src/controllers/indexController.js
//agrego la ruta para poder usar path
const path = require('path');
const crypto = require("node:crypto");

//llamo a los data que luego serán cambiados por las conexiones a BD
const parametrosGenerales = require('../config/parametros.js');

const Datasource = require('../services/datasource.js');

// Configurar el filePath
const dataUsers = new Datasource(path.resolve(__dirname, "../data/users.json"));

let usersController = {
    //procesos de login
    formLogin: (req, res)=>{
        
        
        res.render("users/login",{'datos':parametrosGenerales});
    },
    validar: (req, res)=>{
       
        res.render('users/login',{'datos':parametrosGenerales});
    },
    //procesos de register
    formRegister: (req, res)=>{
        res.render("users/register",{'datos':parametrosGenerales});
    },
    createAvatar: (req, res)=>{
       
        /**si uso multer */
        //console.log(req.file);
        //if(req.file !== undefined) llego
        res.render("users/register",{'datos':parametrosGenerales});
    },
    createUser: (req, res) => {
        const { email, password,password2,nombre,apellido } = req.body;
        const id = crypto.randomUUID();
        // Aquí vamos a manejar los datos, por ejemplo, guardarlos en una base de datos
        // o bien interactuar con ellos
        //verificamos si llegan
        console.log('Datos recibidos:', req.body);
        
        // Luego redirigir o renderizar una vista con una respuesta adecuada
        //res.send('Registro recibido: ' + nombre + " " + apellido);
        //res.redirect('/');
        
        
        res.render("users/register",{'datos':parametrosGenerales});
    }
}

module.exports = usersController;