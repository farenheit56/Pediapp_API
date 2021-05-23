const db = require("../models");
const contact = db.contact;
const Op = db.Sequelize.Op;

exports.findAll = (req, res) => {
  contact.findAll({attributes: [`id`, `name`, `phone`, `address`]}).then(data => {
      res.send(data);
  }).catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema consultando los datos de contacto"
      });
  })
};