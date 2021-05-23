const db = require("../models");
const categories = db.categories;
const Op = db.Sequelize.Op;

exports.findAll = (req, res) => {
  categories.findAll({attributes: [`id`, `name`]}).then(data => {
      res.send(data);
  }).catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema consultando las categorías"
      });
  })
};