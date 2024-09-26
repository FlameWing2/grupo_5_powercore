
const usuariosController = {
    index:(req,res)=>{
        res.render('usuarios/login');
    },
    formContacto:(req,res)=>{
        res.render('usuarios/contacto');
    },
    formPerfil:(req,res)=>{
        res.render('usuarios/perfil');
    },

}

module.exports = usuariosController;