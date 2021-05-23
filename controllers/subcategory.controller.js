const db = require("../models");
const subcategories = db.subcategories;
const Op = db.Sequelize.Op;

exports.findAll = (req, res) => {
  subcategories.findAll({attributes: [`id`, `name`]}).then(data => {
      res.send(data);
  }).catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema consultando las subcategorías"
      });
  })
};