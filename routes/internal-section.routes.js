module.exports = app => {
    const internalSections = require("../controllers/internal-section.controller.js");
    const upload = require("../middlewares/upload-product-image.js");
  
    var router = require("express").Router();

    router.get("/", internalSections.findAll);
    router.post("/addSection",upload.fields([{name: 'slider_image'}, {name: 'support_image'}]), internalSections.addSection);
    router.delete("/deleteSection/:sectionId", internalSections.deleteSection);
    router.put("/editSection/:sectionId",upload.fields([{name: 'slider_image'}, {name: 'support_image'}]), internalSections.editSection);
    router.put("/editProductSlider",upload.fields([{name: 'product_slider_image'}]), internalSections.editProductSection);
   
    app.use('/api/internalSections', router);
  };