const { User } = require('../db/sequelize')

const { ValidationError, UniqueConstraintError} = require('sequelize')

module.exports = (app) => {
  app.post('/user_tests', (req, res) => {
    User.create(req.body)
      .then(users => {
        const message = `Le user ${req.body.name} a bien été crée.`
        res.json({ message, data: users })
      })
      .catch(error => {
        if(error instanceof ValidationError){ //39 vérifions s'il s'agit d'une erreur de validation de sequelize, si oui c'est de la faute du client --> erreur 4000
          return res.status(400).json({message: error.message, data: error}) // 39 on passe le message d'erreur défini au niveau de notre validateur directement dans l'erreur envoyé au client --> pas de doublons dans les messages d'érreurs et tout reste centralisé
        }
        if(error instanceof UniqueConstraintError){ //47
          return res.status(400).json({message : error.message, data: error})
        }
        const message = 'Le pokémon n\a pas pu être ajouté. Réessayez dans quelques instants.'
        res.status(500).json({message, data: error})
      })
  })
}