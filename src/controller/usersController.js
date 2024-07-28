// asi vamos a manejar las rutas src/controllers/indexController.js
//agrego la ruta para poder usar path
const path = require('path');
const crypto = require("node:crypto");

//llamo a los data que luego serán cambiados por las conexiones a BD
const ParametrosGenerales = require('../config/parametros.js');
const parametrosGenerales = new ParametrosGenerales();

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
        console.log("en get: " + parametrosGenerales.msg);
        if(req.session.msg != null ){
            parametrosGenerales.msg = req.session.msg;
            req.session.msg = null;
        }else{
            parametrosGenerales.msg="";
        }
        console.log("en get: " + parametrosGenerales.msg);
        res.render("users/register",{'datos':parametrosGenerales});
    },
    createAvatar: (req, res)=>{
      
        /**si uso multer */
        //console.log(req.file);
        //if(req.file !== undefined) llego
        res.render("users/register",{'datos':parametrosGenerales});
    },
    createUser: async (req, res) => {
        const { email, password,password2,nombre,apellido,dni, telefono } = req.body;

        let nuevaUsuario={
            idUser:crypto.randomUUID(),
            apellido,
            nombre,
            dni,
            telefono,
            email,
            password,
            category:"Client",
            imagen: "avatar-female.jpg",
            direccion: "barrio xxx - calle xxx num xxxx"
        }
        const archivo = await dataUsers.load();
        archivo.push(nuevaUsuario);
        console.log(archivo);
        //await dataUsers.save(archivo);
        // Aquí vamos a manejar los datos, por ejemplo, guardarlos en una base de datos
        // o bien interactuar con ellos
        //verificamos si llegan
        //console.log('Datos recibidos:', req.body);
        req.session.msg = `Gracias por registrarse en PowerCore,  ${nombre} ${apellido}, pronto le llegara un email a su correo`;
        console.log("en post: " + req.session.msg);
        // Luego redirigir o renderizar una vista con una respuesta adecuada
        //res.send('Registro recibido: ' + nombre + " " + apellido);


        res.redirect('/users/register');
        
        
        //res.render("users/register",{'datos':parametrosGenerales});
    }
}

module.exports = usersController;