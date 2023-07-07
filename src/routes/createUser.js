const { User } = require('../db/sequelize')
const auth = require("../auth/auth");
const { ValidationError, UniqueConstraintError} = require('sequelize');
const bcrypt = require('bcrypt');


module.exports = (app) => {
  app.post('/user_tests', (req, res) => {
    var password = req.body.password;
    var username = req.body.username;
    bcrypt.hash(password , 10) 
      .then(hash => {
        User.create({ username: username , password: hash})
      // User.create(req.body)
      .then(users => {
        const message = `L\' user  a bien été crée.`
        res.json({ message, data: users })
      })
    })
      .catch(error => {
        if(error instanceof ValidationError){ //39 vérifions s'il s'agit d'une erreur de validation de sequelize, si oui c'est de la faute du client --> erreur 4000
          return res.status(400).json({message: error.message, data: error}) // 39 on passe le message d'erreur défini au niveau de notre validateur directement dans l'erreur envoyé au client --> pas de doublons dans les messages d'érreurs et tout reste centralisé
        }
        if(error instanceof UniqueConstraintError){ //47
          return res.status(400).json({message : error.message, data: error})
        }
        const message = 'L\' utilisateur n\a pas pu être ajouté. Réessayez dans quelques instants.'
        res.status(500).json({message, data: error})
      })
    })
}