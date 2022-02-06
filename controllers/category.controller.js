const { Sequelize } = require("../models");
const db = require("../models");
const categories = db.categories;
const subcategories = db.subcategories
const Op = db.Sequelize.Op;

exports.findAll = (req, res) => {
  categories.findAll({
    attributes: [`id`, `name`, `path`,`order_id`], 
    include: [{model: subcategories, through: { attributes: []}}], 
    order: ['order_id']
  })
    .then(data => {
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
    attributes: [`id`,`name`, `path`],
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
  //Hay que agregar el path. igual al name pero remplazar espacios por - y todo en minuscula.
  let new_category = {
    name: req.body.name, 
    path: req.body.name.toLowerCase()
      .replace(" ", "-")
      .replace("ñ", "n")
      .replace("á", "a")
      .replace("é", "e")
      .replace("í", "i")
      .replace("ó", "o")
      .replace("ú", "u")
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
  .then(() => {
    res.sendStatus(200)})
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
    path: req.body.name.toLowerCase()
      .replace(" ", "-")
      .replace("ñ", "n")
      .replace("á", "a")
      .replace("é", "e")
      .replace("í", "i")
      .replace("ó", "o")
      .replace("ú", "u")
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

exports.orderCategories = (req,res) => {

  req.body.forEach((element, index) => {
    categories.update({order_id: index},
      {where: {id: element.id}})
      .catch(err => {
        res.status(500).send({
            message:
              err.message || `Hubo un problema actualizando el orden de la categoría ${element.name}`
          });
      })
  }); 

}