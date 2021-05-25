const db = require("../models");
const orders = db.orders;
const clients = db.clients;
const orderDetails = db.orderDetails;
const products = db.products
const Op = db.Sequelize.Op;

exports.findAll = (req, res) => {
  orders.findAll({attributes: [`id`, `ts`, `total_price`], include: [clients,{model:orderDetails, attributes: [`productId`], include: {model: products}}]}).then(data => {
      res.send(data);
  }).catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema consultando las órdenes"
      });
  })
};