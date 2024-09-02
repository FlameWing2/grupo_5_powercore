module.exports = (Sequelize, DataTypes) => {
    const Logs = Sequelize.define('Logs', {
        idlog: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        id_usuario: {
            type: DataTypes.INTEGER,
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
        tableName: 'logs',
        timestamps: true,
        createdAt: 'created_at', 
        updatedAt: 'updated_at'
    });

    Logs.associate = models => {
        Logs.belongsTo(models.Usuarios, {
            as: 'usuario',
            foreignKey: 'id_usuario'
        });
    };

    return Logs;
};
