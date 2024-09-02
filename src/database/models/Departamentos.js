module.exports = (Sequelize, DataTypes) => {
    const Departamentos = Sequelize.define('Departamentos', {
        id_departamento: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        nombre_departamento: {
            type: DataTypes.STRING(50),
            allowNull: true
        },
        id_provincia: {
            type: DataTypes.INTEGER,
            allowNull: true
        },
        zona: {
            type: DataTypes.STRING(255),
            allowNull: true
        }
    }, {
        tableName: 'departamentos',
        timestamps: false
    });

    Departamentos.associate = models => {
        Departamentos.belongsTo(models.Provincias, {
            as: 'provincia',
            foreignKey: 'id_provincia'
        });
        Departamentos.hasMany(models.Localidades, {
            as: 'localidades',
            foreignKey: 'id_departamento'
        });
    };

    return Departamentos;
};
