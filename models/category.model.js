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
    },
    path: {
      type: Sequelize.STRING,
      allowNull: false
    },
    order_id: {
      type: Sequelize.INTEGER,
    }
  },
  {
    timestamps: false
  }
  )
  return Category
}
