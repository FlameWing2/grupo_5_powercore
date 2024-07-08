//paquetes necesarios, os para el host y express para el manejo
//de rutas y gestion en server
const os = require('os');
const express = require('express');
const methodOverride = require('method-override');

//paquete para el manejo de rutas absolutas o relativas
const path = require('path');
const app = express();
//inicializando una variable con el posible puerto
const puerto = 3000;

//aviso a express que use los static, assets
app.use(express.static(path.join(__dirname, '../public')));

//activo la sobreescritura de method
//con esto puedo usar put, delete, patch, etc
app.use(methodOverride('_method'));

/**estas dos lineas son necesarias para trabajar con post, put, delete */
// cargando funciones de analisis de datos de formularios y JSON
// estas dos funciones se ejecutaran de forma automatica
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

//activando template ejs
app.set('views',__dirname+"/views/");
app.set('view engine','ejs');

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
const indexRouter = require('./routes/indexRouter');
const usersRouter = require('./routes/usersRouter');
const productsRouter = require('./routes/productsRouter');
const adminRouter = require('./routes/adminRouters');

app.use('/', indexRouter);
app.use('/users',usersRouter);
app.use('/products', productsRouter);
app.use('/admin', adminRouter);


/**activo bloqueo de 404 */
app.use((req, res, next)=>{
    res.status(404).send("not-found");
})