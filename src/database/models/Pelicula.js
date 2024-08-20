module.exports = (Sequelize, dataTypes) =>{
    let alias = "Pelicula";
    let cols = {
        id:{
            autoIncrement:true,
            primaryKey: true,
            type: dataTypes.INTEGER
        },
        title:{
            type: dataTypes.STRING
        },
        awards:{
            type: dataTypes.INTEGER
        }
    };
    let config = {
        tableName: "movies",
        timestamps: true,
        createdAt: 'created_at', 
        updatedAt: 'updated_at' 
    }
    const Pelicula = Sequelize.define(alias,cols,config);

    return Pelicula;
}