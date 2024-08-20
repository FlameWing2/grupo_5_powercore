module.exports = (Sequelize, dataTypes) =>{
    let alias = "Peliculas";
    let cols = {
        id:{
            autoIncrement:true,
            primaryKey: true,
            type: dataTypes.INTEGER
        },
        title:{
            type: dataTypes.STRING
        },
        length:{
            type: dataTypes.INTEGER
        }
    };
    let config = {
        tableName: "movies",
        timestamps: false
    }
    const Pelicula = Sequelize.define("alias",cols,config);

    return Pelicula;
}