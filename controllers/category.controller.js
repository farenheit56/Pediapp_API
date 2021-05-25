const db = require("../models");
const categories = db.categories;
const subcategories = db.subcategories
const Op = db.Sequelize.Op;

exports.findAll = (req, res) => {
  categories.findAll({attributes: [`id`, `name`], include: [{model: subcategories, through: { attributes: []}}]}).then(data => {
      res.send(data);
  }).catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema consultando las categorías"
      });
  })
};

exports.findWhereCategoryId = (req,res) => {
  categories.findAll({
    attributes: [`id`,`name`],
    include: [{model: subcategories, through: { attributes: []}}],
    where: {id: req.params.categoryId}})
  .then(data => {
    res.send(data);
}).catch(err => {
  res.status(500).send({
      message:
        err.message || "Hubo un problema consultando la categoría solicitada"
    });
})
};