module.exports = (Sequelize, DataTypes) => {
    const ProductosImagenes = Sequelize.define('ProductosImagenes', {
        id_producto_imagen: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        id_producto: {
            type: DataTypes.INTEGER,
            allowNull: true
        },
        id_imagen: {
            type: DataTypes.INTEGER,
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
        tableName: 'productos_imagenes',
        timestamps: true,
        createdAt: 'created_at', 
        updatedAt: 'updated_at'
    });

    return ProductosImagenes;
};
