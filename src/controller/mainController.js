// asi vamos a manejar las rutas src/controllers/indexController.js
//agrego la ruta para poder usar path
const path = require('path');
const crypto = require("node:crypto");

//llamo a los data que luego serán cambiados por las conexiones a BD
const promos = require('../data/banner.js');
const ParametrosGenerales = require('../config/parametros.js');
const parametrosGenerales = new ParametrosGenerales();

const datasource2 = require('../services/datasource2.js');
const dataProduct = require('../services/datasource.js');   //clase
const dataProducts = new dataProduct(path.resolve(__dirname,'../data/products.json'));

let indexController = {
    contacts:null,
    index: async (req, res)=>{
        
        if(req.session.ususario!=null){
            console.log("usuario:"+req.session.usuario.nombre);
        }
        
        res.render('index',{
            'datos':parametrosGenerales,
            'products': await dataProducts.load(),
            promos,
            infoUsuario:(req.session.usuario)?req.session.usuario:'No hay Datos',
            producDelete:(req.session.eliminado)?req.session.eliminado:null,
        });
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
        console.log(req.session.msg);
        if(req.session.msg != null ){
            parametrosGenerales.msg = req.session.msg;
            req.session.msg = null;
        }else{
            parametrosGenerales.msg="";
        }
        res.render('contact',{
            'datos':parametrosGenerales,
            infoUsuario:(req.session.usuario)?req.session.usuario:'No hay Datos'
        });
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

        const info = await datasource2.load();
        info.push(nuevaConsulta);
        await datasource2.save(info);
        console.log(info);
        req.session.msg = `Gracias por su consulta, pronto nuestros asesores se pondrán en contacto con usted ${nombre} ${apellido}`;
        //parametrosGenerales.msg = "Gracias por su consulta, pronto nuestros asesores se pondrán en contacto con usted";
        res.redirect('/contact');
        //res.render('contact',{'datos':parametrosGenerales});
    }
}

module.exports = indexController;