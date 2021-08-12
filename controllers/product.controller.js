const db = require("../models");
const products = db.products;
const subcategories = db.subcategories;
const Op = db.Sequelize.Op;

exports.findAll = (req, res) => {
  products.findAll({attributes: [`id`, `name`, `price`, `description`, `image_url`], include: {model: subcategories, through: { attributes: []}}})
  .then(data => {
      res.send(data);
  }).catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema consultando los productos"
      });
  })
};

exports.findForSubcategory = (req, res) => {
  products.findAll({attributes: [`id`, `name`, `price`, `description`, `image_url`], include: {model: subcategories, through: { attributes: []}, where: {id: req.params.subcategoryId}}})
  .then(data => {
      res.send(data);
  }).catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema consultando los productos de esta subcategoria"
      });
  })
};

exports.addProduct = (req, res) => {

  let new_product = {
    name: req.body.name, 
    price: req.body.price, 
    description: req.body.description
  }

  if(Object.prototype.hasOwnProperty.call(req, 'file')) {
    new_product.image_url = req.file.filename
  }

  products.create(new_product)
  .then(data => {
    res.send(data);
  }).catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema agregando el producto"
      });
  })
}

exports.deleteProduct = (req, res) => {
  products.destroy({
    where: {id: req.params.productId}})
  .catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema borrando el producto"
      });
  })
}

exports.editProduct = (req,res) => {

  let edited_product = {
    name: req.body.name, 
    price: req.body.price, 
    description: req.body.description
  }

  if(Object.prototype.hasOwnProperty.call(req, 'file')) {
    edited_product.image_url = req.file.filename
  }

  products.update(edited_product,
    {where: {id: req.params.productId}})
    .then(() => {return products.findByPk(req.params.productId)})
    .then(data => {
      res.send(data);
    }).catch(err => {
      res.status(500).send({
          message:
            err.message || "Hubo un problema editando el producto"
        });
    })
}

exports.addSubcategory = (req, res) => {
  return products.findByPk(req.body.productId)
    .then((product) => {
      if (!product) {
        console.log("Producto no encontrado");
        return null;
      }
      return subcategories.findByPk(req.body.subcategoryId)
      .then((subcategory) => {
        if (!subcategory) {
          console.log("Subcategoria no encontrada");
          return null;
        }

        product.addSubcategory(subcategory)
        .then(() => {
          return products.findAll({attributes: [`id`, `name`, `price`, `description`, `image_url`], include: {model: subcategories, through: { attributes: []}}})
        })
        console.log(`Se asignó la subcategoría id=${product.id} al producto id=${subcategory.id}`);
        return product;
      });
    })
    .catch((err) => {
      console.log("Error al asignar subcategoria a producto: ", err);
    });
};