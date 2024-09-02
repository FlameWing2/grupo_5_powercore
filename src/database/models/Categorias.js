module.exports = (Sequelize, DataTypes) => {
    const Categorias = Sequelize.define('Categorias', {
        id_categoria: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        descripcion: {
            type: DataTypes.STRING(75),
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
        tableName: 'categorias',
        timestamps: true,
        createdAt: 'created_at', 
        updatedAt: 'updated_at'
    });

    Categorias.associate = models => {
        Categorias.hasMany(models.Productos, {
            as: 'productos',
            foreignKey: 'id_categoria'
        });
    };

    return Categorias;
};
