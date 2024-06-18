// asi vamos a manejar las rutas src/controllers/????Controller.js
//agrego la ruta para poder usar path
const path = require('path');

// Controlador para la ruta '/'
exports.getProductDetailPage = (req, res) => {
    res.sendFile(path.resolve(__dirname, '../views/productDetail.html'));
};

// Desde aqui podemos ir colocando los metodos de post, put, delete,
// querys de SQL etc.