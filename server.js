var express = require('express');
var app = express();

app.use(express.json()); 

app.use(express.urlencoded({ extended: true }));

app.get('/', function (req, res) {
	  res.send('Hola PediApp');
});

require("./routes/internal-section.routes")(app);
require("./routes/social-network.routes")(app);
require("./routes/category.routes")(app);
require("./routes/subcategory.routes")(app);
require("./routes/contact.routes")(app);
require("./routes/product.routes")(app);
require("./routes/client.routes")(app);
require("./routes/order.routes")(app);
require("./routes/order-detail.routes")(app);
require("./routes/category-subcategory-relation.routes")(app);

app.listen(3000, function () {
	  console.log('Aplicacion escuchando en el puerto 3000!');
});
