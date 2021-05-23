module.exports = app => {
    const socialNetowrks = require("../controllers/social-network.controller.js");
  
    var router = require("express").Router();

    router.get("/", socialNetowrks.findAll);
  
    app.use('/api/social-networks', router);
  };