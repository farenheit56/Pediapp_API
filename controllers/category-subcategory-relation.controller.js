const db = require("../models");
const categorySubcategoryRelations = db.CategorySubcategoryRelations;
const Op = db.Sequelize.Op;

exports.findAll = (req, res) => {
  categorySubcategoryRelations.findAll({attributes: [`id`, `category_id`, `subcategory_id`]}).then(data => {
      res.send(data);
  }).catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema consultando las relaciones entre categorías y subcategorías"
      });
  })
};