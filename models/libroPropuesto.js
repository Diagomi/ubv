const { DataTypes } = require('sequelize');
const sequelize = require('../database/conexion'); // Asegúrate de importar tu instancia de Sequelize


const BookProposal = sequelize.define('BookProposal', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    title: {
        type: DataTypes.STRING(100),
        allowNull: false,
    },
    book_path: {
        type: DataTypes.STRING(255),
        allowNull: false,
    },
    image_path: {
        type: DataTypes.STRING(255),
        allowNull: false,
    },
    id_course: {
        type: DataTypes.INTEGER,
        allowNull: false,
    },
}, {
    // Deshabilita la creación automática de las columnas 'createdAt' y 'updatedAt'
    timestamps: false,
    tableName: 'proposal_books',
});

module.exports = BookProposal;
