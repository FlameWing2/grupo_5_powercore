//paquetes necesarios, os para el host y express para el manejo
//de rutas y gestion en server
const os = require('os');
const express = require('express');


//paquete para el manejo de rutas absolutas o relativas
const path = require('path');
const app = express();
//inicializando una variable con el posible puerto
const puerto = 3000;

//aviso a express que use los static, assets
app.use(express.static(path.join(__dirname, 'public')));

// cargando funciones de analisis de datos de formularios y JSON
// estas dos funciones se ejecutaran de forma automatica
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

//activando escucha de puerto
app.listen(puerto, (error) => {
    if (error) {
        console.log("Error: " + error);
    } else {
        const hostname = os.hostname();
        console.log(`Server iniciado en http://${hostname}:${puerto}`);
    }
});


// Importar y usar las rutas
const indexRouter = require('./src/routes/indexRouter');
const loginRouter = require('./src/routes/loginRouter');
const registerRouter = require('./src/routes/registerRouter');
const producCartRouter = require('./src/routes/producCartRouter');
const productDetailsRouter = require('./src/routes/productDetailsRouter');
// sea cual sea la ruta que llegue, sera derivada a routes.js, ahi se analiza y se llama
// al controlador que se lo necesite.

app.use('/', indexRouter);
app.use('/login', loginRouter);
app.use('/register', registerRouter);
app.use('/productCart', producCartRouter);
app.use('/productDetail', productDetailsRouter);