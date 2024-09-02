module.exports = (Sequelize, DataTypes) => {
    const Paises = Sequelize.define('Paises', {
        id_pais: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        abreviatura_pais: {
            type: DataTypes.STRING(255),
            allowNull: true
        },
        nombre_pais: {
            type: DataTypes.STRING(255),
            allowNull: true
        },
        iso_pais: {
            type: DataTypes.STRING(255),
            allowNull: true
        }
    }, {
        tableName: 'paises',
        timestamps: false
    });

    Paises.associate = models => {
        Paises.hasMany(models.Provincias, {
            as: 'provincias',
            foreignKey: 'id_pais'
        });
    };

    return Paises;
};
