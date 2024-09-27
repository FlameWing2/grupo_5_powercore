//cargamos lo necesario para usar las funciones de sequelize
const db = require('../database/models/index.js');

const usuariosController = {
    formLoginRegistro:(req,res)=>{

        res.render('usuarios/login');
    },
    formContacto:async (req,res)=>{
        const Areas = await db.Areas.findAll();
        res.render('usuarios/contacto',
            {
                areas
            }
        );
    },
    crearContacto:(req,res)=>{
        console.log(req.body);
        res.render('usuarios/contacto');
    },
    formPerfil:(req,res)=>{
        res.render('usuarios/perfil');
    },

    validarUsuario:(req,res)=>{
        console.log(req.body);
        res.render('usuarios/login');
    },

}

module.exports = usuariosController;