const {User} = require("../db/sequelize");

module.exports = (app) => {
    app.post('/user_tests', (req, res) => {
        User.create(req.body)
        .then(users => {
            const message = 'User créé';
            res.json({message, data: users});
        })
    })
}
