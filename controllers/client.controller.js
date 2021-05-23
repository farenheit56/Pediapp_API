const db = require("../models");
const clients = db.clients;
const Op = db.Sequelize.Op;

exports.findAll = (req, res) => {
  clients.findAll({attributes: [`id`, `name`, `phone`, `address`]}).then(data => {
      res.send(data);
  }).catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema consultando los clientes"
      });
  })
};