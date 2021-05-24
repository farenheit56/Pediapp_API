module.exports = app => {
    const categorySubcategoryRelations = require("../controllers/category-subcategory-relation.controller.js");
  
    var router = require("express").Router();

    router.get("/", categorySubcategoryRelations.findAll);
  
    app.use('/api/categorySubcategoryRelations', router);
  };