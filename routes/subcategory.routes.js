module.exports = app => {
    const subcategories = require("../controllers/subcategory.controller.js");
  
    var router = require("express").Router();

    router.get("/", subcategories.findAll);
  
    app.use('/api/subcategories', router);
  };