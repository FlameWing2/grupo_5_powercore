//paquetes necesarios, os para el host y express para el manejo
//de rutas y gestión en server
const os = require('os');
const express = require('express');
const methodOverride = require('method-override');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
const session = require('express-session');

//paquete para el manejo de rutas absolutas o relativas
const path = require('path');
const app = express();
//inicializando una variable con el posible puerto
const puerto = 3000;

//aviso a express que use los static, assets
//app.use(express.static(path.join(__dirname, '../public')));
app.use(express.static(path.resolve(__dirname, '../public')));

//activo la sobreescritura de method
//con esto puedo usar put, delete, patch, etc
app.use(methodOverride('_method'));
app.use(cookieParser());
/**
 * Resultado
Texto original  POWERCORE-GRUPO5
MD5             307d9deec28d612339b707cc4c6c6969
Base64          UE9XRVJDT1JFLUdSVVBPNQ==
Sha1            ecca91561ee97db021552e024d335f546959a9c2
 */
app.use(session({
    secret: "307d9deec28d612339b707cc4c6c6969",
    resave: false,
    saveUninitialized: true
}))
/**estas dos lineas son necesarias para trabajar con post, put, delete */
// cargando funciones de analisis de datos de formularios y JSON
// estas dos funciones se ejecutaran de forma automatica
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

//activando template ejs
//app.set('views',__dirname+"/views/");
app.set('views', path.resolve(__dirname, 'views'));
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
const mainRouter = require('./routes/mainRouter');
const usersRouter = require('./routes/usersRouter');
const productsRouter = require('./routes/productsRouter');
const adminRouter = require('./routes/adminRouters');
const autologin = require('./middleware/autologin');

//para testing de mysql
app.use(autologin);

app.use('/',mainRouter);
app.use('/users',usersRouter);
app.use('/products',productsRouter);
app.use('/admin',adminRouter);

app.use((req, res, next) => {
    console.log(`URL solicitada: ${req.originalUrl}`);
    next();
});

/**activo bloqueo de 404 */
app.use((req, res, next)=>{
    res.status(404).render("errors/404");
})