const { DataTypes } = require('sequelize');
const sequelize = require('../database/conexion'); // Asegúrate de importar tu instancia de Sequelize

const ProjectProposal = sequelize.define('ProjectProposal', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    title: {
        type: DataTypes.STRING(100),
        allowNull: false,
    },
    description: {
        type: DataTypes.TEXT,
        allowNull: false,
    },
    project_path: {
        type: DataTypes.STRING(255),
        allowNull: false,
    },
}, {
    // Deshabilita la creación automática de las columnas 'createdAt' y 'updatedAt'
    timestamps: false,
    tableName: 'proposal_projects',
});

module.exports = ProjectProposal;
