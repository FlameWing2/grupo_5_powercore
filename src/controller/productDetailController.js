// asi vamos a manejar las rutas src/controllers/indexController.js
//agrego la ruta para poder usar path
const path = require('path');
const archivo = require('node:fs');

//cargo los productos por ahora con json
const products = JSON.parse(archivo.readFileSync(path.resolve(__dirname, '../data/products.json'),"utf-8"));

let productDetailController = {
    show: (req, res)=>{
        //res.sendFile(path.resolve(__dirname, '../views/productDetail.html'));
        const datos={
            titulo: "PowerCore",
            pie: "&copy; 2024 PowerCore. Trabajo grupal N&deg; 5."
        }
        const idProduct = parseInt(req.params.idProduct);
        const product = products.find(product=>product.productId === idProduct);
        //console.log(product);
        res.render('products/productDetail',{'datos':datos,'product':product});
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
       
    }
}

module.exports = productDetailController;