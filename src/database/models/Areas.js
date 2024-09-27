module.exports = (Sequelize, DataTypes) => {
    const Areas = Sequelize.define('Areas', {
        idarea: {
            type: DataTypes.INTEGER,
            allowNull: false,
            autoIncrement: true,
            primaryKey: true
        },
        nombre_area: {
            type: DataTypes.STRING(75),
            allowNull: true,
            defaultValue: null
        },
        created_at: {
            type: DataTypes.DATE,
            allowNull: true,
            defaultValue: null
        },
        updated_at: {
            type: DataTypes.DATE,
            allowNull: true,
            defaultValue: null
        }
    }, {
        tableName: 'areas',
        timestamps: true, // Sequelize manejará createdAt y updatedAt
        createdAt: 'created_at',
        updatedAt: 'updated_at'
    });

    Areas.associate = models => {
        Areas.hasMany(models.Contactos, {
            as: 'contactos',
            foreignKey: 'id_area'
        });
    };

    return Areas;
};
