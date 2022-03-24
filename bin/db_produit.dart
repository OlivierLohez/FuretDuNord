import 'dart:developer';

import 'package:mysql1/mysql1.dart';

import 'furetbd.dart';
import 'produit.dart';

class DBProduit {
  static Future<Produit> selectProduit(int idEditeur) async {
    Produit edit = Produit.vide();
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete = "SELECT * FROM PRODUIT WHERE idProduit=" +
            idEditeur.toString() +
            " AND EXISTS (SELECT idProduit FROM EDITEUR WHERE idProduit=" +
            idEditeur.toString() +
            " );";
        Results reponse = await conn.query(requete);
        edit = Produit(
            reponse.first['idProduit'],
            reponse.first['nomProduit'],
            reponse.first['stock'],
            reponse.first['dateParution'],
            reponse.first['type'],
            reponse.first['prix'],
            reponse.first['idEditeur']);
      } catch (e) {
        log(e.toString());
      }
      conn.close();
    } catch (e) {
      log(e.toString());
    }

    return edit;
  }

  static Future<List<Produit>> selectAllProduits() async {
    List<Produit> listeProd = [];
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete = "SELECT * FROM PRODUIT;";
        Results reponse = await conn.query(requete);
        for (var row in reponse) {
          Produit produit = Produit(
              row['idProduit'],
              row['nomProduit'],
              row['stock'],
              row['dateParution'],
              row['type'],
              row['prix'],
              row['idEditeur']);
          listeProd.add(produit);
        }
      } catch (e) {
        log(e.toString());
      }
      conn.close();
    } catch (e) {
      log(e.toString());
    }

    return listeProd;
  }
/*
  static Future<List<Editeur>> selectEditeursByVille(
      String villeEditeur) async {
    List<Editeur> listeEdit = [];
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete =
            "SELECT * from EDITEUR WHERE villeEditeur='" + villeEditeur + "';";
        Results reponse = await conn.query(requete);
        for (var row in reponse) {
          Editeur edit = Editeur(row['idEditeur'], row['nomEditeur'],
              row['adresseEditeur'], row['villeEditeur']);
          listeEdit.add(edit);
        }
      } catch (e) {
        print(e.toString());
      }
      conn.close();
    } catch (e) {
      print(e.toString());
    }
    return listeEdit;
  }*/

  static Future<void> insertProduit(String nomProduit, int stock,
      String dateParution, String type, double prix, int idEditeur) async {
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete =
            "INSERT INTO PRODUIT (nomProduit, stock, dateParution, type, prix, idEditeur) VALUES('" +
                nomProduit +
                "', " +
                stock.toString() +
                ", '" +
                dateParution +
                "', '" +
                type +
                "', " +
                prix.toString() +
                ", " +
                idEditeur.toString() +
                ");";
        await conn.query(requete);
      } catch (e) {
        log(e.toString());
      }
      conn.close();
    } catch (e) {
      log(e.toString());
    }
  }

  //update
  static Future<void> updateProduit(int idProduit, String nomProduit, int stock,
      String dateParution, String type, double prix, int idEditeur) async {
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete = "UPDATE PRODUIT SET nomProduit = '" +
            nomProduit +
            "', stock = " +
            stock.toString() +
            ", dateParution = '" +
            dateParution +
            "', type = '" +
            type +
            "', type = " +
            type.toString() +
            ", prix = " +
            prix.toString() +
            " WHERE idProduit = " +
            idProduit.toString() +
            ";";
        await conn.query(requete);
      } catch (e) {
        log(e.toString());
      }
      conn.close();
    } catch (e) {
      log(e.toString());
    }
  }

  //delete
  static Future<void> deleteProduit(int idProduit) async {
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete = "DELETE FROM PRODUIT WHERE idProduit='" +
            idProduit.toString() +
            "'";
        await conn.query(requete);
      } catch (e) {
        log(e.toString());
      }
      conn.close();
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> deleteProduitByName(String nomProduit) async {
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete =
            "DELETE FROM PRODUIT WHERE nomProduit='" + nomProduit + "';";
        await conn.query(requete);
      } catch (e) {
        print(e.toString());
      }
      conn.close();
    } catch (e) {
      print(e.toString());
    }
  }

  //delete all
  static Future<void> deleteAllProduits() async {
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete = "TRUNCATE TABLE PRODUIT;";
        await conn.query(requete);
      } catch (e) {
        log(e.toString());
      }
      conn.close();
    } catch (e) {
      log(e.toString());
    }
  }

  // verifie l'existance d'un produit selon son ID
  static Future<bool> exist(int idProduit) async {
    bool exist = false;
    if (!(await DBProduit.selectProduit(idProduit)).estNull()) {
      exist = true;
    }
    return exist;
  }

  // getProduit
  static Future<Produit> getEProduit(int id) async {
    dynamic r = await selectProduit(id);
    ResultRow rr = r.first;
    return Produit(rr['_idProduit'], rr['_nomProduit'], rr['_stock'],
        rr['_dateParution'], rr['_type'], rr['_prix'], rr['_idEditeur']);
  }
}
