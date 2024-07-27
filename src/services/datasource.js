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
        return JSON.parse(infoArchivo);
    }
    async save(data){
        const jsonData = JSON.stringify(data, null, 2);
        await fs.writeFile(this.filePath,jsonData,"utf-8");
        return 1;
    }
   
}


module.exports = Datasource;