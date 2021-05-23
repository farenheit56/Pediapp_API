module.exports = app => {
    const orders = require("../controllers/order.controller.js");
  
    var router = require("express").Router();

    router.get("/", orders.findAll);
  
    app.use('/api/orders', router);
  };