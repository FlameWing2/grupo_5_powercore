module.exports = (Sequelize, DataTypes) => {
    const ModalidadPagos = Sequelize.define('ModalidadPagos', {
        id_modalidad_pago: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        descripcion: {
            type: DataTypes.STRING(65),
            allowNull: true
        },
        porcentaje: {
            type: DataTypes.INTEGER,
            allowNull: true
        },
        estado: {
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
        tableName: 'modalidad_pagos',
        timestamps: true,
        createdAt: 'created_at', 
        updatedAt: 'updated_at'
    });

    ModalidadPagos.associate = models => {
        ModalidadPagos.hasMany(models.Carritos, {
            as: 'carritos',
            foreignKey: 'id_modalidad_pago'
        });
        ModalidadPagos.belongsTo(models.Estados, {
            as: 'estado',
            foreignKey: 'id_estado'
        });
    };
    return ModalidadPagos;
};
