module.exports = app => {
    const home = require("../controllers/home.controller.js");
    const upload = require("../middlewares/upload-product-image.js");
  
    var router = require("express").Router();

    router.get("/", home.findAll);
    router.post("/addHome", upload.fields([
      { name: 'slider_image' },
      { name: 'support_image' },
      { name: 'banner_1_image' },
      { name: 'banner_2_image' },
      { name: 'body_banner_image_1' },
      { name: 'body_banner_image_2' },
      { name: 'extra_info_image_1' },
      { name: 'extra_info_image_2' },
      { name: 'extra_info_image_3' }]), home.addHome);
    router.put("/editHome/:homeId",upload.fields([
      { name: 'slider_image' },
      { name: 'support_image' },
      { name: 'banner_1_image' },
      { name: 'banner_2_image' },
      { name: 'body_banner_image_1' },
      { name: 'body_banner_image_2' },
      { name: 'extra_info_image_1' },
      { name: 'extra_info_image_2' },
      { name: 'extra_info_image_3' }]), home.editHome);
   
    app.use('/api/home', router);
  };