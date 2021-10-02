const { Sequelize} = require('sequelize');
const sequelize = new Sequelize('sqlite::memory:');

module.exports = (sequelize, Sequelize) => {
  const ProductImage = sequelize.define('product_images', {
    id: {
      type: Sequelize.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
    },
    image_url: {
      type: Sequelize.STRING,
      allowNull: false,
    },
  }, {
    timestamps: false
  })
  return ProductImage
}
