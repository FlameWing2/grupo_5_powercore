module.exports = (Sequelize, DataTypes) => {
    const Etcitem = Sequelize.define('Etcitem', {
        item_id: {
            type: DataTypes.DECIMAL(11, 0),
            allowNull: false,
            defaultValue: 0,
            primaryKey: true
        },
        name: {
            type: DataTypes.STRING(100),
            allowNull: true,
            defaultValue: null
        },
        crystallizable: {
            type: DataTypes.STRING(5),
            allowNull: true,
            defaultValue: null
        },
        item_type: {
            type: DataTypes.STRING(12),
            allowNull: true,
            defaultValue: null
        },
        weight: {
            type: DataTypes.DECIMAL(4, 0),
            allowNull: true,
            defaultValue: null
        },
        consume_type: {
            type: DataTypes.STRING(9),
            allowNull: true,
            defaultValue: null
        },
        crystal_type: {
            type: DataTypes.ENUM('none', 'd', 'c', 'b', 'a', 's'),
            allowNull: false,
            defaultValue: 'none'
        },
        duration: {
            type: DataTypes.DECIMAL(3, 0),
            allowNull: true,
            defaultValue: null
        },
        price: {
            type: DataTypes.DECIMAL(11, 0),
            allowNull: true,
            defaultValue: null
        },
        crystal_count: {
            type: DataTypes.INTEGER,
            allowNull: true,
            defaultValue: null
        },
        sellable: {
            type: DataTypes.STRING(5),
            allowNull: true,
            defaultValue: null
        },
        dropable: {
            type: DataTypes.STRING(5),
            allowNull: true,
            defaultValue: null
        },
        destroyable: {
            type: DataTypes.STRING(5),
            allowNull: true,
            defaultValue: null
        },
        tradeable: {
            type: DataTypes.STRING(5),
            allowNull: true,
            defaultValue: null
        },
        oldname: {
            type: DataTypes.STRING(100),
            allowNull: false,
            defaultValue: ''
        },
        oldtype: {
            type: DataTypes.STRING(100),
            allowNull: false,
            defaultValue: ''
        }
    }, {
        tableName: 'etcitem',
        timestamps: false, // No se incluye `created_at` ni `updated_at`
    });

    return Etcitem;
};
