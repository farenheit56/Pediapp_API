module.exports = app => {
    const socialNetworks = require("../controllers/social-network.controller.js");
    const upload = require("../middlewares/upload-product-image.js");
  
    var router = require("express").Router();

    router.get("/", socialNetworks.findAll);
    router.post("/addSocialNetwork",upload.single("file"), socialNetworks.addSocialNetwork);
    router.delete("/deleteSocialNetwork/:socialNetworkId", socialNetworks.deleteSocialNetwork);
    router.put("/editSocialNetwork/:socialNetworkId",upload.single("file"), socialNetworks.editSocialNetwork)
  
    app.use('/api/socialNetworks', router);
  };