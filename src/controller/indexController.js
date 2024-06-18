// asi vamos a manejar las rutas src/controllers/indexController.js
//agrego la ruta para poder usar path
const path = require('path');

// Controlador para la ruta '/'
exports.getIndexPage = (req, res) => {
    res.sendFile(path.resolve(__dirname, '../views/index.html'));
};

// Desde aqui podemos ir colocando los metodos de post, put, delete,
// querys de SQL etc.