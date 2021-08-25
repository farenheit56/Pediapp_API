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

db.Sequelize = Sequelize
db.sequelize = sequelize

db.internalSections = require("./internal-section.model.js")(sequelize, Sequelize)
db.socialNetworks = require("./social-network.model.js")(sequelize, Sequelize)
db.categories = require("./category.model.js")(sequelize, Sequelize)
db.subcategories = require("./subcategory.model.js")(sequelize, Sequelize)
db.contact = require("./contact.model.js")(sequelize, Sequelize)
db.products = require("./product.model.js")(sequelize, Sequelize)
db.clients = require("./client.model.js")(sequelize, Sequelize)
db.orders = require("./order.model.js")(sequelize, Sequelize)
db.orderDetails = require("./order-detail.model.js")(sequelize, Sequelize)
db.users = require("./user.model.js")(sequelize, Sequelize)

db.orders.hasMany(db.orderDetails)
db.orderDetails.belongsTo(db.orders)

db.products.hasMany(db.orderDetails)
db.orderDetails.belongsTo(db.products)

db.clients.hasMany(db.orders)
db.orders.belongsTo(db.clients)

db.products.belongsToMany(db.subcategories, {through: 'relation_product_subcategory'})
db.subcategories.belongsToMany(db.products, {through: 'relation_product_subcategory'})

db.products.belongsToMany(db.categories, {through: 'relation_product_category'})
db.categories.belongsToMany(db.products, {through: 'relation_product_category'})

db.categories.belongsToMany(db.subcategories, {through: 'relation_category_subcategory'})
db.subcategories.belongsToMany(db.categories, {through: 'relation_category_subcategory'})

//sequelize.sync({alter:true}) //->Fuerza la modificación de todas las tablas. Descomentar si se modificó algun modelo o relación para que impacte en la DB

module.exports = db;