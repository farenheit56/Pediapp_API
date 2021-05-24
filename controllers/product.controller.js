const db = require("../models");
const products = db.products;
const productSubcategoryRelations = db.productSubcategoryRelations;
const Op = db.Sequelize.Op;

exports.findAll = (req, res) => {
  products.findAll({attributes: [`id`, `name`, `price`, `description`, `image_url`], include: [{model: productSubcategoryRelations, attributes: [`id`, `product_id`, `subcategory_id`]}]}).then(data => {
      res.send(data);
  }).catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema consultando los productos"
      });
  })
};