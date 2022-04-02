import 'package:mysql1/mysql1.dart';

import 'furetbd.dart';
import 'produit.dart';

class DBProduit {
  static Future<Produit> selectProduit(
      ConnectionSettings settings, int idEditeur) async {
    Produit edit = Produit.vide();
    String requete =
        "SELECT * FROM PRODUIT WHERE idProduit=$idEditeur AND EXISTS (SELECT idProduit FROM EDITEUR WHERE idProduit=$idEditeur);";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    edit = Produit(
        reponse.first['idProduit'],
        reponse.first['nomProduit'],
        reponse.first['stock'],
        reponse.first['dateParution'],
        reponse.first['type'],
        reponse.first['prix'],
        reponse.first['idEditeur']);
    return edit;
  }

  static Future<List<Produit>> selectAllProduits(
      ConnectionSettings settings) async {
    List<Produit> listeProd = [];
    String requete = "SELECT * FROM PRODUIT;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
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
    return listeProd;
  }

  static Future<List<Produit>> selectProduitsByNom(
      ConnectionSettings settings, String nomProduit) async {
    List<Produit> listeProd = [];

    String requete = "SELECT * from PRODUIT WHERE nomProduit='$nomProduit';";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
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
    return listeProd;
  }

  static Future<List<Produit>> selectProduitsByStock(
      ConnectionSettings settings, int stock) async {
    List<Produit> listeProd = [];
    String requete = "SELECT * from PRODUIT WHERE stock=$stock;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
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
    return listeProd;
  }

  static Future<List<Produit>> selectProduitsByDateParution(
      ConnectionSettings settings, String dateParution) async {
    List<Produit> listeProd = [];
    String requete = "SELECT * from PRODUIT WHERE dateParution=$dateParution;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
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
    return listeProd;
  }

  static Future<List<Produit>> selectProduitsByType(
      ConnectionSettings settings, String type) async {
    List<Produit> listeProd = [];
    String requete = "SELECT * from PRODUIT WHERE type=$type;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
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
    return listeProd;
  }

  static Future<List<Produit>> selectProduitsByPrix(
      ConnectionSettings settings, double prix) async {
    List<Produit> listeProd = [];
    String requete = "SELECT * from PRODUIT WHERE prix=$prix;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
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
    return listeProd;
  }

  static Future<List<Produit>> selectProduitsByNomEditeur(
      ConnectionSettings settings, String nomEditeur) async {
    List<Produit> listeProd = [];
    String requete =
        "SELECT * from EDITEUR, PRODUIT WHERE nomEditeur='$nomEditeur' AND EDITEUR.idEditeur=PRODUIT.idEditeur;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
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
    return listeProd;
  }

  static Future<List<Produit>> selectProduitsByVilleEditeur(
      ConnectionSettings settings, String villeEditeur) async {
    List<Produit> listeProd = [];
    String requete =
        "SELECT * from EDITEUR, PRODUIT WHERE villeEditeur='$villeEditeur' AND EDITEUR.idEditeur=PRODUIT.idEditeur;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
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
    return listeProd;
  }

