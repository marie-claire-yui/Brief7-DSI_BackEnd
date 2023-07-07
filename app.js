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

const fs = require('fs'); // fourni une API pour interagir avec le file system( permettant lecture, écriture et manipulation de fichier)
const path = require('path'); // module qui permet de travailler avec des chemins de fichiers et de repertoire
const https = require('https'); // module utilisé pour faire des requêtes http ou https. Il fourni des fonctions pour créer ou faire des requetes https à d'autres serveurs



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

// Ce code met en place un serveur HTTPS avec les fichiers de certificat SSL et de clé privée spécifiés, et il écoute sur le port 3000 pour les requêtes entrantes.
const key = fs.readFileSync(path.join(__dirname, 'certificate', 'server.key'));
// La variable key reçoit le contenu du fichier 'server.key'. fs.readFileSync() est utilisé pour lire le fichier de manière synchrone, 
//et path.join() est utilisé pour construire le chemin du fichier en combinant le répertoire courant (__dirname) et le chemin relatif du fichier 'certificate/server.key'.
const cert = fs.readFileSync(path.join(__dirname, 'certificate', 'server.cert'));
//  La variable cert reçoit le contenu du fichier 'server.cert', en suivant une approche similaire à celle de la variable key.
const options = { key, cert };
https.createServer(options, app).listen(3000, () => { console.log('App is running ! Go to https://localhost:3000');});
//L'objet options est créé, contenant les propriétés key et cert. Cet objet est passé en argument à la méthode https.createServer(), qui crée un serveur HTTPS.
// Le paramètre app représente votre application Express
//Le serveur est démarré en appelant la méthode listen() sur le serveur HTTPS créé. Il écoute sur le port 3000, et une fonction de rappel est fournie pour s'exécuter une fois que le serveur démarre avec succès. 
