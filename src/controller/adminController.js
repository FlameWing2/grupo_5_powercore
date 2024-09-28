//cargamos lo necesario para usar las funciones de sequelize
const db = require('../database/models/index.js');
const bcrypt = require('bcrypt');
const bodyParser = require('body-parser');
const crypto = require('crypto');
const os = require('os');

const adminController = {
    formCrear:async (req,res)=>{
        const Bodyparts = await db.Bodyparts.findAll();
        const CrystalsTypes = await db.CrystalsTypes.findAll();
        const WeaponsTypes = await db.WeaponsTypes.findAll();
        console.log(Bodyparts)
        res.render('admin/crear_producto',{
            infoUsuario: req.session.usuario ? req.session.usuario : null,
            aviso:"",
            Bodyparts,
            CrystalsTypes,
            WeaponsTypes
        });
    },
    crearObjeto: async (req, res) => {
        try {
            const weapon = await db.Weapons.create(req.body);
            
            if (weapon) {
                // Esperar la resolución de las promesas usando async/await
                const Bodyparts = await db.Bodyparts.findAll();
                const CrystalsTypes = await db.CrystalsTypes.findAll();
                const WeaponsTypes = await db.WeaponsTypes.findAll();
    
                res.render('admin/crear_producto', {
                    infoUsuario: req.session.usuario ? req.session.usuario : null,
                    aviso: "OK",
                    Bodyparts,
                    CrystalsTypes,
                    WeaponsTypes
                });
            } else {
                res.render('admin/crear_producto', {
                    infoUsuario: req.session.usuario ? req.session.usuario : null,
                    aviso: "Error"
                });
            }
        } catch (error) {
            console.error("Error al crear el arma o al obtener datos relacionados: ", error);
            res.render('admin/crear_producto', {
                infoUsuario: req.session.usuario ? req.session.usuario : null,
                aviso: "Error"
            });
        }
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