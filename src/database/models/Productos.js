module.exports = (Sequelize, DataTypes) => {
    const Productos = Sequelize.define('Productos', {
        id_producto: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        imagen_principal: {
            type: DataTypes.STRING(255),
            allowNull: true
        },
        nombre_producto: {
            type: DataTypes.STRING(100),
            allowNull: true
        },
        descripcion: {
            type: DataTypes.STRING(255),
            allowNull: true
        },
        codigo: {
            type: DataTypes.STRING(45),
            allowNull: true
        },
        precio: {
            type: DataTypes.DECIMAL(10, 2),
            allowNull: true
        },
        id_categoria: {
            type: DataTypes.INTEGER,
            allowNull: true
        },
        precio_contado: {
            type: DataTypes.DECIMAL(10, 2),
            allowNull: true
        },
        precio_mercadopago: {
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
        tableName: 'productos',
        timestamps: true,
        createdAt: 'created_at', 
        updatedAt: 'updated_at'
    });

    Productos.associate = models => {
        Productos.belongsTo(models.Categorias, {
            as: 'categoria',
            foreignKey: 'id_categoria'
        });
        Productos.hasMany(models.Carritos, {
            as: 'carritos',
            foreignKey: 'id_usuario'
        });
        Productos.belongsToMany(models.imagenes, {
            as: 'imagenes',
            through: 'productos_imagenes',
            foreignKey: 'id_producto',
            otherKey: 'id_imagen'
        });
    };

    return Productos;
};
