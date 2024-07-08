// asi vamos a manejar las rutas src/controllers/indexController.js
//agrego la ruta para poder usar path
const path = require('path');

let productCartController = {
    show: (req, res)=>{
       // res.sendFile(path.resolve(__dirname, '../views/productCart.html'));
       const datos={
        titulo: "PowerCore",
        pie: "&copy; 2024 PowerCore. Trabajo grupal N&deg; 5."
    }
       res.render('products/productCart',{'datos':datos});
      
    }
}

module.exports = productCartController;