module.exports = app => {
    const contact = require("../controllers/contact.controller.js");
  
    var router = require("express").Router();

    router.get("/", contact.findAll);
  
    app.use('/api/contact', router);
  };