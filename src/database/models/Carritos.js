module.exports = (Sequelize, DataTypes) => {
    const Carritos = Sequelize.define('Carritos', {
        id_carrito: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        id_usuario: {
            type: DataTypes.INTEGER,
            allowNull: true
        },
        estado: {
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
        tableName: 'carritos',
        timestamps: true,
        createdAt: 'created_at', 
        updatedAt: 'updated_at'
    });

    Carritos.associate = models => {
        Carritos.belongsTo(models.Usuarios, {
            as: 'usuario',
            foreignKey: 'id_usuario'
        });
        Carritos.belongsTo(models.Estados, {
            as: 'estadoCarrito',
            foreignKey: 'id_estado'
        });
        Carritos.hasMany(models.CarritoProductos, {
            as: 'carritos',
            foreignKey: 'id_carrito'
        });
        Carritos.hasMany(models.Ordenes, {
            as: 'ordenes',
            foreignKey: 'id_carrito'
        });
    };

    return Carritos;
};
