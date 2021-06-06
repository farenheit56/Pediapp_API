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

exports.addProduct = (req, res) => {
  products.create({
    name: req.body.name, 
    price: req.body.price, 
    description: req.body.description, 
    image_url: req.file.filename})
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
  products.update({
    name: req.body.name, 
    price: req.body.price, 
    description: req.body.description, 
    image_url: req.file.filename},
    {where: {id: req.params.productId}})
    .then(data => {
      res.send(data);
    }).catch(err => {
      res.status(500).send({
          message:
            err.message || "Hubo un problema editando el producto"
        });
    })
}