// Ce code exporte une fonction qui définit une route GET /user_tests dans une application Express
const { User } = require("../db/sequelize");

module.exports = (app) => {
    // instance d'express
    app.get('/user_tests', (req, res) => {
        User.findAll()
        .then(users => {
            // enregistre une fonction de rappel qui sera exécutée lorsque la méthode findAll() sera résolue avec succès. La fonction de rappel prend un paramètre users, qui est un tableau contenant tous les utilisateurs récupérés.
            const message = 'La liste des users a bien été récupérée.'
            res.json({ message, data: users});
            // Envoie une réponse JSON contenant le message et les données des utilisateurs récupérés.
        })
        .catch( error => {
            const message = `La liste des pokémons n'a pas pu être récupérée. Réessayez dans quelques instants.`
            res.status(500).json({message, data: error})
          })
    })
}