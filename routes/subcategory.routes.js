module.exports = app => {
    const subcategories = require("../controllers/subcategory.controller.js");
  
    var router = require("express").Router();

    router.get("/", subcategories.findAll);
    router.post("/addSubcategory", subcategories.addSubcategory);
    router.delete("/deleteSubcategory/:subcategoryId", subcategories.deleteSubcategory);
    router.put("/editSubcategory/:subcategoryId", subcategories.editSubcategory);
  
    app.use('/api/subcategories', router);
  };