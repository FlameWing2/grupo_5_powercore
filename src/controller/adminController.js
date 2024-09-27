
const adminController = {
    formCrear:(req,res)=>{
        res.render('admin/crear_producto',{
            infoUsuario: req.session.usuario ? req.session.usuario : null,
        });
    },
    formEditar:(req,res)=>{
        res.render('admin/editar_producto',{
            infoUsuario: req.session.usuario ? req.session.usuario : null,
        });
    },
    eliminar:(req,res)=>{
        res.render('admin/crear_producto',{
            infoUsuario: req.session.usuario ? req.session.usuario : null,
        });
    },

   

}

module.exports = adminController;