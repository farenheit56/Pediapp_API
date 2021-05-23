module.exports = app => {
    const internalSections = require("../controllers/internal-section.controller.js");
  
    var router = require("express").Router();

    router.get("/", internalSections.findAll);
  
    app.use('/api/internal-sections', router);
  };