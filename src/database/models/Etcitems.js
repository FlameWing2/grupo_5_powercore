module.exports = (Sequelize, DataTypes) => {
    const EtcItems = Sequelize.define('EtcItems', {
        item_id: {
            type: DataTypes.DECIMAL(11, 0),
            allowNull: false,
            defaultValue: 0,
            primaryKey: true
        },
        name: {
            type: DataTypes.STRING(100),
            allowNull: true,
            defaultValue: null,
            collate: 'latin1_swedish_ci'
        },
        crystallizable: {
            type: DataTypes.STRING(5),
            allowNull: true,
            defaultValue: null,
            collate: 'latin1_swedish_ci'
        },
        item_type: {
            type: DataTypes.STRING(12),
            allowNull: true,
            defaultValue: null,
            collate: 'latin1_swedish_ci'
        },
        weight: {
            type: DataTypes.DECIMAL(4, 0),
            allowNull: true,
            defaultValue: null
        },
        consume_type: {
            type: DataTypes.STRING(9),
            allowNull: true,
            defaultValue: null,
            collate: 'latin1_swedish_ci'
        },
        crystal_type: {
            type: DataTypes.ENUM('none', 'd', 'c', 'b', 'a', 's'),
            allowNull: false,
            defaultValue: 'none',
            collate: 'latin1_swedish_ci'
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
            defaultValue: null,
            collate: 'latin1_swedish_ci'
        },
        dropable: {
            type: DataTypes.STRING(5),
            allowNull: true,
            defaultValue: null,
            collate: 'latin1_swedish_ci'
        },
        destroyable: {
            type: DataTypes.STRING(5),
            allowNull: true,
            defaultValue: null,
            collate: 'latin1_swedish_ci'
        },
        tradeable: {
            type: DataTypes.STRING(5),
            allowNull: true,
            defaultValue: null,
            collate: 'latin1_swedish_ci'
        },
        oldname: {
            type: DataTypes.STRING(100),
            allowNull: false,
            defaultValue: '',
            collate: 'latin1_swedish_ci'
        },
        oldtype: {
            type: DataTypes.STRING(100),
            allowNull: false,
            defaultValue: '',
            collate: 'latin1_swedish_ci'
        },
        image: {
            type: DataTypes.STRING(255),
            allowNull: true,
            defaultValue: null,
            collate: 'latin1_swedish_ci'
        }
    }, {
        tableName: 'etcitem',
        timestamps: false, 
        charset: 'latin1',
        collate: 'latin1_swedish_ci'
    });

    return EtcItems;
};
