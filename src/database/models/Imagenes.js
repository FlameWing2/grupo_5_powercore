module.exports = (Sequelize, DataTypes) => {
    const Imagenes = Sequelize.define('Imagenes', {
        id_imagen: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        descripcion: {
            type: DataTypes.STRING(255),
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
        tableName: 'imagenes',
        timestamps: true,
        createdAt: 'created_at', 
        updatedAt: 'updated_at'
    });

    Imagenes.associate = models => {
        Imagenes.belongsToMany(models.Productos, {
            as: 'productos',
            through: 'productos_imagenes',
            foreignKey: 'id_imagen',
            otherKey: 'id_producto'
        });
    };

    return Imagenes;
};
