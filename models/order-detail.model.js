const { Sequelize} = require('sequelize');
const sequelize = new Sequelize('sqlite::memory:');

module.exports = (sequelize, Sequelize) => {
  const OrderDetail = sequelize.define('order_details', {
    id: {
      type: Sequelize.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    amount: {
      type: Sequelize.INTEGER,
      allowNull: false,
    },
  }, {
    timestamps: false
  })
  return OrderDetail
}
