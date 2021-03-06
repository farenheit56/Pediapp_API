const { Sequelize} = require('sequelize');
const sequelize = new Sequelize('sqlite::memory:');

module.exports = (sequelize, Sequelize) => {
  const SocialNetwork = sequelize.define('social_networks', {
    id: {
      type: Sequelize.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    name: {
      type: Sequelize.STRING,
      allowNull: false
    },
    url: {
        type: Sequelize.STRING,
        allowNull: false
    },
    icon_url: {
        type:Sequelize.STRING
    }
  }, {
    timestamps: false
  })
  return SocialNetwork
}
