const { Sequelize} = require('sequelize');
const sequelize = new Sequelize('sqlite::memory:');

module.exports = (sequelize, Sequelize) => {
  const CategorySubcategoryRelation = sequelize.define('relation_category_subcategory', {
    id: {
      type: Sequelize.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    name: {
      type: Sequelize.STRING,
      allowNull: false
    }
  },{
    freezeTableName: true
  })
  return CategorySubcategoryRelation
}
