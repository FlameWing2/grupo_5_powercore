// asi vamos a manejar las rutas src/controllers/indexController.js
//agrego la ruta para poder usar path
const path = require('path');

//llamo a los data que luego serán cambiados por las conexiones a BD
const parametrosGenerales = require('../config/parametros.js');
//traigo los productos
const dataProducts = require('../services/datasource.js');   //clase
const dataProduct = new dataProducts(path.resolve(__dirname,'../data/products.json'));

let adminController = {
    edit: async (req, res)=>{
        parametrosGenerales.msg ="";
        //busco el producto
        const idProducto = parseInt(req.params.id);
        const Productos = await dataProduct.load()
        const infoProducto = Productos.find(producto => producto.productId == idProducto);
        console.log(infoProducto);
        res.render('admin/editProduct',{
            'datos':parametrosGenerales,
            infoUsuario:(req.session.usuario)?req.session.usuario:'No hay Datos',
            infoProducto
        });
    },
    editProduct: async (req, res)=>{
        parametrosGenerales.msg =`Producto ${req.body.name} editado correctamente`;
        //busco el producto, pero no lo edito por ahora
        const idProducto = parseInt(req.params.id);
        const Productos = await dataProduct.load()
        const infoProducto = Productos.find(producto => producto.productId == idProducto);
        console.log(infoProducto);
        res.render('admin/editProduct',{
            'datos':parametrosGenerales,
            infoUsuario:(req.session.usuario)?req.session.usuario:'No hay Datos',
            infoProducto
        });
    },
    create: (req, res)=>{
        parametrosGenerales.msg =``;
        res.render('admin/listProduct',{
            'datos':parametrosGenerales,
            infoUsuario:(req.session.usuario)?req.session.usuario:'No hay Datos'
        });
    },
    register: (req, res)=>{
        parametrosGenerales.msg =``;
        res.render('admin/registerProduct',{
            'datos':parametrosGenerales,
            infoUsuario:(req.session.usuario)?req.session.usuario:'No hay Datos'
        });
    },
    registerProduct: (req, res)=>{
        parametrosGenerales.msg  =`Producto ${req.body.name} creado correctamente`;
       
        res.render('admin/registerProduct',{
            'datos':parametrosGenerales,
            infoUsuario:(req.session.usuario)?req.session.usuario:'No hay Datos'
        });
    }

}

module.exports = adminController;