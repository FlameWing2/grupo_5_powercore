const { error } = require('node:console');
const fs = require('node:fs/promises');
const path = require('node:path');

const datasource = {
    filePath: path.resolve(__dirname, "../data/contacts.json"),

  async load() {
    const jsonMovies = await fs.readFile(this.filePath, "");
    const movies = JSON.parse(jsonMovies);
    return movies;
  },
  async save(data) {
    const jsonData = JSON.stringify(data, null, 2);
    await fs.writeFile(this.filePath, jsonData, "utf-8",(error)=>{
      console.log("error");
    });
  }
}

module.exports = datasource;