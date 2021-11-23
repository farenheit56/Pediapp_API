const db = require("../models");
const home = db.home;
const Op = db.Sequelize.Op;

exports.findAll = (req, res) => {
  home.findAll({attributes: [`id`, `title`, `slider_url`, `description`, `support_image_url`, `banner_image_1_url`, `banner_image_2_url`, `path`, `component_name`, `body_banner_image_1_url`, `body_banner_image_2_url`, `extra_info_image_1_url`, `extra_info_image_2_url`, `extra_info_image_3_url`]}).then(data => {
      res.send(data);
  }).catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema consultando el home"
      });
  })
}

exports.addHome = (req, res) => {
  let new_home = {
    title: req.body.title, 
    description: req.body.description, 
    component_name: "home",
    path: req.body.title.toLowerCase().replace(" ", "-")
  }

  if(req.files != undefined) {

    if(Object.prototype.hasOwnProperty.call(req.files, 'slider_image')) {
      new_home.slider_url = req.files.slider_image[0].filename
    }

    if(Object.prototype.hasOwnProperty.call(req.files, 'support_image')) {
      new_home.support_image_url = req.files.support_image[0].filename
    }

    if(Object.prototype.hasOwnProperty.call(req.files, 'banner_1_image')) {
      new_home.banner_1_image_url = req.files.banner_1_image[0].filename
    }

    if(Object.prototype.hasOwnProperty.call(req.files, 'banner_2_image')) {
      new_home.banner_2_image_url = req.files.banner_2_image[0].filename
    }

    if(Object.prototype.hasOwnProperty.call(req.files, 'body_banner_image_1')) {
      new_home.body_banner_image_1_url = req.files.body_banner_image_1[0].filename
    }
    if(Object.prototype.hasOwnProperty.call(req.files, 'body_banner_image_2')) {
      new_home.body_banner_image_2_url = req.files.body_banner_image_2[0].filename
    }
    if(Object.prototype.hasOwnProperty.call(req.files, 'extra_info_image_1')) {
      new_home.extra_info_image_1_url = req.files.extra_info_image_1[0].filename
    }
    if(Object.prototype.hasOwnProperty.call(req.files, 'extra_info_image_2')) {
      new_home.extra_info_image_2_url = req.files.extra_info_image_2[0].filename
    }
    if(Object.prototype.hasOwnProperty.call(req.files, 'extra_info_image_3')) {
      new_home.extra_info_image_3_url = req.files.extra_info_image_3[0].filename
    }
  }

  home.create(new_home)
  .then(data => {
    res.send(data)
  }).catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema agregando el home"
      });
  })
}

exports.editHome = (req,res) => {
  let edited_home = {
    title: req.body.title, 
    description: req.body.description, 
    component_name: "home",
    path: req.body.title.toLowerCase().replace(" ", "-")
  }

  if(req.files != undefined) {

    if(Object.prototype.hasOwnProperty.call(req.files, 'slider_image')) {
      edited_home.slider_url = req.files.slider_image[0].filename
    }

    if(Object.prototype.hasOwnProperty.call(req.files, 'support_image')) {
      edited_home.support_image_url = req.files.support_image[0].filename
    }

    if(Object.prototype.hasOwnProperty.call(req.files, 'banner_1_image')) {
      edited_home.banner_image_1_url = req.files.banner_1_image[0].filename
    }

    if(Object.prototype.hasOwnProperty.call(req.files, 'banner_2_image')) {
      edited_home.banner_image_2_url = req.files.banner_2_image[0].filename
    }

    if(Object.prototype.hasOwnProperty.call(req.files, 'body_banner_image_1')) {
      edited_home.body_banner_image_1_url = req.files.body_banner_image_1[0].filename
    }
    if(Object.prototype.hasOwnProperty.call(req.files, 'body_banner_image_2')) {
      edited_home.body_banner_image_2_url = req.files.body_banner_image_2[0].filename
    }
    if(Object.prototype.hasOwnProperty.call(req.files, 'extra_info_image_1')) {
      edited_home.extra_info_image_1_url = req.files.extra_info_image_1[0].filename
    }
    if(Object.prototype.hasOwnProperty.call(req.files, 'extra_info_image_2')) {
      edited_home.extra_info_image_2_url = req.files.extra_info_image_2[0].filename
    }
    if(Object.prototype.hasOwnProperty.call(req.files, 'extra_info_image_3')) {
      edited_home.extra_info_image_3_url = req.files.extra_info_image_3[0].filename
    }
  }

  home.update(edited_home,
    {where: {id: req.params.homeId}})
    .then(() => {return home.findByPk(req.params.homeId)})
    .then(data => {
      res.send(data)
    }).catch(err => {
      res.status(500).send({
          message:
            err.message || "Hubo un problema editando el home"
        });
    })
}