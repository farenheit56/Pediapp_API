const { Sequelize} = require('sequelize');
const sequelize = new Sequelize('sqlite::memory:');

module.exports = (sequelize, Sequelize) => {
  const Home = sequelize.define('home', {
    id: {
      type: Sequelize.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    title: {
      type: Sequelize.STRING,
      allowNull: false
    },
    slider_url: {
      type: Sequelize.STRING,
    },
    description: {
      type: Sequelize.STRING
    },
    support_image_url: {
      type:Sequelize.STRING
    },
    banner_image_1_url: {
      type:Sequelize.STRING
    },
    banner_image_2_url: {
      type:Sequelize.STRING
    },
    path: {
      type: Sequelize.STRING,
      allowNull: false
    },
    component_name: {
      type: Sequelize.STRING,
      allowNull: false
    },
  }, {
    freezeTableName: true,
    timestamps: false
  })
  return Home
}
