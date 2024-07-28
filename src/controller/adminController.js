// asi vamos a manejar las rutas src/controllers/indexController.js
//agrego la ruta para poder usar path
const path = require('path');

//llamo a los data que luego serán cambiados por las conexiones a BD
const parametrosGenerales = require('../config/parametros.js');

let adminController = {
    edit: (req, res)=>{
        parametrosGenerales.msg ="Producto XXXX editado de forma exitosa";
        
        res.render('admin/editProduct',{'datos':parametrosGenerales});
    },
    create: (req, res)=>{
        
        res.render('admin/listProduct',{'datos':parametrosGenerales});
    },
    register: (req, res)=>{
        
        res.render('admin/registerProduct',{'datos':parametrosGenerales});
    },
    registerProduct: (req, res)=>{
        parametrosGenerales.msg ="Este mensaje solo aparece cuando le hagan POST, ahora solo de prueba";
       
        res.render('admin/registerProduct',{'datos':parametrosGenerales});
    }

}

module.exports = adminController;