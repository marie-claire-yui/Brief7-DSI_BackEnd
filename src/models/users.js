module.exports = (sequelize, DataTypes) => {
    return sequelize.define('user_test', {
      // module.exports = (sequelize, DataTypes) => { : Exporte une fonction prenant deux paramètres : sequelize, qui représente l'instance de Sequelize pour la connexion à la base de données, et DataTypes, qui est un objet contenant les types de données Sequelize.
      // return sequelize.define('user_test', { : Utilise la méthode define() de sequelize pour définir un nouveau modèle. Le premier paramètre est le nom du modèle, ici "user_test". La fonction retourne le modèle défini, ce qui permet de l'utiliser ailleurs dans le code.
      id_user: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
        // la propriété define prend elle même 3 param, afin de mettre en place un nouveau models. Sequelize se base sur les models que nous déclarons pour construire les tables dans la bdd sql par la suite.
        // param: nom du models création de la table Pokemon (l2),avec un s par la suite. Puis, description du models, on décrit toutes les prop du modèle qui seront traduit en colonne dans la table. Pour chaque prop: un nom, un objt de config pour param le titre et le caracr obligatoire ou non de la prop. Le 3 ème param = est une option de param global. Facultatif pêrmet d'ajouter une config plus globale à notre model. Sequelize génère deux prop par défaut indépendamment des champs renseignés => createdAt date créa nouveau modèle et updatedAt date de modif d'une instance, mais l'on peut les modifier.
      username: {
        type: DataTypes.STRING,
        allowNull: false
        // facultatif ou non
      },
      password: {
        type: DataTypes.STRING,
        allowNull: false
      }
    }, {
      tableName: 'user_tests',
       // nom table dans la bdd
      timestamps: false, 
      //  Désactive les timestamps par défaut. Cela signifie que les colonnes createdAt et updatedAt ne seront pas automatiquement ajoutées à la table.
    })
  }

//  définition de modèle Sequelize pour une table nommée "user_tests". 