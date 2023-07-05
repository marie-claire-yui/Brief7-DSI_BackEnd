const { User } = require('../db/sequelize')
const { ValidationError, UniqueConstraintError } = require('sequelize') 

module.exports = (app) => {
  app.put('/user_tests/:id', (req, res) => {
    const id = req.params.id
    
    User.update(req.body, { //28 méthode update est ce qui permet d'appliquer les modifications en base de données
      where: { id_user : id }
    })
    .then(_ => {
      return User.findByPk(id).then((users) => {
        console.log(users);
        if(users === null){
          const message = 'Le user demandé n\'existe pas. Réessayez avec un autre identifiant.';
          return res.status(404).json({message})
        } 
        const message = `Le user ${users.name} a bien été modifié.`
        res.json({message, data: users })
      })
    })
    .catch(error => {
      if(error instanceof ValidationError) { 
        return res.status(400).json({message: error.message, data: error})
      }
      if(error instanceof UniqueConstraintError){ 
        return res.status(400).json({message : error.message, data: error})
      }
      const message = 'Le user n\'a pas pu être modifié. Réessayez dans quelques instants. '
      res.status(500).json({message, data: error})
    })
    
  })
}
