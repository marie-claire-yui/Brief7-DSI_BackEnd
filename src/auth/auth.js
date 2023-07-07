// middleware de sécurisation des échanges entre le client et l'API REST, vérification validité du jeton transmis par client lors des requêtes
const jwt = require('jsonwebtoken')
const privateKey = require('../auth/private_key')
  
module.exports = (req, res, next) => {
  const authorizationHeader = req.headers.authorization
    // récupération de l'en-tête HTTP authorization. c'est dans cet en-tête que transitera le jeton jwt envoyé par le consommateur
  
  if(!authorizationHeader) {
    const message = `Vous n'avez pas fourni de jeton d'authentification. Ajoutez-en un dans l'en-tête de la requête.`
    return res.status(401).json({ message })
  }
    // vérification si jeton a bien été fourni
    const token = authorizationHeader.split(' ')[1]
    // voir Bearer
    const decodedToken = jwt.verify(token, privateKey, (error, decodedToken) => {
    if(error) {
        // vérification jeton valide
      const message = `L'utilisateur n'est pas autorisé a accèder à cette ressource.`
      return res.status(401).json({ message, data: error })
    }
    // récupération jeton envoyé par l'user dans une const token
    const userId = decodedToken.userId
    if (req.body.userId && req.body.userId !== userId) {
      const message = `L'identifiant de l'utilisateur est invalide.`
      res.status(401).json({ message })
    } else {
      next();
    //   next => authentif ok permet accès aux endpoints demandés.
    }
  })
}
// Voici comment le jeton JWT sera échangé entre le client et l'API REST:
// authorization : Bearer <JWT>
// exemple: authorization : Bearer Jdoihef5454r4ger
// Le jeton JWT de notre client sera échangé dans une en-tête HTTP nommée authorization avec pour valeur le nom arbitraire bearer espace le jeton en lui-même.
// Pour extraite le jeton d'un user, il faut retirer le terme Bearer avant l'espace qui sert de séparateur et récupèrer valeur du jeton uniquement.
