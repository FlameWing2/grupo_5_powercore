module.exports = (Sequelize, DataTypes) => {
    const Estados = Sequelize.define('Estados', {
        id_estado: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        nombre_estado: {
            type: DataTypes.STRING(45),
            allowNull: true
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
        tableName: 'estados',
        timestamps: false
    });

    Estados.associate = models => {
        Estados.hasMany(models.Usuarios, {
            as: 'usuarios',
            foreignKey: 'id_estado'
        });
        Estados.hasMany(models.Contactos, {
            as: 'contactos',
            foreignKey: 'id_estado'
        });
    };
    return Estados;
};
