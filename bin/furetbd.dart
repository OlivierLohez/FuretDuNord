import 'dart:developer';

import 'package:mysql1/mysql1.dart';

import 'editeur.dart';

class LaBDFuret {
  // Attribut
  /*
  static final String _host = 'localhost';
  static final int _port = 3306;
  static final String _user = 'dartFuret';
  static final String _password = 'btsinfo';
  static final String _db = 'dbFuret';
  */

  // Méthodes
  static Future<void> createTables(ConnectionSettings settings) async {
    bool checkEditeur = false;
    bool checkAuteur = false;
    bool checkProduit = false;
    bool checkCreer = false;

    try {
      MySqlConnection conn = await MySqlConnection.connect(settings);
      try {
        String requete = "SHOW TABLES;";
        Results reponse = await conn.query(requete);
        for (var rows in reponse) {
          for (var fields in rows) {
            if (fields.toString() == "EDITEUR") {
              checkEditeur = true;
            }
            if (fields.toString() == "AUTEUR") {
              checkAuteur = true;
            }
            if (fields.toString() == "PRODUIT") {
              checkProduit = true;
            }
            if (fields.toString() == "CREER") {
              checkCreer = true;
            }
          }
        }
        if (!checkEditeur) {
          requete =
              'CREATE TABLE EDITEUR (idEditeur int NOT NULL AUTO_INCREMENT PRIMARY KEY, nomEditeur varchar(30), adresseEditeur varchar(60), villeEditeur varchar(30));';
          await conn.query(requete);
        }
        if (!checkAuteur) {
          requete =
              'CREATE TABLE AUTEUR (idAuteur int NOT NULL AUTO_INCREMENT PRIMARY KEY, nomAuteur varchar(30), prenomAuteur varchar(30));';
          await conn.query(requete);
        }
        if (!checkProduit) {
          requete =
              "CREATE TABLE PRODUIT (idProduit int NOT NULL AUTO_INCREMENT PRIMARY KEY, nomProduit varchar(30), stock int, dateParution varchar(30), type varchar(30), prix double, idEditeur int NOT NULL,FOREIGN KEY (idEditeur) REFERENCES EDITEUR(idEditeur));";
          await conn.query(requete);
        }
        if (!checkCreer) {
          requete =
              'CREATE TABLE CREER (idProduit int NOT NULL, idAuteur int NOT NULL, PRIMARY KEY(idProduit, idAuteur), FOREIGN KEY (idProduit) REFERENCES PRODUIT(idProduit), FOREIGN KEY (idAuteur) REFERENCES AUTEUR(idAuteur));';
          await conn.query(requete);
        }
      } catch (e) {
        print(e.toString());
      }
      conn.close();
    } catch (e) {
      print(e.toString());
    }
  }

  // retourne vrai si toute les tables sont créé, faux sinon
  static Future<bool> checkTables(ConnectionSettings settings) async {
    bool checkAll = false;
    bool checkEditeur = false;
    bool checkAuteur = false;
    bool checkProduit = false;
    bool checkCreer = false;
    try {
      MySqlConnection conn = await MySqlConnection.connect(settings);
      String requete = "SHOW TABLES;";
      try {
        Results reponse = await conn.query(requete);
        for (var rows in reponse) {
          for (var fields in rows) {
            if (fields.toString() == "EDITEUR") {
              checkEditeur = true;
            }
            if (fields.toString() == "AUTEUR") {
              checkAuteur = true;
            }
            if (fields.toString() == "PRODUIT") {
              checkProduit = true;
            }
            if (fields.toString() == "CREER") {
              checkCreer = true;
            }
          }
        }
      } catch (e) {
        print(e.toString());
      }
      conn.close();
    } catch (e) {
      print(e.toString());
    }

    if (checkEditeur && checkAuteur && checkProduit && checkCreer) {
      checkAll = true;
    }
    return checkAll;
  }

  // retourne la liste des noms des tables dans la BDD;
  static Future<List<String>> selectTables(ConnectionSettings settings) async {
    List<String> listTable = [];
    try {
      MySqlConnection conn = await MySqlConnection.connect(settings);
      try {
        String requete = "SHOW TABLES;";
        Results reponse = await conn.query(requete);
        for (var rows in reponse) {
          for (var fields in rows) {
            listTable.add(fields);
          }
        }
      } catch (e) {
        print(e.toString());
      }
      conn.close();
    } catch (e) {
      print(e.toString());
    }
    return listTable;
  }

  // permet de supprimer une table via son nom passé en parametre, si elle existe dans la database
  static Future<void> dropTable(
      ConnectionSettings settings, String table) async {
    try {
      MySqlConnection conn = await MySqlConnection.connect(settings);
      try {
        await conn.query("DROP TABLES IF EXISTS " + table + ";");
      } catch (e) {
        log(e.toString());
      }
      conn.close();
    } catch (e) {
      print(e.toString());
    }
  }

  // supprime toute les tables dans la DB
  static Future<void> dropAllTable(ConnectionSettings settings) async {
    try {
      MySqlConnection conn = await MySqlConnection.connect(settings);
      try {
        String requete = "SHOW TABLES;";
        Results reponse = await conn.query(requete);
        for (var rows in reponse) {
          for (var fields in rows) {
            await conn.query("DROP TABLES IF EXISTS " + fields + ";");
          }
        }
      } catch (e) {
        log(e.toString());
      }

      conn.close();
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<dynamic> executerRequete(
      ConnectionSettings settings, String requete) async {
    Results? reponse;
    try {
      MySqlConnection conn = await MySqlConnection.connect(settings);
      try {
        reponse = await conn.query(requete);
      } catch (e) {
        log(e.toString());
      }
      conn.close();
    } catch (e) {
      log(e.toString());
    }
    return reponse;
  }
}
