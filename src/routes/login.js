const { User } = require('../db/sequelize');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const privateKey = require('../auth/private_key');
  
module.exports = (app) => {
  app.post('/login', (req, res) => {
  
    User.findOne({ where: { username: req.body.username } }).then(users => {
        // requête pour obtenir les informations d'un utilisateur avec la méthode findOne
        if(!users){
            const message = "L'utilisateur demandé n'existe pas.";
            return res.status(404).json({message});
        }
        // vérification si user existe sinon retourne message erreur avec code statut 404

        bcrypt.compare(req.body.password, users.password).then(isPasswordValid => {
        // compare du module bcrypt: permet de comparer le mdp saisi user avec le mdp encrypté dans la bdd. Evalue si mdp en clair est le même que celui sécurisé. promesse: car opération longue, il faut décrypter le mdp pour le comparer d'où la promesse car tmt async.
            if(!isPasswordValid) {
            const message = 'Le mot de passe est invalide.'
            return res.status(401).json({message});
            }
            // 401 car pas une ressource qui n'a pas été trouvée mais un droit d'accès ko

            // jwt
            const token = jwt.sign(
                // génération jeton jwt avec la méthode sign du module jwt, elle est composée de 3 paramètres pour engendrer un ejeton jwt. On le reécupère dans une constante token. Puis retour du jeton crée aux client l34
                { userId : users.id_user },
                privateKey,
                { expiresIn: '24h'}
            )

            const message = `L'utilisateur a été connecté avec succès`;
            return res.json({ message, data: users, token });
        // vérification mdp erroné
      })
    })
    .catch(error => {
        const message = "L'utilisateur n'a pas été connecté avec succès. Réessayez.";
        return res.json({message});
    })
    // cas d'erreur générique du endpoint: exemple appel réseau ko
  })
}