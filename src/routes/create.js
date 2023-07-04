// requête création user
const {User} = require("../db/sequelize");
// import models User de sequelize

module.exports = (app) => {
    // app instance d'espress à laquelle la route sera rattachée
    app.post('/user_tests', (req, res) => {
        User.create(req.body)
        // création nouvel user avec les informations dans le corps de la requête
        .then(users => {
            // Si la création de l'utilisateur réussit, cette fonction de rappel est exécutée avec l'utilisateur nouvellement créé ou les utilisateurs créés (selon la définition du modèle).
            const message = 'User créé';
            res.json({message, data: users});
        })
    })
}
// export de la requête afin de l'utiliser dans le point d'entrée
