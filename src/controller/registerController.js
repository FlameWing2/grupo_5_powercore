// asi vamos a manejar las rutas src/controllers/????Controller.js
//agrego la ruta para poder usar path
const path = require('path');

let registerController = {
    index: (req, res)=>{
        res.sendFile(path.resolve(__dirname, '../views/register.html'));
    },
    validar: (req, res) => {
        const { nombre, apellido } = req.body;
        // Aquí vamos a manejar los datos, por ejemplo, guardarlos en una base de datos
        // o bien interactuar con ellos
        //verificamos si llegan
        console.log('Datos recibidos:', req.body);
        
        // Luego redirigir o renderizar una vista con una respuesta adecuada
        res.send('Registro recibido: ' + nombre + " " + apellido);
    }
}

module.exports = registerController;