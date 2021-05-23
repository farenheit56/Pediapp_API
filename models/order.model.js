const { Sequelize} = require('sequelize');
const sequelize = new Sequelize('sqlite::memory:');

module.exports = (sequelize, Sequelize) => {
  const Order = sequelize.define('orders', {
    id: {
      type: Sequelize.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    ts: {
      type: Sequelize.DATE,
      allowNull: false
    },
    client_id: {
      type: Sequelize.INTEGER,
      allowNull: false
    },
    total_price: {
      type: Sequelize.DOUBLE,
    }
  })
  return Order
}
