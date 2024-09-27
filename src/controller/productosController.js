
const productosController = {
    formBuscador:(req,res)=>{
        res.render('productos/buscador_items',{
            infoUsuario: req.session.usuario ? req.session.usuario : null,
        });
    },
    formCarrito:(req,res)=>{
        res.render('productos/carrito',{
            infoUsuario: req.session.usuario ? req.session.usuario : null,
        });
    },
    formProductoDetalle:(req,res)=>{
        res.render('productos/producto_detalle',{
            infoUsuario: req.session.usuario ? req.session.usuario : null,
        });
    },

   

}

module.exports = productosController;