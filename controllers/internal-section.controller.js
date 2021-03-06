const db = require("../models");
const internalSections = db.internalSections;
const Op = db.Sequelize.Op;

exports.findAll = (req, res) => {
  internalSections.findAll({attributes: [`id`, `title`, `slider_url`, `description`, `support_image_url`, `path`, `component_name`]}).then(data => {
      res.send(data);
  }).catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema consultando las secciones"
      });
  })
}

exports.addSection = (req, res) => {
  let new_section = {
    title: req.body.title, 
    description: req.body.description, 
    component_name: "GenericSection",
    path: req.body.title.toLowerCase()
    .replace(/ /g, "-")
    .replace(/ñ/g, "n")
    .replace(/á/g, "a")
    .replace(/é/g, "e")
    .replace(/í/g, "i")
    .replace(/ó/g, "o")
    .replace(/ú/g, "u")
  }

  if(req.files != undefined) {

    if(Object.prototype.hasOwnProperty.call(req.files, 'slider_image')) {
      new_section.slider_url = req.files.slider_image[0].filename
    }

    if(Object.prototype.hasOwnProperty.call(req.files, 'support_image')) {
      new_section.support_image_url = req.files.support_image[0].filename
    }
  }

  internalSections.create(new_section)
  .then(data => {
    res.send(data)
  }).catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema agregando la sección"
      });
  })
}

exports.deleteSection = (req, res) => {
  internalSections.destroy({
    where: {id: req.params.sectionId}})
  .catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema borrando la sección"
      });
  })
}

exports.editSection = (req,res) => {


  let edited_section = {
    title: req.body.title, 
    description: req.body.description,
    path: req.body.title.toLowerCase()
    .replace(/ /g, "-")
    .replace(/ñ/g, "n")
    .replace(/á/g, "a")
    .replace(/é/g, "e")
    .replace(/í/g, "i")
    .replace(/ó/g, "o")
    .replace(/ú/g, "u")
  }
  
  if(Object.prototype.hasOwnProperty.call(req.files, 'slider_image')) {
    edited_section.slider_url = req.files.slider_image[0].filename
  }
  if(Object.prototype.hasOwnProperty.call(req.files, 'support_image')) {
    edited_section.support_image_url = req.files.support_image[0].filename
  }

  internalSections.update(edited_section,
    {where: {id: req.params.sectionId}})
    .then(() => {return internalSections.findByPk(req.params.sectionId)})
    .then(data => {
      res.send(data)
    }).catch(err => {
      res.status(500).send({
          message:
            err.message || "Hubo un problema editando la sección"
        });
    })
}

exports.editProductSection = (req,res) => {

  let edited_section = {
    slider_url: undefined
  }
  
  if(Object.prototype.hasOwnProperty.call(req.files, 'product_slider_image')) {
    edited_section.slider_url = req.files.product_slider_image[0].filename

    internalSections.update(edited_section,
      {where: {component_name: 'Products'}})
      .then(() => {
        res.sendStatus(200)
      }).catch(err => {
        res.status(500).send({
            message:
              err.message || "Hubo un problema editando el slider de la sección de productos"
          });
      })
  }

  
}