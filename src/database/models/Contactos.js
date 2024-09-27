module.exports = (Sequelize, DataTypes) => {
    const Contactos = Sequelize.define('Contactos', {
        id_contacto: {
            type: DataTypes.INTEGER,
            allowNull: false,
            autoIncrement: true,
            primaryKey: true
        },
        apenom: {
            type: DataTypes.STRING(75),
            allowNull: true,
            defaultValue: null
        },
        email: {
            type: DataTypes.STRING(75),
            allowNull: true,
            defaultValue: null
        },
        mensaje: {
            type: DataTypes.TEXT,
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
        },
        id_area: {
            type: DataTypes.INTEGER,
            allowNull: true,
            defaultValue: null
        }
    }, {
        tableName: 'contactos',
        timestamps: true,
        createdAt: 'created_at',
        updatedAt: 'updated_at'
    });

    // Asociaciones si las necesitas
    Contactos.associate = models => {
        Contactos.belongsTo(models.Areas, {
            as: 'area',
            foreignKey: 'id_area'
        });
    };

    return Contactos;
};
