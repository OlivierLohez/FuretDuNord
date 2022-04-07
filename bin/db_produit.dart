import 'package:mysql1/mysql1.dart';

import 'db_auteur.dart';
import 'db_bdd.dart';
import 'produit.dart';

class DBProduit {
  static Future<Produit> selectProduit(
      ConnectionSettings settings, int idProduit) async {
    Produit produit = Produit.vide();
    String requete =
        "SELECT * FROM PRODUIT WHERE idProduit=$idProduit AND EXISTS (SELECT idProduit FROM EDITEUR WHERE idProduit=$idProduit);";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    produit = Produit(
        reponse.first['idProduit'],
        reponse.first['nomProduit'],
        reponse.first['stock'],
        reponse.first['dateParution'],
        reponse.first['type'],
        reponse.first['prix'],
        reponse.first['idEditeur']);
    return produit;
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
    if (reponse.isEmpty) {
      listeProd.add(Produit.vide());
    } else {
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
    }
    return listeProd;
  }

  static Future<List<Produit>> selectProduitsByStock(
      ConnectionSettings settings, int stock) async {
    List<Produit> listeProd = [];
    String requete = "SELECT * from PRODUIT WHERE stock=$stock;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    if (reponse.isEmpty) {
      listeProd.add(Produit.vide());
    } else {
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
    }
    return listeProd;
  }

  static Future<List<Produit>> selectProduitsByDateParution(
      ConnectionSettings settings, String dateParution) async {
    List<Produit> listeProd = [];
    String requete = "SELECT * from PRODUIT WHERE dateParution=$dateParution;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    if (reponse.isEmpty) {
      listeProd.add(Produit.vide());
    } else {
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
    }
    return listeProd;
  }

  static Future<List<Produit>> selectProduitsByType(
      ConnectionSettings settings, String type) async {
    List<Produit> listeProd = [];
    String requete = "SELECT * from PRODUIT WHERE type=$type;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    if (reponse.isEmpty) {
      listeProd.add(Produit.vide());
    } else {
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
    }
    return listeProd;
  }

  static Future<List<Produit>> selectProduitsByPrix(
      ConnectionSettings settings, double prix) async {
    List<Produit> listeProd = [];
    String requete = "SELECT * from PRODUIT WHERE prix=$prix;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    if (reponse.isEmpty) {
      listeProd.add(Produit.vide());
    } else {
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
    }
    return listeProd;
  }

  static Future<List<Produit>> selectProduitsByNomEditeur(
      ConnectionSettings settings, String nomEditeur) async {
    List<Produit> listeProd = [];
    String requete =
        "SELECT PRODUIT.idProduit, nomProduit, stock, dateParution, type, prix, PRODUIT.idEditeur from EDITEUR, PRODUIT WHERE nomEditeur='$nomEditeur' AND EDITEUR.idEditeur=PRODUIT.idEditeur;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    if (reponse.isEmpty) {
      listeProd.add(Produit.vide());
    } else {
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
    }
    return listeProd;
  }

  static Future<List<Produit>> selectProduitsByVilleEditeur(
      ConnectionSettings settings, String villeEditeur) async {
    List<Produit> listeProd = [];
    String requete =
        "SELECT PRODUIT.idProduit, nomProduit, stock, dateParution, type, prix, PRODUIT.idEditeur from EDITEUR, PRODUIT WHERE villeEditeur='$villeEditeur' AND EDITEUR.idEditeur=PRODUIT.idEditeur;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    if (reponse.isEmpty) {
      listeProd.add(Produit.vide());
    } else {
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
    }
    return listeProd;
  }

  static Future<List<Produit>> selectProduitsByNomAuteur(
      ConnectionSettings settings, String nomAuteur) async {
    List<Produit> listeProd = [];
    String requete =
        "SELECT PRODUIT.idProduit, nomProduit, stock, dateParution, type, prix, PRODUIT.idEditeur from AUTEUR, PRODUIT, CREER WHERE nomAuteur='$nomAuteur' AND AUTEUR.idAuteur=CREER.idAuteur AND CREER.idProduit=PRODUIT.idProduit;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    if (reponse.isEmpty) {
      listeProd.add(Produit.vide());
    } else {
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

  static Future<List<int>> selectIdProduitsByNomAuteur(
      ConnectionSettings settings, String nomAuteur) async {
    await DBAuteur.selectIdAuteurs(settings);
    List<int> listeIdProduit = [];
    String requete =
        "SELECT PRODUIT.idProduit from AUTEUR, PRODUIT, CREER WHERE nomAuteur='$nomAuteur' AND AUTEUR.idAuteur=CREER.idAuteur AND CREER.idProduit=PRODUIT.idProduit;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    for (var row in reponse) {
      int idProduit = row['idProduit'];
      listeIdProduit.add(idProduit);
    }
    return listeIdProduit;
  }

  static Future<int> selectIdLastProduit(ConnectionSettings settings) async {
    String requete =
        "SELECT * FROM PRODUIT WHERE idProduit=(SELECT MAX(idProduit) FROM PRODUIT);";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    int idProduit = reponse.first['idProduit'];
    return idProduit;
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

  static Future<void> insertProduitInCreer(
      ConnectionSettings settings, int idProduit, int idAuteur) async {
    String requete =
        "INSERT INTO CREER (idProduit, idAuteur) VALUES($idProduit, $idAuteur);";
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
        "UPDATE PRODUIT SET nomProduit = '$nomProduit', stock = $stock, dateParution = '$dateParution', type = '$type', prix = $prix WHERE idProduit = $idProduit;";
    await LaBDFuret.executerRequete(settings, requete);
  }

  //delete
  static Future<void> deleteProduit(
      ConnectionSettings settings, int idProduit) async {
    String requete = "DELETE FROM PRODUIT WHERE idProduit=$idProduit;";
    await LaBDFuret.executerRequete(settings, requete);
  }

  static Future<void> deleteProduitInCreer(
      ConnectionSettings settings, int idProduit) async {
    String requete = "DELETE FROM CREER WHERE idProduit=$idProduit;";
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
