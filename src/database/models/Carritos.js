module.exports = (Sequelize, DataTypes) => {
    const Carritos = Sequelize.define('Carritos', {
        id_carrito: {
            type: DataTypes.INTEGER,
            allowNull: false,
            autoIncrement: true,
            primaryKey: true
        },
        login: {
            type: DataTypes.STRING(45),
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
        tableName: 'carritos',
        timestamps: true, 
        createdAt: 'created_at',
        updatedAt: 'updated_at'
    });


    return Carritos;
};
