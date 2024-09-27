//cargamos lo necesario para usar las funciones de sequelize
const db = require('../database/models/index.js');
const bcrypt = require('bcrypt');
const crypto = require('crypto');
const os = require('os');

const mainController = {
    index:(req,res)=>{
        db.Ofertas.findAll({
            include:[{association:"weapon"}]
        }).then(Ofertas=>{
            res.render('index',{
                Ofertas,
                infoUsuario: req.session.usuario ? req.session.usuario : null,
            });
        })
        
    },
    nosotros:(req,res)=>{
        res.render('quienes_somos',{
            infoUsuario: req.session.usuario ? req.session.usuario : null,
        });
    },
   

}

module.exports = mainController;