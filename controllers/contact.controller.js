const db = require("../models");
const contact = db.contact;
const Op = db.Sequelize.Op;

exports.findAll = (req, res) => {
  contact.findAll({attributes: [`id`, `name`, `phone`, `address`]}).then(data => {
      res.send(data);
  }).catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema consultando los datos de contacto"
      });
  })
}

exports.addContact = (req, res) => {
  contact.create({
    name: req.body.name, 
    phone: req.body.phone, 
    address: req.body.address})
  .then(data => {
    res.send(data);
  }).catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema agregando el contacto"
      });
  })
}

exports.deleteContact = (req, res) => {
  contact.destroy({
    where: {id: req.params.contactId}})
  .catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema borrando el contacto"
      });
  })
}

exports.editContact = (req,res) => {
  contact.update({
    name: req.body.name, 
    phone: req.body.phone, 
    address: req.body.address},
    {where: {id: req.params.contactId}})
    .then(() => {return contact.findByPk(req.params.contactId)})
    .then(data => {
      res.send(data);
    }).catch(err => {
      res.status(500).send({
          message:
            err.message || "Hubo un problema editando el contacto"
        });
    })
}