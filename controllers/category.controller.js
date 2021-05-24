const db = require("../models");
const categories = db.categories;
const categorySubcategoryRelations = db.categorySubcategoryRelations
const Op = db.Sequelize.Op;

exports.findAll = (req, res) => {
  categories.findAll({attributes: [`id`, `name`], include: [{model: categorySubcategoryRelations, attributes: [`id`, `category_id`, `subcategory_id`]}]}).then(data => {
      res.send(data);
  }).catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema consultando las categorías"
      });
  })
};