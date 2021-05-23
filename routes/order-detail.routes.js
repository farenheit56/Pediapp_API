module.exports = app => {
    const orderDetails = require("../controllers/order-detail.controller.js");
  
    var router = require("express").Router();

    router.get("/", orderDetails.findAll);
  
    app.use('/api/orderDetails', router);
  };