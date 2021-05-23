module.exports = app => {
    const clients = require("../controllers/client.controller.js");
  
    var router = require("express").Router();

    router.get("/", clients.findAll);
  
    app.use('/api/clients', router);
  };