module.exports = (Sequelize, DataTypes) => {
    const Armor = Sequelize.define('Armor', {
        item_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            primaryKey: true,
            defaultValue: 0
        },
        name: {
            type: DataTypes.STRING(70),
            allowNull: true,
            defaultValue: null
        },
        bodypart: {
            type: DataTypes.STRING(15),
            allowNull: false,
            defaultValue: ''
        },
        crystallizable: {
            type: DataTypes.STRING(5),
            allowNull: false,
            defaultValue: ''
        },
        armor_type: {
            type: DataTypes.STRING(5),
            allowNull: false,
            defaultValue: ''
        },
        weight: {
            type: DataTypes.INTEGER,
            allowNull: false,
            defaultValue: 0
        },
        crystal_type: {
            type: DataTypes.ENUM('none', 'd', 'c', 'b', 'a', 's'),
            allowNull: false,
            defaultValue: 'none'
        },
        avoid_modify: {
            type: DataTypes.INTEGER,
            allowNull: false,
            defaultValue: 0
        },
        duration: {
            type: DataTypes.INTEGER,
            allowNull: false,
            defaultValue: 0
        },
        p_def: {
            type: DataTypes.INTEGER,
            allowNull: false,
            defaultValue: 0
        },
        m_def: {
            type: DataTypes.INTEGER,
            allowNull: false,
            defaultValue: 0
        },
        mp_bonus: {
            type: DataTypes.INTEGER,
            allowNull: false,
            defaultValue: 0
        },
        price: {
            type: DataTypes.INTEGER,
            allowNull: false,
            defaultValue: 0
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
        item_skill_id: {
            type: DataTypes.DECIMAL(11, 0),
            allowNull: false,
            defaultValue: 0
        },
        item_skill_lvl: {
            type: DataTypes.DECIMAL(11, 0),
            allowNull: false,
            defaultValue: 0
        },
        image: {
            type: DataTypes.STRING(255),
            allowNull: true,
            defaultValue: null
        }
    }, {
        tableName: 'armor',
        timestamps: false 
    });

    return Armor;
};
