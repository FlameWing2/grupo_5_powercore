const { formContacto } = require("./mainController");

const usuarioController = {
    index:(req,res)=>{
        res.render('usuarios/login');
    },
    formContacto:(req,res)=>{
        res.render('usuarios/contacto');
    },

}

module.exports = usuarioController;