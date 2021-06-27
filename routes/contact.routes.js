module.exports = app => {
    const contact = require("../controllers/contact.controller.js");
  
    var router = require("express").Router();

    router.get("/", contact.findAll);
    router.post("/addContact", contact.addContact);
    router.delete("/deleteContact/:contactId", contact.deleteContact);
    router.put("/editContact/:contactId", contact.editContact)
  
    app.use('/api/contact', router);
  };