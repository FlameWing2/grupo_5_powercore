// asi vamos a manejar las rutas src/controllers/indexController.js
//agrego la ruta para poder usar path
const path = require('path');
const archivo = require('node:fs');
//cargo los productos por ahora con json
//const products = JSON.parse(archivo.readFileSync(path.resolve(__dirname, '../data/products.json'),"utf-8"));
const products = require('../data/products.json');
let productCartController = {
    //para productCart
    showCart: (req, res)=>{
       // res.sendFile(path.resolve(__dirname, '../views/productCart.html'));
       const datos={
        titulo: "PowerCore",
        pie: "&copy; 2024 PowerCore. Trabajo grupal N&deg; 5."
    }
       res.render('products/productCart',{
        'datos':datos,
        infoUsuario:(req.session.usuario)?req.session.usuario:'No hay Datos'
    });
      
    },
    //para productDetails
    showDetails: (req, res)=>{
        //res.sendFile(path.resolve(__dirname, '../views/productDetail.html'));
        const datos={
            titulo: "PowerCore",
            pie: "&copy; 2024 PowerCore. Trabajo grupal N&deg; 5."
        }
        const idProduct = parseInt(req.params.idproduct);
        const product = products.find(product=>product.productId === idProduct);
        //console.log(product);
        res.render('products/productDetail',{
            'datos':datos,
            'product':product,
            infoUsuario:(req.session.usuario)?req.session.usuario:'No hay Datos'
        });
    },
    detalleArticulo: (req, res)=>{
        const idArticulo = req.params.idArticulo;
        res.send("mostrando datos o pagina del articulo "+ idArticulo);
    },
    comentariosArticulo: (req, res)=>{
        const idArticulo = req.params.idArticulo;
        
        if(req.params.idComentario == undefined){
            res.send("Mostrando los comentarios del articulo "+ idArticulo);
        }else{
            res.send("Mostrando los comentarios del articulo "+ idArticulo + " y enfocados en el comentario numero: " + req.params.idComentario);
        }
       
    },
    createProduct: (req, res)=>{
        //tomamos todo lo del body con req.body.XXX
        //validamos para ver si los campos estan completos
        //aplicamos middleware
        res.redirect('/');
    },
    updateProduct: (req, res)=>{
        //tomamos todo lo del body con req.body.XXX
        //validamos para ver si los campos estan completos
        //aplicamos middleware
        res.redirect('/');
    },
}

module.exports = productCartController;