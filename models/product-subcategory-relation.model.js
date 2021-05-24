const { Sequelize} = require('sequelize');
const sequelize = new Sequelize('sqlite::memory:');

module.exports = (sequelize, Sequelize) => {
  const ProductSubcategoryRelation = sequelize.define('relation_product_subcategory', {
    id: {
      type: Sequelize.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    product_id: {
      type: Sequelize.INTEGER,
      allowNull: false
    },
    subcategory_id: {
      type: Sequelize.INTEGER,
      allowNull: false
    }
  },{
    freezeTableName: true
  })
  return ProductSubcategoryRelation
}
