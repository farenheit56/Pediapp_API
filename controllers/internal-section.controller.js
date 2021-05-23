const db = require("../models");
const internalSections = db.internalSections;
const Op = db.Sequelize.Op;

exports.findAll = (req, res) => {
  internalSections.findAll({attributes: [`id`, `title`, `slider_url`, `description`, `support_image_url`]}).then(data => {
      res.send(data);
  }).catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema consultando las secciones"
      });
  })
};