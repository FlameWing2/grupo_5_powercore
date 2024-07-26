// asi vamos a manejar las rutas src/controllers/indexController.js
//agrego la ruta para poder usar path
const path = require('path');
const archivo = require('node:fs');
const products = require('../data/products.json');
const promos = require('../data/banner.js')
//cargo los productos por ahora con json
//aplicar luego const {products} = require(.............url del json)
//const products = JSON.parse(archivo.readFileSync(path.resolve(__dirname, '../data/products.json'),"utf-8"));
let indexController = {
    index: (req, res)=>{
        //res.sendFile(path.resolve(__dirname, '../views/index.html'));
        const datos={
            titulo: "PowerCore",
            pie: "&copy; 2024 PowerCore. Trabajo grupal N&deg; 5."
        }
        
       // console.log(products);
        res.render('index',{'datos':datos,'products':products,promos});

    },
    contact: (req, res)=>{
        console.log("entro get contact")
        //res.sendFile(path.resolve(__dirname, '../views/index.html'));
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