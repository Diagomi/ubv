const Course = require('./carrera');
const Book = require('./libro');
const BookProposal = require('./libroPropuesto');
const CourseProposal = require('./carreraPropuesta');

Course.hasMany(Book, { foreignKey: 'id_course' });
Book.belongsTo(Course, { foreignKey: 'id_course' });

Course.hasMany(BookProposal, { foreignKey: 'id_course' });
BookProposal.belongsTo(Course, { foreignKey: 'id_course' });

module.exports = { Course, Book, BookProposal };