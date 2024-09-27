module.exports = (Sequelize, DataTypes) => {
    const Ofertas = Sequelize.define('Ofertas', {
        id_oferta: {
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
        item_id: {
            type: DataTypes.INTEGER,
            allowNull: true,
            defaultValue: null
        },
        cantidad_adena: {
            type: DataTypes.INTEGER,
            allowNull: true,
            defaultValue: null
        },
        cantidad_dinero: {
            type: DataTypes.DECIMAL(10, 2),
            allowNull: true,
            defaultValue: null
        },
        fecha_inicio: {
            type: DataTypes.DATE,
            allowNull: true,
            defaultValue: null
        },
        fecha_hasta: {
            type: DataTypes.DATE,
            allowNull: true,
            defaultValue: null
        },
        estado: {
            type: DataTypes.INTEGER,
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
        tableName: 'ofertas',
        timestamps: true, // Sequelize gestionará createdAt y updatedAt
        createdAt: 'created_at',
        updatedAt: 'updated_at'
    });

    // Definición de asociaciones, si aplica
    Ofertas.associate = models => {
        Ofertas.belongsTo(models.Accounts, {
            as: 'account',
            foreignKey: 'login',
            targetKey: 'login'
        });
        Ofertas.belongsTo(models.Etcitem, {
            as: 'item',
            foreignKey: 'item_id',
            targetKey: 'item_id'
        });
    };

    return Ofertas;
};
