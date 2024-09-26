
const usuariosController = {
    formLoginRegistro:(req,res)=>{
        res.render('usuarios/login');
    },
    formContacto:(req,res)=>{
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