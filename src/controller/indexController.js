// asi vamos a manejar las rutas src/controllers/indexController.js
//agrego la ruta para poder usar path
const path = require('path');

let indexController = {
    index: (req, res)=>{
        //res.sendFile(path.resolve(__dirname, '../views/index.html'));
        res.render('index');
    }
}

module.exports = indexController;