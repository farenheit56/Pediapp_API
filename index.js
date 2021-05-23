var express = require('express');
var app = express();
const { Sequelize } = require('sequelize');
const dbCredentials = require('./db/dbCredentials');

const sequelize = new Sequelize(dbCredentials.databaseName, dbCredentials.user, dbCredentials.password, {
    host: dbCredentials.host,
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
