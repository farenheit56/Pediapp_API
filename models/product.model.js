const { Sequelize} = require('sequelize');
const sequelize = new Sequelize('sqlite::memory:');

module.exports = (sequelize, Sequelize) => {
  const Product = sequelize.define('products', {
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
    price: {
      type: Sequelize.DOUBLE,
      allowNull: false
    },
    description: {
      type: Sequelize.STRING,
      allowNull: false
    },
    image_url: {
      type: Sequelize.STRING,
    }, 
    order: {
      type: Sequelize.INTEGER,
    }
  }, {
    timestamps: false
  })
  return Product
}
