var express = require('express');
var app = express();

app.use(express.json()); 

app.use(express.urlencoded({ extended: true }));

app.get('/', function (req, res) {
	  res.send('Hola PediApp');
});

require("./routes/internal-section.routes")(app);

app.listen(3000, function () {
	  console.log('Aplicacion escuchando en el puerto 3000!');
});
