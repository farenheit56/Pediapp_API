const db = require("../models");
const users = db.users;
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const saltRounds = 10;


exports.findAll = (req, res) => {
  users.findAll({attributes: [`id`, `name`, `user`]}).then(data => {
      res.send(data);
  }).catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema consultando los usuarios"
      });
  })
}

exports.newUser = (req, res) => {

  let new_user = {
    name: req.body.name,
    user: req.body.user,
    pass: bcrypt.hashSync(req.body.pass, saltRounds)
  }

  users.create(new_user)
  .then(data => {
    res.send(data);
  }).catch(err => {
    res.status(500).send({
        message:
          err.message || "Hubo un problema agregando el usuario"
      });
  })
}

exports.login = async (req,res) => {

  const usuarioDB = await users.findOne({where: {user: req.body.username}})
  try {
  // Evaluamos si existe el usuario en DB
  if(!usuarioDB){
    return res.status(400).json({
      mensaje: 'Usuario! o contraseña inválidos',
    });
  }  
  
  // Evaluamos la contraseña correcta
  if(!bcrypt.compareSync(req.body.pass, usuarioDB.pass) ){
    return res.status(400).json({
      mensaje: 'Usuario o contraseña! inválidos',
    });
  }

  // Generar Token
  let token = jwt.sign({
    data: usuarioDB
  }, 'secret', { expiresIn: 60 * 60 * 24 * 30}) // Expira en 30 días

  // Pasó las validaciones
  return res.json({
    usuarioDB,
    token: token
  })
  
  } catch (error) {
    return res.status(400).json({
      mensaje: 'Ocurrio un error',
      error
    });
}

}