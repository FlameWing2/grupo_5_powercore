module.exports = (Sequelize, DataTypes) => {
    const WeaponsTypes = Sequelize.define('WeaponsTypes', {
        id_weapon_type: {
            type: DataTypes.INTEGER,
            allowNull: false,
            autoIncrement: true,
            primaryKey: true
        },
        name: {
            type: DataTypes.STRING(45),
            allowNull: true,
            defaultValue: null
        }
    }, {
        tableName: 'weapons_types',
        timestamps: false // No hay campos created_at o updated_at
    });

    WeaponsTypes.associate = models => {
        WeaponsTypes.hasMany(models.Weapons, {
            as: 'weapons_types',
           foreignKey: 'weaponType',
       });
    };

    return WeaponsTypes;
};
