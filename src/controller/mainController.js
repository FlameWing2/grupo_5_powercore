// asi vamos a manejar las rutas src/controllers/indexController.js
//agrego la ruta para poder usar path
const path = require('path');
const crypto = require("node:crypto");

//llamo a los data que luego serán cambiados por las conexiones a BD
const promos = require('../data/banner.js');
const parametrosGenerales = require('../config/parametros.js');
const Datasource = require('../services/datasource.js');


// Configurar el filePath
const dataProducts = new Datasource(path.resolve(__dirname, "../data/products.json"));
const dataContacts = new Datasource(path.resolve(__dirname, "../data/contacts.json"));

let indexController = {
    index: async (req, res)=>{
        
        res.render('index',{
            'datos':parametrosGenerales,
            'products': await dataProducts.load(),
            promos});
    },
    contact: (req, res)=>{
        if(req.session.msg !=""){
            parametrosGenerales.msg=req.session.msg;
            req.session.msg = null;
        }
        res.render('contact',{'datos':parametrosGenerales});
    },
    consultaCrear: async (req, res)=>{
        //armo paquete por ahora sin validar mucho
       const { nombre, apellido, email, departamento, observacion } = req.body;
        const nuevaConsulta={
            id:crypto.randomUUID(),
            nombre,
            apellido,
            email,
            departamento,
            observacion
        }
        let contacts = await dataContacts.load();
        contacts.push(nuevaConsulta);
        //const result=await dataContacts.save(contacts);
        console.log(contacts);
        req.session.msg = "Gracias por su consulta, pronto nuestros asesores se pondrán en contacto con usted";
    
        res.redirect('/contact');
        //res.render('contact',{'datos':parametrosGenerales});
    }
}

module.exports = indexController;