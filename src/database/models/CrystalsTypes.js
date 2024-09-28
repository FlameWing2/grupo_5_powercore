module.exports = (Sequelize, DataTypes) => {
    const CrystalsTypes = Sequelize.define('CrystalsTypes', {
        id_crystal_type: {
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
        tableName: 'crystals_types',
        timestamps: false // No hay campos created_at o updated_at
    });

    CrystalsTypes.associate = models => {
        CrystalsTypes.hasMany(models.Weapons, {
            as: 'crystals',
           foreignKey: 'crystal_type',
       });
    };

    return CrystalsTypes;
};
