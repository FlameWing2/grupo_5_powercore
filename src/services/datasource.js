/**
 * datasource me sirve como servicio, me brinda metodos para el manejo de archivos
 */
const fs = require('node:fs/promises');
const path = require('node:path');

const datasource = {
    filePath: "",
    agregarURL: function(ruta) {
        this.filePath = ruta;
    },
   load: async function(){
        const infoArchivo = await fs.readFile(this.filePath,"utf-8")
        return infoArchivo;
    }
};


module.exports = datasource;