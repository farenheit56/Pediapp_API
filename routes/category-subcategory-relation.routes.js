module.exports = app => {
    const categorySubcategoryRelations = require("../controllers/category-subcategory-relation.controller.js");
  
    var router = require("express").Router();

    router.get("/", categorySubcategoryRelations.findAll);
    router.get("/:category_id", categorySubcategoryRelations.findWhereCategoryId);
  
    app.use('/api/categorySubcategoryRelations', router);
  };