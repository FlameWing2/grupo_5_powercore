module.exports = (Sequelize, DataTypes) => {
    const Roles = Sequelize.define('Roles', {
        idrole: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        descripcion: {
            type: DataTypes.STRING(65),
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
        tableName: 'roles',
        timestamps: true,
        createdAt: 'created_at', 
        updatedAt: 'updated_at'
    });

    Roles.associate = models => {
        Roles.hasMany(models.Usuarios, {
            as: 'usuarios',
            foreignKey: 'id_rol'
        });
    };

    return Roles;
};
