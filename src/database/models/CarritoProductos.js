module.exports = (Sequelize, DataTypes) => {
    const CarritoProductos = Sequelize.define('CarritoProductos', {
        id_carrito_producto: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        id_carrito: {
            type: DataTypes.INTEGER,
            allowNull: true
        },
        id_producto: {
            type: DataTypes.INTEGER,
            allowNull: true
        },
        cantidad: {
            type: DataTypes.INTEGER,
            allowNull: true
        },
        precio_compra: {
            type: DataTypes.DECIMAL(10, 2),
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
        tableName: 'carrito_productos',
        timestamps: true,
        createdAt: 'created_at', 
        updatedAt: 'updated_at'
    });

    CarritoProductos.associate = models => {
        CarritoProductos.belongsTo(models.Carritos, {
            as: 'carrito',
            foreignKey: 'id_carrito'
        });
        CarritoProductos.belongsTo(models.Productos, {
            as: 'producto',
            foreignKey: 'id_producto'
        });
    };

    return CarritoProductos;
};
