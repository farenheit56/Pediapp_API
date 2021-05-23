const db = require("../models");
const SocialNetworks = db.socialNetworks;
const Op = db.Sequelize.Op;

exports.findAll = (req, res) => {
  SocialNetworks.findAll({attributes: [`id`, `name`, `url`, `icon_url`]}).then(data => {
      res.send(data);
  }).catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema consultando las redes sociales"
      });
  })
};