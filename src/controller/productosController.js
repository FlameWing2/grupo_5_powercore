//cargamos lo necesario para usar las funciones de sequelize
const db = require('../database/models/index.js');
const bcrypt = require('bcrypt');
const crypto = require('crypto');
const os = require('os');

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
        const item_id = req.params.id;
    
        // Buscamos la oferta con el item_id proporcionado y su asociación
        db.Ofertas.findOne({
            where: {
                item_id: item_id
            },
            include: [{ association: "weapon" }]
        }).then(Oferta => {
            if (Oferta) {
                res.render('productos/producto_detalle', {
                    Oferta,
                    infoUsuario: req.session.usuario ? req.session.usuario : null,
                });
            } else {
                res.status(404).send('Oferta no encontrada');
            }
        }).catch(error => {
            res.status(500).send('Error en el servidor');
            console.error(error);
        });
    },

   

}

module.exports = productosController;