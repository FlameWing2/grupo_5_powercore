module.exports = (Sequelize, DataTypes) => {
    const RelItemsCarritos = Sequelize.define('RelItemsCarritos', {
        id_items_carrito: {
            type: DataTypes.INTEGER,
            allowNull: false,
            autoIncrement: true,
            primaryKey: true
        },
        id_carrito: {
            type: DataTypes.INTEGER,
            allowNull: true,
            defaultValue: null
        },
        item_id: {
            type: DataTypes.INTEGER,
            allowNull: true,
            defaultValue: null
        },
        cantidad: {
            type: DataTypes.INTEGER,
            allowNull: true,
            defaultValue: null
        },
        total_adena: {
            type: DataTypes.INTEGER,
            allowNull: true,
            defaultValue: null
        },
        total_dinero: {
            type: DataTypes.DECIMAL(10, 2),
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
        tableName: 'rel_items_carritos',
        timestamps: true, 
        createdAt: 'created_at',
        updatedAt: 'updated_at'
    });

    // Definición de asociaciones
    // RelItemsCarritos.associate = models => {
    //     RelItemsCarritos.belongsTo(models.Etcitem, {
    //         as: 'item',
    //         foreignKey: 'item_id',
    //         targetKey: 'item_id'
    //     });
    //     RelItemsCarritos.belongsTo(models.Carritos, {
    //         as: 'carrito',
    //         foreignKey: 'id_carrito',
    //         targetKey: 'id_carrito'
    //     });
    // };

    return RelItemsCarritos;
};
