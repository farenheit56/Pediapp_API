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

exports.addCategory = (req,res) => {

  let new_category = {
    name: req.body.name, 
  }

  categories.create(new_category)
  .then(data => {
    res.send(data);
  }).catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema agregando la categoría"
      });
  })
}

exports.deleteCategory = (req, res) => {
  categories.destroy({
    where: {id: req.params.categoryId}})
  .catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema borrando la categoría"
      });
  })
}

exports.editCategory = (req,res) => {

  let edited_category = {
    name: req.body.name, 
  }

  categories.update(edited_category,
    {where: {id: req.params.categoryId}})
    .then(() => {return categories.findByPk(req.params.categoryId)})
    .then(data => {
      res.send(data);
    }).catch(err => {
      res.status(500).send({
          message:
            err.message || "Hubo un problema editando la categoría"
        });
    })
}