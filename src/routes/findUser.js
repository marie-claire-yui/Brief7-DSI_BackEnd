const { User } = require('../db/sequelize');

module.exports = (app) => {
    app.get('/user_tests/:id', (req, res) => {
        User.findByPk(req.params.id)
        // pas de parseInt car findByPk le fait automatiquement
        .then(users => {
            const message = 'Un user a bien été trouvé.'
            res.json({message, data: users})
        })
    })
}