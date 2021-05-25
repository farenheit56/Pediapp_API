const db = require("../models");
const orderDetails = db.orderDetails;
const orders = db.orders;
const products = db.products;
const Op = db.Sequelize.Op;

exports.findAll = (req, res) => {
  orderDetails.findAll({attributes: [`id`, `amount`], include: [orders, products]}).then(data => {
      res.send(data);
  }).catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema consultando los detalles de las ordenes"
      });
  })
};