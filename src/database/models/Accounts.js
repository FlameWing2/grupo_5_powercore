module.exports = (Sequelize, DataTypes) => {
    const Accounts = Sequelize.define('Accounts', {
        login: {
            type: DataTypes.STRING(45),
            allowNull: false,
            defaultValue: '',
            primaryKey: true
        },
        password: {
            type: DataTypes.STRING(45),
            allowNull: true,
            defaultValue: null
        },
        lastactive: {
            type: DataTypes.DECIMAL(20, 0),
            allowNull: true,
            defaultValue: null
        },
        access_level: {
            type: DataTypes.INTEGER,
            allowNull: true,
            defaultValue: null
        },
        lastIP: {
            type: DataTypes.STRING(20),
            allowNull: true,
            defaultValue: null
        },
        lastServer: {
            type: DataTypes.INTEGER,
            allowNull: true,
            defaultValue: 1
        },
        avatar: {
            type: DataTypes.STRING(255),
            allowNull: true,
            defaultValue: null
        },
        apellido: {
            type: DataTypes.STRING(60),
            allowNull: true,
            defaultValue: null
        },
        nombre: {
            type: DataTypes.STRING(60),
            allowNull: true,
            defaultValue: null
        },
        direccion: {
            type: DataTypes.STRING(255),
            allowNull: true,
            defaultValue: null
        },
        telefono: {
            type: DataTypes.STRING(60),
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
        }
    }, {
        tableName: 'accounts',
        timestamps: true, 
        createdAt: 'created_at',
        updatedAt: 'updated_at'
    });

    return Accounts;
};
