module.exports = (Sequelize, dataTypes) =>{
    let alias = "Genres";
    let cols = {
        id:{
            autoIncrement:true,
            primaryKey: true,
            type: dataTypes.INTEGER
        },
        name:{
            type: dataTypes.STRING
        },
        ranking:{
            type: dataTypes.INTEGER
        },
        active:{
            type: dataTypes.INTEGER
        }
    };
    let config = {
        tableName: "genres",
        timestamps: true,
        createdAt: 'created_at', 
        updatedAt: 'updated_at' 
    }
    const Genres = Sequelize.define(alias,cols,config);

    return Genres;
}