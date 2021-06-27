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
}

exports.addSocialNetwork = (req, res) => {

  let new_social_network = {
    name: req.body.name,
    url: req.body.url
  }

  if(Object.prototype.hasOwnProperty.call(req, 'file')) {
    new_social_network.icon_url = req.file.filename
  }

  SocialNetworks.create(new_social_network)
  .then(data => {
    res.send(data);
  }).catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema agregando la red social"
      });
  })
}

exports.deleteSocialNetwork = (req, res) => {
  SocialNetworks.destroy({
    where: {id: req.params.socialNetworkId}})
  .catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema borrando la red social"
      });
  })
}

exports.editSocialNetwork = (req, res) => {

  let edited_social_network = {
    name: req.body.name,
    url: req.body.url
  }

  if(Object.prototype.hasOwnProperty.call(req, 'file')) {
    edited_social_network.icon_url = req.file.filename
  }

  SocialNetworks.update(edited_social_network,
    { where: { id: req.params.socialNetworkId } })
    .then(() => { return SocialNetworks.findByPk(req.params.socialNetworkId) })
    .then(data => {
      res.send(data);
    }).catch(err => {
      res.status(500).send({
        message:
          err.message || "Hubo un problema editando la red social"
      });
    })



}