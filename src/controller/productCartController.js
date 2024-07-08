// asi vamos a manejar las rutas src/controllers/indexController.js
//agrego la ruta para poder usar path
const path = require('path');

let productCartController = {
    show: (req, res)=>{
       // res.sendFile(path.resolve(__dirname, '../views/productCart.html'));
       res.render('products/productCart');
      
    }
}

module.exports = productCartController;