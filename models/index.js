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
db.socialNetworks = require("./social-network.model.js")(sequelize, Sequelize);
db.categories = require("./category.model.js")(sequelize, Sequelize);
db.subcategories = require("./subcategory.model.js")(sequelize, Sequelize);
db.contact = require("./contact.model.js")(sequelize, Sequelize);
db.products = require("./product.model.js")(sequelize, Sequelize);
db.clients = require("./client.model.js")(sequelize, Sequelize);
db.orders = require("./order.model.js")(sequelize, Sequelize);
db.orderDetails = require("./order-detail.model.js")(sequelize, Sequelize);
db.CategorySubcategoryRelations = require("./category-subcategory-relation.model.js")(sequelize, Sequelize);

module.exports = db;