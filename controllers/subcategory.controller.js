const { sequelize } = require("../models");
const db = require("../models");
const categories = db.categories;
const subcategories = db.subcategories;

exports.findAll = (req, res) => {
  subcategories.findAll({attributes: [`id`, `name`,`path`]}).then(data => {
      res.send(data);
  }).catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema consultando las subcategorías"
      });
  })
};

exports.addSubcategory = (req,res) => {
  //Al igual que en categoria falta agrega el path.
  let new_subcategory = {
    name: req.body.name,
    path: req.body.name.toLowerCase().replace(" ", "-") 
  }
//ESTO ES UN ASCO, EL REFACTOR CORRECTO SERIA TENER EL MODELO DE LA JUNCTION TABLE SIN ALIAS, PARA ASI NO TENER QUE USAR UNA RAW QUERY
  subcategories.create(new_subcategory)
  .then(data => {
    sequelize.query(`INSERT INTO relation_category_subcategory (categoryId, subcategoryId, createdAt, updatedAt) VALUES (${req.body.categoryId}, ${data.id}, '1900-01-01', '1900-01-01')`)
    res.send(data);
  })
  .catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema agregando la subcategoría"
      });
  })
}

exports.deleteSubcategory = (req, res) => {
  subcategories.destroy({
    where: { id: req.params.subcategoryId }
  })
  .then(() => {
    res.status(200).send()
  })
  .catch(err => {
    res.status(500).send({
      message:
        err.message || "Hubo un problema borrando la subcategoría"
    });
  })
}

exports.editSubcategory = (req,res) => {

  let edited_subcategory = {
    name: req.body.name, 
  }

  subcategories.update(edited_subcategory,
    {where: {id: req.params.subcategoryId}})
    .then(() => {return subcategories.findByPk(req.params.subcategoryId)})
    .then(data => {
      res.send(data);
    }).catch(err => {
      res.status(500).send({
          message:
            err.message || "Hubo un problema editando la subcategoría"
        });
    })
}