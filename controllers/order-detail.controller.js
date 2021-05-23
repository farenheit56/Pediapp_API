const db = require("../models");
const orderDetails = db.orderDetails;
const Op = db.Sequelize.Op;

exports.findAll = (req, res) => {
  orderDetails.findAll({attributes: [`id`, `order_id`, `product_id`, `amount`]}).then(data => {
      res.send(data);
  }).catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema consultando los detalles de las ordenes"
      });
  })
};