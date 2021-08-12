module.exports = app => {
    const products = require("../controllers/product.controller.js");
    const upload = require("../middlewares/upload-product-image.js");
  
    var router = require("express").Router();

    router.get("/", products.findAll);
    router.get("/:subcategoryId", products.findForSubcategory);
    router.post("/addProduct",upload.single("file"), products.addProduct);
    router.delete("/deleteProduct/:productId", products.deleteProduct);
    router.put("/editProduct/:productId",upload.single("file"), products.editProduct);
    router.post("/relateProductToSubcategory", products.addSubcategory)
  
    app.use('/api/products', router);
  };
