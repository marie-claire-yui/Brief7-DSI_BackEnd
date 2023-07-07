const express = require('express');
//  Récupération du paquet express dans code avec require 
const bodyParser = require('body-parser');
// pour récupèrer données au format json
const sequelize = require('./src/db/sequelize');
// récupération sequelize pour connexion action bdd dans API
const app = express();
// serveur web sur lequel fonctionnera notre API REST
const port = 3000 ;
// port sur lequel nous allons démarr er notre  API REST par la suite

const fs = require('fs');
const path = require('path');
const https = require('https');



app.use(bodyParser.json());


require('./src/routes/findAll')(app);
require('./src/routes/findUser')(app);
require('./src/routes/createUser')(app);
require('./src/routes/deleteUser')(app);
require('./src/routes/updateUser')(app);
require('./src/routes/login')(app);
// routes pour les requêtes concernant la connexion admin


// app.listen(port, () => console.log(`Notre appli Node est démarrée sur : http://localhost: ${port}`));
// // démarre API REST sur port 3000


const key = fs.readFileSync(path.join(__dirname, 'certificate', 'server.key'));
const cert = fs.readFileSync(path.join(__dirname, 'certificate', 'server.cert'));
 
const options = { key, cert };
https.createServer(options, app).listen(3000, () => { console.log('App is running ! Go to https://localhost:3000');});

