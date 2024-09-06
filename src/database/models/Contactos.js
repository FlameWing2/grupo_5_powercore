module.exports = (Sequelize, DataTypes) => {
    const Contactos = Sequelize.define('Contactos', {
        idcontacto: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        apellido: {
            type: DataTypes.STRING(65),
            allowNull: true
        },
        nombre: {
            type: DataTypes.STRING(65),
            allowNull: true
        },
        email: {
            type: DataTypes.STRING(100),
            allowNull: true
        },
        id_area: {
            type: DataTypes.INTEGER,
            allowNull: true
        },
        consulta: {
            type: DataTypes.TEXT('long'),
            allowNull: true
        },
        created_at: {
            type: DataTypes.DATE,
            allowNull: true
        },
        updated_at: {
            type: DataTypes.DATE,
            allowNull: true
        },
        estado: {
            type: DataTypes.INTEGER,
            allowNull: true
        }
    }, {
        tableName: 'contactos',
        timestamps: true,
        createdAt: 'created_at', 
        updatedAt: 'updated_at'
    });

    Contactos.associate = models => {
        Contactos.belongsTo(models.Areas, {
            as: 'area',
            foreignKey: 'id_area'
        });
        Contactos.belongsTo(models.Estados, {
            as: 'estadoContacto',
            foreignKey: 'id_estado'
        });
    };

    return Contactos;
};
