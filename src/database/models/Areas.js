module.exports = (Sequelize, DataTypes) => {
    const Areas = Sequelize.define('Areas', {
        idarea: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        nombre_area: {
            type: DataTypes.STRING(45),
            allowNull: true
        },
        created_at: {
            type: DataTypes.DATE,
            allowNull: true
        },
        updated_at: {
            type: DataTypes.DATE,
            allowNull: true
        }
    }, {
        tableName: 'areas',
        timestamps: false
    });

    Areas.associate = models => {
        Areas.hasMany(models.Usuarios, {
            as: 'contactos',
            foreignKey: 'id_area'
        });
    };
    return Areas;
};
