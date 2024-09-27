module.exports = (Sequelize, DataTypes) => {
    const Weapons = Sequelize.define('Weapons', {
        item_id: {
            type: DataTypes.DECIMAL(11, 0),
            allowNull: false,
            defaultValue: 0,
            primaryKey: true
        },
        name: {
            type: DataTypes.STRING(70),
            allowNull: true,
            defaultValue: null,
            collate: 'latin1_swedish_ci'
        },
        bodypart: {
            type: DataTypes.STRING(15),
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
        weight: {
            type: DataTypes.DECIMAL(4, 0),
            allowNull: true,
            defaultValue: null
        },
        soulshots: {
            type: DataTypes.DECIMAL(2, 0),
            allowNull: true,
            defaultValue: null
        },
        spiritshots: {
            type: DataTypes.DECIMAL(1, 0),
            allowNull: true,
            defaultValue: null
        },
        crystal_type: {
            type: DataTypes.ENUM('none', 'd', 'c', 'b', 'a', 's'),
            allowNull: false,
            defaultValue: 'none',
            collate: 'latin1_swedish_ci'
        },
        p_dam: {
            type: DataTypes.DECIMAL(5, 0),
            allowNull: true,
            defaultValue: null
        },
        rnd_dam: {
            type: DataTypes.DECIMAL(2, 0),
            allowNull: true,
            defaultValue: null
        },
        weaponType: {
            type: DataTypes.STRING(8),
            allowNull: true,
            defaultValue: null,
            collate: 'latin1_swedish_ci'
        },
        critical: {
            type: DataTypes.DECIMAL(2, 0),
            allowNull: true,
            defaultValue: null
        },
        hit_modify: {
            type: DataTypes.DECIMAL(6, 5),
            allowNull: true,
            defaultValue: null
        },
        avoid_modify: {
            type: DataTypes.DECIMAL(2, 0),
            allowNull: true,
            defaultValue: null
        },
        shield_def: {
            type: DataTypes.DECIMAL(3, 0),
            allowNull: true,
            defaultValue: null
        },
        shield_def_rate: {
            type: DataTypes.DECIMAL(2, 0),
            allowNull: true,
            defaultValue: null
        },
        atk_speed: {
            type: DataTypes.DECIMAL(3, 0),
            allowNull: true,
            defaultValue: null
        },
        mp_consume: {
            type: DataTypes.DECIMAL(2, 0),
            allowNull: true,
            defaultValue: null
        },
        m_dam: {
            type: DataTypes.DECIMAL(3, 0),
            allowNull: true,
            defaultValue: null
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
        enchant4_skill_id: {
            type: DataTypes.DECIMAL(11, 0),
            allowNull: false,
            defaultValue: 0
        },
        enchant4_skill_lvl: {
            type: DataTypes.DECIMAL(11, 0),
            allowNull: false,
            defaultValue: 0
        },
        onCast_skill_id: {
            type: DataTypes.DECIMAL(11, 0),
            allowNull: false,
            defaultValue: 0
        },
        onCast_skill_lvl: {
            type: DataTypes.DECIMAL(11, 0),
            allowNull: false,
            defaultValue: 0
        },
        onCast_skill_chance: {
            type: DataTypes.DECIMAL(11, 0),
            allowNull: false,
            defaultValue: 0
        },
        onCrit_skill_id: {
            type: DataTypes.DECIMAL(11, 0),
            allowNull: false,
            defaultValue: 0
        },
        onCrit_skill_lvl: {
            type: DataTypes.DECIMAL(11, 0),
            allowNull: false,
            defaultValue: 0
        },
        onCrit_skill_chance: {
            type: DataTypes.DECIMAL(11, 0),
            allowNull: false,
            defaultValue: 0
        },
        image: {
            type: DataTypes.STRING(255),
            allowNull: true,
            defaultValue: null,
            collate: 'latin1_swedish_ci'
        }
    }, {
        tableName: 'weapon',
        timestamps: false,
        charset: 'latin1',
        collate: 'latin1_swedish_ci'
    });
    Weapons.associate = models => {
        Weapons.hasMany(models.Ofertas, {
             as: 'ofertas',
            foreignKey: 'item_id',
        });
     };

    return Weapons;
};
