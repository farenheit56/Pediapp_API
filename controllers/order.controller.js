const db = require("../models");
const orders = db.orders;
const Op = db.Sequelize.Op;

exports.findAll = (req, res) => {
  orders.findAll({attributes: [`id`, `ts`, `client_id`, `total_price`]}).then(data => {
      res.send(data);
  }).catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema consultando las órdenes"
      });
  })
};