import 'package:mysql1/mysql1.dart';

import 'furetbd.dart';

void main(List<String> args) async {
  ConnectionSettings settings = LaBDFuret.settingsLaBD();
  try {
    print("Début");
    MySqlConnection conn = await MySqlConnection.connect(settings);
    print("Connexion réussie !");
    //creerTableEditeur(conn);
    //creerTableAuteur(conn);
    //creerTableProduit(conn);
    creerTableCreer(conn);
    try {
      await conn.close();
      print("Connexion terminée !");
    } catch (e) {
      print("Erreur de déconnexion !");
    }
  } catch (e) {
    print(e.toString());
  }
}

Future<void> creerTableAuteur(
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

Future<void> creerTableEditeur(
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

Future<void> creerTableProduit(
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

Future<void> creerTableCreer(
  MySqlConnection conn,
) async {
  try {
    String requete = 'CREATE TABLE CREER (' +
        'idProduit int, ' +
        'idAuteur int, ' +
        'PRIMARY KEY(idProduit, idAuteur), ' +
        'FOREIGN KEY (idProduit) REFERENCES PRODUIT(idProduit), ' +
        'FOREIGN KEY (idAuteur) REFERENCES AUTEUR(idAuteur));';
    await conn.query(requete);
    print("Table CREER créée !");
  } catch (e) {
    print(e.toString());
  }
}
