//paquetes necesarios, os para el host y express para el manejo
//de rutas y gestion en server
const os = require('os');
const express = require('express');
//paquete para el manejo de rutas absolutas o relativas
const path = require('path');
const app = express();
//inicializando una variable con el posible puerto
const puerto = 3000;


//activando escucha de puerto
app.listen(puerto, (error) => {
    if (error) {
        console.log("Error: " + error);
    } else {
        const hostname = os.hostname();
        console.log(`Server iniciado en http://${hostname}:${puerto}`);
    }
});