  static Future<List<int>> selectIdProduits(ConnectionSettings settings) async {
    List<int> listeIdProduit = [];
    String requete = "SELECT idProduit from PRODUIT;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    for (var row in reponse) {
      int idProduit = row['idProduit'];
      listeIdProduit.add(idProduit);
    }
    return listeIdProduit;
  }

  static Future<List<int>> selectIdProduitsByNom(
      ConnectionSettings settings, String nomProduit) async {
    List<int> listeIdProduit = [];
    String requete = "SELECT idProduit from PRODUIT WHERE stock='$nomProduit';";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    for (var row in reponse) {
      int idProduit = row['idProduit'];
      listeIdProduit.add(idProduit);
    }
    return listeIdProduit;
  }

  static Future<List<int>> selectIdProduitsByStock(
      ConnectionSettings settings, int stock) async {
    List<int> listeIdProduit = [];
    String requete = "SELECT idProduit from PRODUIT WHERE stock=$stock;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    for (var row in reponse) {
      int idProduit = row['idProduit'];
      listeIdProduit.add(idProduit);
    }
    return listeIdProduit;
  }

  static Future<List<int>> selectIdProduitsByType(
      ConnectionSettings settings, String type) async {
    List<int> listeIdProduit = [];
    String requete = "SELECT idProduit from PRODUIT WHERE type='$type';";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    for (var row in reponse) {
      int idProduit = row['idProduit'];
      listeIdProduit.add(idProduit);
    }
    return listeIdProduit;
  }

  static Future<List<int>> selectIdProduitsByPrix(
      ConnectionSettings settings, double prix) async {
    List<int> listeIdProduit = [];
    String requete = "SELECT idProduit from PRODUIT WHERE prix=$prix;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    for (var row in reponse) {
      int idProduit = row['idProduit'];
      listeIdProduit.add(idProduit);
    }
    return listeIdProduit;
  }

  static Future<List<int>> selectIdProduitsByNomEditeur(
      ConnectionSettings settings, String nomEditeur) async {
    List<int> listeIdProduit = [];
    String requete =
        "SELECT idProduit from EDITEUR, PRODUIT WHERE nomEditeur='$nomEditeur' AND EDITEUR.idEditeur=PRODUIT.idEditeur;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    for (var row in reponse) {
      int idProduit = row['idProduit'];
      listeIdProduit.add(idProduit);
    }
    return listeIdProduit;
  }

  static Future<List<int>> selectIdProduitsByVilleEditeur(
      ConnectionSettings settings, String villeEditeur) async {
    List<int> listeIdProduit = [];
    String requete =
        "SELECT idProduit from EDITEUR, PRODUIT WHERE villeEditeur='$villeEditeur' AND EDITEUR.idEditeur=PRODUIT.idEditeur;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    for (var row in reponse) {
      int idProduit = row['idProduit'];
      listeIdProduit.add(idProduit);
    }
    return listeIdProduit;
  }

  static Future<void> insertProduit(
      ConnectionSettings settings,
      String nomProduit,
      int stock,
      String dateParution,
      String type,
      double prix,
      int idEditeur) async {
    String requete =
        "INSERT INTO PRODUIT (nomProduit, stock, dateParution, type, prix, idEditeur) VALUES('$nomProduit', $stock, '$dateParution', '$type', $prix, $idEditeur);";
    await LaBDFuret.executerRequete(settings, requete);
  }

  //update
  static Future<void> updateProduit(
      ConnectionSettings settings,
      int idProduit,
      String nomProduit,
      int stock,
      String dateParution,
      String type,
      double prix,
      int idEditeur) async {
    String requete =
        "UPDATE PRODUIT SET nomProduit = '$nomProduit', stock = $stock, dateParution = '$dateParution', type = '$type', type = $type, prix = $prix WHERE idProduit = $idProduit;";
    await LaBDFuret.executerRequete(settings, requete);
  }

  //delete
  static Future<void> deleteProduit(
      ConnectionSettings settings, int idProduit) async {
    String requete = "DELETE FROM PRODUIT WHERE idProduit='$idProduit'";
    await LaBDFuret.executerRequete(settings, requete);
  }

  static Future<void> deleteProduitByName(
      ConnectionSettings settings, String nomProduit) async {
    String requete = "DELETE FROM PRODUIT WHERE nomProduit='$nomProduit';";
    await LaBDFuret.executerRequete(settings, requete);
  }

  //delete all
  static Future<void> deleteAllProduits(ConnectionSettings settings) async {
    String requete = "TRUNCATE TABLE PRODUIT;";
    await LaBDFuret.executerRequete(settings, requete);
  }

  // verifie l'existance d'un produit selon son ID
  static Future<bool> exist(ConnectionSettings settings, int idProduit) async {
    bool exist = false;
    if (!(await DBProduit.selectProduit(settings, idProduit)).estNull()) {
      exist = true;
    }
    return exist;
  }

  // getProduit
  static Future<Produit> getEProduit(
      ConnectionSettings settings, int id) async {
    dynamic r = await selectProduit(settings, id);
    ResultRow rr = r.first;
    return Produit(rr['_idProduit'], rr['_nomProduit'], rr['_stock'],
        rr['_dateParution'], rr['_type'], rr['_prix'], rr['_idEditeur']);
  }
}
