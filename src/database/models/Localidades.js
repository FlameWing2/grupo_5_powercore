module.exports = (Sequelize, DataTypes) => {
    const Localidades = Sequelize.define('Localidades', {
        id_localidad: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        localidad: {
            type: DataTypes.STRING(200),
            allowNull: true
        },
        id_departamento: {
            type: DataTypes.INTEGER,
            allowNull: true
        },
        codigo_postal: {
            type: DataTypes.STRING(45),
            allowNull: true
        }
    }, {
        tableName: 'localidades',
        timestamps: false
    });

    Localidades.associate = models => {
        Localidades.belongsTo(models.Departamentos, {
            as: 'departamento',
            foreignKey: 'id_departamento'
        });
        Localidades.hasMany(models.Usuarios, {
            as: 'usuarios',
            foreignKey: 'id_localidad'
        });
    };

    return Localidades;
};
