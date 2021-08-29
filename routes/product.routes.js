module.exports = app => {
    const products = require("../controllers/product.controller.js");
    const upload = require("../middlewares/upload-product-image.js");
  
    var router = require("express").Router();

    router.get("/", products.findAll);
    router.get("/activeProducts", products.findAllActive);
    router.get("/findForCategory/:categoryId", products.findForCategory);
    router.get("/findForSubcategory/:subcategoryId", products.findForSubcategory);
    router.post("/addProduct",upload.single("file"), products.addProduct);
    router.delete("/deleteProduct/:productId", products.deleteProduct);
    router.put("/editProduct/:productId",upload.single("file"), products.editProduct);
    router.post("/relateProductToSubcategory", products.addSubcategory)
    router.post("/relateProductToCategory", products.addCategory)
    router.post("/separateProductFromSubcategory", products.separateSubcategory)
    router.post("/separateProductFromCategory", products.separateCategory)
  
    app.use('/api/products', router);
  };
