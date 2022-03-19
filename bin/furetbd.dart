import 'package:mysql1/mysql1.dart';

class LaBDFuret {
  // Attribut
  static final String _host = 'localhost';
  static final int _port = 3306;
  static final String _user = 'dartFuret';
  static final String _password = 'btsinfo';
  static final String _db = 'dbFuret';

  // Constructeur
  //LaBDFuret();

  // Méthodes
  // On fait une méthode statique qui donne tous les paramètres nécessaires à la connexion sur la base de donnée
  static ConnectionSettings settingsLaBD() {
    ConnectionSettings settings = new ConnectionSettings(
      host: _host,
      port: _port,
      user: _user,
      password: _password,
      db: _db,
    );
    return settings;
  }

  static Future<void> creerTableAuteur(
    MySqlConnection conn,
  ) async {
    try {
      String requete = 'CREATE TABLE AUTEUR (' +
          'idAuteur int NOT NULL AUTO_INCREMENT PRIMARY KEY, ' +
          'nomAuteur varchar(30), ' +
          'prenomAuteur varchar(30));';
      await conn.query(requete);
      print("Table AUTEUR créée !");
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> creerTableEditeur(
    MySqlConnection conn,
  ) async {
    try {
      String requete = 'CREATE TABLE EDITEUR (' +
          'idEditeur int NOT NULL AUTO_INCREMENT PRIMARY KEY, ' +
          'nomEditeur varchar(30), ' +
          'adresseEditeur varchar(60), ' +
          'villeEditeur varchar(30));';
      await conn.query(requete);
      print("Table EDITEUR créée !");
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> creerTableProduit(
    MySqlConnection conn,
  ) async {
    try {
      String requete =
          "CREATE TABLE PRODUIT (idProduit int NOT NULL AUTO_INCREMENT PRIMARY KEY, nom varchar(30), stock int, dateParution datetime, type varchar(30), prix int, idEditeur int NOT NULL,FOREIGN KEY (idEditeur) REFERENCES EDITEUR(idEditeur));";
      await conn.query(requete);
      print("Table PRODUIT créée !");
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> creerTableCreer(
    MySqlConnection conn,
  ) async {
    try {
      String requete =
          'CREATE TABLE CREER (idProduit int NOT NULL, idAuteur int NOT NULL, PRIMARY KEY(idProduit, idAuteur), FOREIGN KEY (idProduit) REFERENCES PRODUIT(idProduit), FOREIGN KEY (idAuteur) REFERENCES AUTEUR(idAuteur));';
      await conn.query(requete);
      print("Table CREER créée !");
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> creerTables(
    MySqlConnection conn,
  ) async {
    LaBDFuret.creerTableEditeur(conn);
    LaBDFuret.creerTableAuteur(conn);
    LaBDFuret.creerTableProduit(conn);
    LaBDFuret.creerTableCreer(conn);
  }
}
