module.exports = app => {
    const categories = require("../controllers/category.controller.js");
  
    var router = require("express").Router();

    router.get("/", categories.findAll);
  
    app.use('/api/categories', router);
  };