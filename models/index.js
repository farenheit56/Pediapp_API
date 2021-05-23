const { Sequelize } = require('sequelize');
const dbCredentials = require('../db/dbCredentials');

const sequelize = new Sequelize(dbCredentials.databaseName, dbCredentials.user, dbCredentials.password, {
    host: dbCredentials.host,
    dialect: 'mysql'
  });

    sequelize.authenticate().then(() => {
        console.log('Conectado a DB');
    }).catch(() => {
        console.log('No se conectó a la DB :(');
    })

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.internalSections = require("./internal-section.model.js")(sequelize, Sequelize);

module.exports = db;    