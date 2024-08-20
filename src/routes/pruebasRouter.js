const express = require('express');
let router = express.Router();
let pruebasController = require('../controller/pruebasController');


router.get('/movies',pruebasController.listarPeliculas);
router.post('/movies',pruebasController.detallePorTitulo);
router.post('/findByString',pruebasController.detallePorString);

router.get('/movies/:id',pruebasController.detallePelicula);

module.exports = router;