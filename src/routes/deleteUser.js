const { User } = require('../db/sequelize');
module.exports = (app) => {
  app.delete('/user_tests/:id', (req, res) => {
    User.findByPk(req.params.id).then((user) => {
      if (!user) {
        return res.status(404).json({ error: 'Utilisateur non trouvé.' });
      }      const userDeleted = user;
      user.destroy().then(() => {
        const message = `L'utilisateur n°${userDeleted.id_user} a bien été supprimé.`;
        res.json({ message, data: userDeleted });
      })
      .catch((error) => {
        console.error('Erreur lors de la suppression de l\'utilisateur:', error);
        res.status(500).json({ error: 'Une erreur est survenue lors de la suppression de l\'utilisateur.' });
      });
    })
    .catch((error) => {
      console.error('Erreur lors de la recherche de l\'utilisateur:', error);
      res.status(500).json({ error: 'Une erreur est survenue lors de la recherche de l\'utilisateur.' });
    });
  });
};