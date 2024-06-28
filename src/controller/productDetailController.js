// asi vamos a manejar las rutas src/controllers/indexController.js
//agrego la ruta para poder usar path
const path = require('path');

let productDetailController = {
    index: (req, res)=>{
        res.sendFile(path.resolve(__dirname, '../views/productDetail.html'));
    },
    detalleArticulo: (req, res)=>{
        const idArticulo = req.params.idArticulo;
        res.send("mostrando datos o pagina del articulo "+ idArticulo);
    }
}

module.exports = productDetailController;