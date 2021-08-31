var express = require('express');
var cors = require('cors')
var app = express();
var path = require('path');


app.use(cors())
app.use(express.json()); 

// Middleware para Vue.js router modo history
const history = require('connect-history-api-fallback');
app.use(history());

app.use(express.urlencoded({ extended: true }));

//app.use('/images', express.static('images'));
app.use(express.static(path.join(__dirname, 'public')));

global.__basedir = __dirname;

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
require("./routes/user.routes")(app);

app.listen(3000, function () {
	  console.log('Aplicacion escuchando en el puerto 3000!');
});
