var express = require('express');
var app = express();
const { Sequelize } = require('sequelize');

const sequelize = new Sequelize('database', 'user', 'pass.', {
    host: 'localhost',
    dialect: 'mysql'
  });

    sequelize.authenticate().then(() => {
        console.log('Atroden');
    }).catch(() => {
        console.log('Chupala');
    })


app.get('/', function (req, res) {
	  res.send('Hello World!');
});
app.listen(3000, function () {
	  console.log('Aplicacion de pruebas escuchando en el puerto 3000!');
});
