//cargamos lo necesario para usar las funciones de sequelize
const db = require('../database/models/index.js');
const bcrypt = require('bcrypt');
const bodyParser = require('body-parser');
const crypto = require('crypto');
const os = require('os');

const adminController = {
    formCrear:async (req,res)=>{
        const Bodyparts = await db.Bodyparts.findAll();
        console.log(Bodyparts)
        res.render('admin/crear_producto',{
            infoUsuario: req.session.usuario ? req.session.usuario : null,
            aviso:"",
            Bodyparts
        });
    },
    crearObjeto:(req,res)=>{
        //res.json(req.body)
        db.Weapons.create(req.body)
        .then(weapon => {
            if (weapon) {
                res.render('admin/crear_objeto', {
                    weapon,
                    infoUsuario: req.session.usuario ? req.session.usuario : null,
                    aviso:"OK"
                });
            } else {
                res.render('admin/crear_objeto', {
                    weapon,
                    infoUsuario: req.session.usuario ? req.session.usuario : null,
                    aviso:"Error"
                });
            }
        }).catch(error => {
            res.render('admin/crear_objeto', {
                weapon,
                infoUsuario: req.session.usuario ? req.session.usuario : null,
                aviso:"Error"
            });
        });
    },
    formEditar:(req,res)=>{
        const item_id = req.params.id;
    
        // Buscamos la oferta con el item_id proporcionado y su asociación
        db.Weapons.findByPk(item_id)
        .then(weapon => {
            if (weapon) {
                res.render('admin/editar_producto', {
                    weapon,
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
    eliminar:(req,res)=>{
        res.render('admin/crear_producto',{
            infoUsuario: req.session.usuario ? req.session.usuario : null,
        });
    },

   

}

module.exports = adminController;