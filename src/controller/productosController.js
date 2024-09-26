
const productosController = {
    formBuscador:(req,res)=>{
        res.render('productos/buscador_items');
    },
    formCarrito:(req,res)=>{
        res.render('productos/carrito');
    },
    formProductoDetalle:(req,res)=>{
        res.render('productos/producto_detalle');
    },

   

}

module.exports = productosController;