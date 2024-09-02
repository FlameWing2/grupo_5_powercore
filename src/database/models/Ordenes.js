module.exports = (Sequelize, DataTypes) => {
    const Ordenes = Sequelize.define('Ordenes', {
        id_orden: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        id_usuario: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        id_carrito: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        id_estado: {
            type: DataTypes.INTEGER,
            allowNull: false
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
        tableName: 'ordenes',
        timestamps: true,
        createdAt: 'created_at', 
        updatedAt: 'updated_at'
    });

    Ordenes.associate = models => {
        Ordenes.belongsTo(models.Productos, {
            as: 'usuario',
            foreignKey: 'id_usuario'
        });
        Ordenes.belongsTo(models.Carritos, {
            as: 'carritos',
            foreignKey: 'id_carrito'
        });
    };

    return Ordenes;
};
