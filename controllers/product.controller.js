const db = require("../models");
const products = db.products;
const categories = db.categories;
const subcategories = db.subcategories;
const productImages = db.productImages;
const Op = db.Sequelize.Op;

exports.findAll = (req, res) => {
  products.findAll({attributes: [`id`, `name`, `price`, `description`, `active`, `stock`, `path`, `image_url`], include: { all: true }})
  .then(data => {
      res.send(data);
  }).catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema consultando los productos"
      });
  })
};

exports.findAllActive = (req, res) => {
  products.findAll({attributes: [`id`, `name`, `price`, `description`, `active`, `stock`, `path`, `image_url`], include: { all: true }, where: {active: 1}})
  .then(data => {
      res.send(data);
  }).catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema consultando los productos activos"
      });
  })
};

exports.findForCategory = (req, res) => {
  products.findAll({
    attributes: [`id`, `name`, `price`, `description`, `active`, `stock`, `path`, `image_url`],
    include: [{
      model: categories, through: { attributes: [] },
      where: { id: req.params.categoryId } },
      {
      model: subcategories, through: { attributes: [] },
      },
      {
      model: productImages
      }
    ]})
    .then(data => {
      res.send(data);
    }).catch(err => {
      res.status(500).send({
        message:
          err.message || "Hubo un problema consultando los productos de esta categoria"
      });
    })
};

exports.findForSubcategory = (req, res) => {
  products.findAll({
    attributes: [`id`, `name`, `price`, `description`, `active`, `stock`, `path`, `image_url`],
    include: [{
      model: categories, through: { attributes: [] },
      },
      {
      model: subcategories, through: { attributes: [] },
      where: { id: req.params.subcategoryId } 
      },
      {
      model: productImages
      }
    ]})
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
    description: req.body.description,
    active: req.body.active,
    stock: req.body.stock,
    path: req.body.name.toLowerCase().replace(" ", "-")
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
    description: req.body.description,
    active: req.body.active,
    stock: req.body.stock,
  }

  if(req.body.name != null) {
    edited_product.path = req.body.name.toLowerCase().replace(" ", "-")
  }

  if(Object.prototype.hasOwnProperty.call(req, 'file')) {
    edited_product.image_url = req.file.filename
  }

  products.update(edited_product,
    {where: {id: req.params.productId}})
    .then(() => {return products.findByPk(req.params.productId)})
    .then(data => {
      res.send(data);
    })
    .catch(err => {
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
          return products.findAll({attributes: [`id`, `name`, `price`, `description`, `active`, `stock`, `path`, `image_url`], include: {model: subcategories, through: { attributes: []}}})
        })
        .then(data => {
          res.send(data);
          console.log(`Se asignó la subcategoría id=${subcategory.id} al producto id=${product.id}`);
        }).catch(err => {
          res.status(500).send({
              message:
                err.message || "Hubo un problema editando la asociación del producto"
            });
        })
        
      });
    })
    .catch((err) => {
      console.log("Error al asignar subcategoria a producto: ", err);
    });
};

exports.addCategory = (req,res) => {
  return products.findByPk(req.body.productId)
    .then((product) => {
      if (!product) {
        console.log("Producto no encontrado");
        return null;
      }
      return categories.findByPk(req.body.categoryId)
      .then((category) => {
        if (!category) {
          console.log("Categoria no encontrada");
          return null;
        }

        product.addCategory(category)
        .then(() => {
          products.findAll({attributes: [`id`, `name`, `price`, `description`, `active`, `stock`, `path`, `image_url`], include: { all: true }})
        })
        .then(data => {
          res.send(data);
          console.log(`Se asignó la Categoría id=${category.id} al producto id=${product.id}`);
        }).catch(err => {
          res.status(500).send({
              message:
                err.message || "Hubo un problema editando la asociación del producto"
            });
        })

      });
    })
    .catch((err) => {
      console.log("Error al asignar subcategoria a producto: ", err);
    });
};


exports.separateCategory = (req,res) => {
  return products.findByPk(req.body.productId)
    .then((product) => {
      if (!product) {
        console.log("Producto no encontrado");
        return null;
      }
      return categories.findByPk(req.body.categoryId)
      .then((category) => {
        if (!category) {
          console.log("Categoria no encontrada");
          return null;
        }

        product.removeCategory(category)
        .then(() => {
          products.findAll({attributes: [`id`, `name`, `price`, `description`, `active`, `stock`, `path`, `image_url`], include: { all: true }})
        })
        .then(data => {
          res.send(data);
          console.log(`Se desvinculó la Categoría id=${category.id} al producto id=${product.id}`);
        }).catch(err => {
          res.status(500).send({
              message:
                err.message || "Hubo un problema editando el producto"
            });
        })

      });
    })
    .catch((err) => {
      console.log("Error al asignar subcategoria a producto: ", err);
    });
}

exports.separateSubcategory = (req,res) => {
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

        product.removeSubcategory(subcategory)
        .then(() => {
          products.findAll({attributes: [`id`, `name`, `price`, `description`, `active`, `stock`, `path`, `image_url`], include: { all: true }})
        })
        .then(data => {
          res.send(data);
          console.log(`Se desvinculó la Subcategoría id=${category.id} al producto id=${product.id}`);
        }).catch(err => {
          res.status(500).send({
              message:
                err.message || "Hubo un problema editando el producto"
            });
        })

      });
    })
    .catch((err) => {
      console.log("Error al asignar subcategoria a producto: ", err);
    });
}

exports.relateImage = (req,res) => {
  console.log("Estoy aca")
  req.files.additional_images.forEach(image => {
    let productImage = {
      image_url: image.filename,
      productId: req.body.productId  
    }

    productImages.create(productImage)
    .then(data => {
      res.send(data);
    }).catch(err => {
      res.status(500).send({
          message:
            err.message || "Hubo un problema agregando la imagen de galeria"
        });
    })
  });
}

exports.separateImage = (req,res) => {
  //Agregarle un then con un res.send 

  productImages.destroy({
    where: {id: req.body.imageId}})
  .catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema eliminando la asociación de la imagen adicional"
      });
  })
}
