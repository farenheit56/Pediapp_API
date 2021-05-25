const { Sequelize} = require('sequelize');
const sequelize = new Sequelize('sqlite::memory:');

module.exports = (sequelize, Sequelize) => {
  const Contact = sequelize.define('contact', {
    id: {
      type: Sequelize.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    name: {
      type: Sequelize.STRING,
      allowNull: false
    },
    phone: {
      type: Sequelize.INTEGER,
    },
    address: {
      type: Sequelize.STRING,
    }
  }, {
    freezeTableName: true,
    timestamps: false
  })
  return Contact
}
