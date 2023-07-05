const { User } = require('../db/sequelize');

module.exports = (app) => {
    app.get('/user_tests/:id', (req, res) => {
        User.findByPk(req.params.id)
        .then(users => {
            if(users === null){ //rq pour sequelize plus besoin de la méthode parseInt
                const message = 'Le user demandé n\existe pas. Réessayez avec un autre identifiant';
                return res.status(404).json({message})
              }
            const message = 'Un user a bien été trouvé.'
            res.json({message, data: users})
        })
        .catch(error => {
            const message = 'Le pokémon n\a pas pu être récupéré. Réessayez dans quelques instants.'
            res.status(500).json({message, data: error})
          })
    })
}