module.exports = app => {
    const categories = require("../controllers/category.controller.js");
  
    var router = require("express").Router();

    router.get("/", categories.findAll);
    router.get("/:categoryId", categories.findWhereCategoryId);
    router.post("/addCategory", categories.addCategory);
    router.delete("/deleteCategory/:categoryId", categories.deleteCategory);
    router.put("/editCategory/:categoryId", categories.editCategory);
  
    app.use('/api/categories', router);
  };