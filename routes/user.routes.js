module.exports = app => {
    const users = require("../controllers/user.controller.js");
    const {verificarAuth} = require('../middlewares/authentication.js');
  
    var router = require("express").Router();

    router.get("/", verificarAuth, users.findAll);
    router.post("/login", users.login)
    router.post("/newUser", users.newUser)
  
    app.use('/api/users', router);
  };