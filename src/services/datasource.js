/**
 * datasource me sirve como servicio, me brinda metodos para el manejo de archivos
 */
const fs = require('node:fs/promises');
const path = require('node:path');

class Datasource {
    constructor(filePath){
        this.filePath = filePath;
    }
    async load(){
        const infoArchivo = await fs.readFile(this.filePath,"utf-8")
        return infoArchivo;
    }
   
}


module.exports = Datasource;