//paquetes necesarios para un proyecto con express
const os = require('os');
const path = require('path');
const express = require('express');
const app = express();

//paquetes necesarios para recibir datos de un form, manejar sessiones y cookies
const methodOverride = require('method-override');
const cookieParser = require('cookie-parser');
const session = require('express-session');


//configuraciones necesarias
app.use(express.static(path.resolve(__dirname, '../public')));
app.use(methodOverride('_method'));
app.use(cookieParser());
app.use(session({
    secret: "307d9deec28d612339b707cc4c6c6969",
    resave: false,
    saveUninitialized: true
}))

//configuracion para recibir datos de POST y JSON
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

//configuracion para el manejo de vistas tipo EJS
app.set('views', path.resolve(__dirname, 'views'));
app.set('view engine','ejs');

//activando escucha de puerto
const Puerto = 3000;
app.listen(Puerto, (error) => {
    if (error) {
        console.log("Error: " + error);
    } else {
        const hostname = os.hostname();
        console.log(`Server iniciado en http://${hostname}:${Puerto}`);
    }
});


// Importar manejadores de rutas
const mainRouter = require('./routes/mainRouter');
//const usersRouter = require('./routes/usersRouter');
//const productsRouter = require('./routes/productsRouter');
//const adminRouter = require('./routes/adminRouters');
//const autologin = require('./middleware/autologin');

//para testing de mysql
//app.use(autologin);

//captura de rutas y envio a enrutadores
app.use('/',mainRouter);
//app.use('/users',usersRouter);
//app.use('/products',productsRouter);
//app.use('/admin',adminRouter);

//configuracion de un middleware para controlar que rutas son consultadas
app.use((req, res, next) => {
    console.log(`URL solicitada: ${req.originalUrl}`);
    next();
});

/**activo bloqueo de 404 o de otra pagina solicitad no encontrada, aqui agregarlas */
app.use((req, res, next)=>{
    res.status(404).render("errors/404");
})