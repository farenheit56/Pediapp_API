module.exports = app => {
    const categories = require("../controllers/category.controller.js");
  
    var router = require("express").Router();

    router.get("/", categories.findAll);
    router.get("/:categoryId", categories.findWhereCategoryId);
  
    app.use('/api/categories', router);
  };