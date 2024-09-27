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
        }
    }, {
        tableName: 'accounts',
        timestamps: false, // As this table does not seem to have `created_at` or `updated_at` columns
    });

    return Accounts;
};
