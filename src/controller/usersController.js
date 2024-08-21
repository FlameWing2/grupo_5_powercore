// asi vamos a manejar las rutas src/controllers/indexController.js
//agrego la ruta para poder usar path
const path = require("path");
const crypto = require("node:crypto");
const bcrypt = require("bcrypt");

//llamo a los data que luego serán cambiados por las conexiones a BD
const ParametrosGenerales = require("../config/parametros.js");
const parametrosGenerales = new ParametrosGenerales();

const Datasource = require("../services/datasource.js");

// Configurar el filePath
const dataUsers = new Datasource(path.resolve(__dirname, "../data/users.json"));

let usersController = {
  //procesos de login
  formLogin: (req, res) => {
    res.render("users/login", {
      datos: parametrosGenerales,
      infoUsuario: req.session.usuario ? req.session.usuario : "No hay Datos",
    });
  },
  salir: (req, res) => {
    if (req.session.usuario != null) {
      req.session.usuario = null;
      res.redirect("/users/login");
    }
  },
  validar: async (req, res) => {
    let { email, password, recordar } = req.body;

    //consulto si existe este usuario
    const usuarios = await dataUsers.load();
    const existe = usuarios.find((user) => {
      if (user.email == req.body.email && user.password == req.body.password) {
        return user;
      }
    });
    if (existe) {
      req.session.usuario = existe;
      //guardo el usario en cookie
      if (recordar === "on") {
        res.cookie("usuarioCokkie", existe.idUser, {
          maxAge: 60000,
          httpOnly: true,
        });
        console.log("se guardo cookie con " + existe.idUser);
      }
      res.redirect("/"); //lo envio al index
    } else {
      parametrosGenerales.error = `Error, no se encontro las credenciales para el correo: <b>${email}</b>`;
      res.render("users/login", {
        datos: parametrosGenerales,
        infoUsuario: req.session.usuario ? req.session.usuario : "No hay Datos",
      });
    }
  },
  //procesos de register
  formRegister: (req, res) => {
    console.log("en get: " + parametrosGenerales.msg);
    if (req.session.msg != null) {
      parametrosGenerales.msg = req.session.msg;
      req.session.msg = null;
    } else {
      parametrosGenerales.msg = "";
    }
    console.log("en get: " + parametrosGenerales.msg);
    res.render("users/register", {
      datos: parametrosGenerales,
      infoUsuario: req.session.usuario ? req.session.usuario : "No hay Datos",
    });
  },
  createAvatar: (req, res) => {
    /**si uso multer */
    console.log(req.file);
    //if(req.file !== undefined) llego
    // res.render("users/register", {
    //   datos: parametrosGenerales,
    //   infoUsuario: req.session.usuario ? req.session.usuario : "No hay Datos",
    // });
  },
  createUser: async (req, res) => {
    const { email, password, password2, nombre, apellido, dni, telefono } =
      req.body;

    const hashedPassword = await bcrypt.hash(password, 8);

    let nuevaUsuario = {
      idUser: crypto.randomUUID(),
      apellido,
      nombre,
      dni,
      telefono,
      email,
      hashedPassword,
      category: "Client",
      imagen: "avatar-female.jpg",
      direccion: "barrio xxx - calle xxx num xxxx",
    };
    const archivo = await dataUsers.load();
    archivo.push(nuevaUsuario);
    console.log(archivo);
    await dataUsers.save(archivo);
    // Aquí vamos a manejar los datos, por ejemplo, guardarlos en una base de datos
    // o bien interactuar con ellos
    //verificamos si llegan
    //console.log('Datos recibidos:', req.body);
    req.session.msg = `Gracias por registrarse en PowerCore,  ${nombre} ${apellido}, pronto le llegara un email a su correo`;
    console.log("en post: " + req.session.msg);
    // Luego redirigir o renderizar una vista con una respuesta adecuada
    //res.send('Registro recibido: ' + nombre + " " + apellido);

    res.redirect("/users/register");

    //res.render("users/register",{'datos':parametrosGenerales});
  },
};

module.exports = usersController;
