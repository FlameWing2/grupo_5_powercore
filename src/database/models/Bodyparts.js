module.exports = (Sequelize, DataTypes) => {
    const Bodyparts = Sequelize.define('Bodyparts', {
        id_bodypart: {
            type: DataTypes.INTEGER,
            allowNull: false,
            autoIncrement: true,
            primaryKey: true
        },
        name: {
            type: DataTypes.STRING(45),
            allowNull: true,
            defaultValue: null,
            charset: 'utf8mb4',
            collate: 'utf8mb4_unicode_ci'
        }
    }, {
        tableName: 'bodyparts',
        timestamps: false
    });

    Bodyparts.associate = models => {
        Bodyparts.hasMany(models.Weapons, {
            as: 'weaponsBody',
           foreignKey: 'bodypart',
       });
    };
   
    return Bodyparts;
};
