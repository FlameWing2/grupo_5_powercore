
const adminController = {
    formCrear:(req,res)=>{
        res.render('admin/crear_producto');
    },
    formEditar:(req,res)=>{
        res.render('admin/editar_producto');
    },
    eliminar:(req,res)=>{
        res.render('admin/crear_producto');
    },

   

}

module.exports = adminController;