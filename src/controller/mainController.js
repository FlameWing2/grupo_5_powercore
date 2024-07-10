// asi vamos a manejar las rutas src/controllers/indexController.js
//agrego la ruta para poder usar path
const path = require('path');
const archivo = require('node:fs');

//cargo los productos por ahora con json
const products = JSON.parse(archivo.readFileSync(path.resolve(__dirname, '../data/products.json'),"utf-8"));
let indexController = {
    index: (req, res)=>{
        //res.sendFile(path.resolve(__dirname, '../views/index.html'));
        const datos={
            titulo: "PowerCore",
            pie: "&copy; 2024 PowerCore. Trabajo grupal N&deg; 5."
        }
        
       // console.log(products);
        res.render('index',{'datos':datos,'products':products});

    }
}

module.exports = indexController;