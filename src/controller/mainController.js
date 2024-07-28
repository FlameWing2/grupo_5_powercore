// asi vamos a manejar las rutas src/controllers/indexController.js
//agrego la ruta para poder usar path
const path = require('path');
const crypto = require("node:crypto");

//llamo a los data que luego serán cambiados por las conexiones a BD
const promos = require('../data/banner.js');
const parametrosGenerales = require('../config/parametros.js');
const datasource2 = require('../services/datasource2.js');
const dataProduct = require('../services/datasource.js');   //clase
const dataProducts = new dataProduct(path.resolve(__dirname,'../data/products.json'));

let indexController = {
    contacts:null,
    index: async (req, res)=>{
        
        res.render('index',{
            'datos':parametrosGenerales,
            'products': await dataProducts.load(),
            promos});
    },
    archivo:async (req, res)=>{
        
        const dato = {
            id:crypto.randomUUID(),
            nombre: "prueba",
            apellido: "prueba ape"
        }
        let info = await datasource2.load();
        info.push(dato);
        console.log(info);
        await datasource2.save(info);

        res.redirect('/');
    },
    contact:async (req, res)=>{
        

        res.render('contact',{'datos':parametrosGenerales});
    },
    consultaCrear: async (req, res)=>{
        //armo paquete por ahora sin validar mucho
        let { nombre, apellido, email, departamento, observacion } = req.body;

        let nuevaConsulta={
            id:crypto.randomUUID(),
            nombre,
            apellido,
            email,
            departamento,
            observacion
        }
        const dato = {
            mensaje: "hay post",
            nombre: req.body.nombre,
            apellido: req.body.apellido
        }
        const info = await datasource2.load();
        info.push(dato);
        //await datasource2.save(info);
        console.log(info);
        //req.session.msg = "Gracias por su consulta, pronto nuestros asesores se pondrán en contacto con usted";
        parametrosGenerales.msg = "Gracias por su consulta, pronto nuestros asesores se pondrán en contacto con usted";
        //res.redirect('/');
        res.render('contact',{'datos':parametrosGenerales});
    }
}

module.exports = indexController;