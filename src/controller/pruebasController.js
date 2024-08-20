
const path = require('path');
const parametrosGenerales = require('../config/parametros.js');
let db = require('../database/models/index.js');
const Pelicula = require('../database/models/Pelicula.js');
const Genres = require('../database/models/Genres.js');
const {Op} = require('sequelize');  //uso de operadores

let pruebasController = {
    listarPeliculas: async (req, res)=>{
        parametrosGenerales.msg ="";

        db.Pelicula.findAll({
            order: [
                ['id', 'ASC']
            ],
            limit:5,    //limito a 5
            offset:10    //que comience en 10+
        })
            .then(function(movies) {
                res.render('test/movies', {
                    'datos': parametrosGenerales,
                    movies
                });
            })
            .catch(error => {
                console.log(error);
            });
        
    },
    detallePelicula: async (req, res)=>{
        parametrosGenerales.msg ="";
        let idPelicula = req.params.id;
        db.Pelicula.findByPk(idPelicula)   //findByPk
            .then(function(movie) {
                res.render('test/detalleMovie', {
                    'datos': parametrosGenerales,
                    movie
                });
            })
            .catch(error => {
                console.log(error);
            });
        
    },
    detallePorTitulo: async (req, res)=>{
        parametrosGenerales.msg ="";
        let tituloPelicula = req.body.title;
        db.Pelicula.findOne({
                where:{
                    title: tituloPelicula
                }
            })   
            .then(function(movie) {
                res.render('test/detalleMovie', {
                    'datos': parametrosGenerales,
                    movie
                });
            })
            .catch(error => {
                console.log(error);
            });
        
    },
    detallePorString: async (req, res)=>{
        parametrosGenerales.msg ="";
        let tituloPelicula = req.body.title;
        console.log(tituloPelicula);
        db.Pelicula.findAll({
                where:{
                    title: {
                        [db.Sequelize.Op.like]: '%'+tituloPelicula+'%',
                    }
                }
            })   
            .then(function(movies) {
                res.render('test/detalleMovie2', {
                    'datos': parametrosGenerales,
                    movies
                });
            })
            .catch(error => {
                console.log(error);
            });
        
    },


}

module.exports = pruebasController;