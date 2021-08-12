const { Sequelize} = require('sequelize');
const sequelize = new Sequelize('sqlite::memory:');

module.exports = (sequelize, Sequelize) => {
  const Category = sequelize.define('categories', {
    id: {
      type: Sequelize.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
    },
    name: {
      type: Sequelize.STRING,
      allowNull: false
    }
  },{
    timestamps: false
  })
  return Category
}
