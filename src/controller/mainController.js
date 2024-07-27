// asi vamos a manejar las rutas src/controllers/indexController.js
//agrego la ruta para poder usar path
const path = require('path');

//llamo a los data que luego serán cambiados por las conexiones a BD
const promos = require('../data/banner.js');
const datasource = require('../services/datasource.js');

// Configurar el filePath
datasource.agregarURL(path.resolve(__dirname, "../data/products.json"));

let indexController = {
    index: async (req, res)=>{
        const datos={
            titulo: "PowerCore",
            pie: "&copy; 2024 PowerCore. Trabajo grupal N&deg; 5."
        }
       // console.log(products);
        res.render('index',{
            'datos':datos,
            'products':JSON.parse(await datasource.load()),
            promos});

    },
    contact: (req, res)=>{
        console.log("entro get contact")
        const datos={
            titulo: "PowerCore",
            pie: "&copy; 2024 PowerCore. Trabajo grupal N&deg; 5.",
            msg: ""
        }
        
       // console.log(products);
        res.render('contact',{'datos':datos});

    },
    consultaCrear: (req, res)=>{
        //tomo lo del body
        console.log("entro post contact");
        const datos={
            titulo: "PowerCore",
            pie: "&copy; 2024 PowerCore. Trabajo grupal N&deg; 5.",
            msg: "Gracias por su consulta, pronto nuestros asesores se pondrán en contacto con usted"
        }
        
       // console.log(products);
        res.render('contact',{'datos':datos});

    }
}

module.exports = indexController;