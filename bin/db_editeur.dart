import 'package:mysql1/mysql1.dart';

import 'db_bdd.dart';
import 'editeur.dart';

class DBEditeur {
  static Future<Editeur> selectEditeur(
      ConnectionSettings settings, int idEditeur) async {
    Editeur edit = Editeur.vide();
    String requete =
        "SELECT * FROM EDITEUR WHERE idEditeur=$idEditeur AND EXISTS (SELECT idEditeur FROM EDITEUR WHERE idEditeur=$idEditeur);";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    edit = Editeur(reponse.first['idEditeur'], reponse.first['nomEditeur'],
        reponse.first['adresseEditeur'], reponse.first['villeEditeur']);
    return edit;
  }

  static Future<List<Editeur>> selectAllEditeurs(
      ConnectionSettings settings) async {
    List<Editeur> listeEdit = [];
    String requete = "SELECT * FROM EDITEUR;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    for (var row in reponse) {
      Editeur edit = Editeur(row['idEditeur'], row['nomEditeur'],
          row['adresseEditeur'], row['villeEditeur']);
      listeEdit.add(edit);
    }
    return listeEdit;
  }

  static Future<List<Editeur>> selectEditeursByVille(
      ConnectionSettings settings, String villeEditeur) async {
    List<Editeur> listeEdit = [];
    String requete =
        "SELECT * from EDITEUR WHERE villeEditeur='$villeEditeur';";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    for (var row in reponse) {
      Editeur edit = Editeur(row['idEditeur'], row['nomEditeur'],
          row['adresseEditeur'], row['villeEditeur']);
      listeEdit.add(edit);
    }
    return listeEdit;
  }

  static Future<List<Editeur>> selectEditeursByNom(
      ConnectionSettings settings, String nomEditeur) async {
    List<Editeur> listeEdit = [];
    String requete = "SELECT * from EDITEUR WHERE nomEditeur='$nomEditeur';";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    for (var row in reponse) {
      Editeur edit = Editeur(row['idEditeur'], row['nomEditeur'],
          row['adresseEditeur'], row['villeEditeur']);
      listeEdit.add(edit);
    }
    return listeEdit;
  }

  static Future<List<Editeur>> selectEditeursByNomProduit(
      ConnectionSettings settings, String nomProduit) async {
    List<Editeur> listeEdit = [];
    String requete =
        "SELECT EDITEUR.idEditeur, nomEditeur, adresseEditeur, villeEditeur from EDITEUR, PRODUIT WHERE nomProduit='$nomProduit' AND EDITEUR.idEditeur=PRODUIT.idEditeur;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    for (var row in reponse) {
      Editeur edit = Editeur(row['idEditeur'], row['nomEditeur'],
          row['adresseEditeur'], row['villeEditeur']);
      listeEdit.add(edit);
    }
    return listeEdit;
  }

  static Future<List<Editeur>> selectEditeursByTypeProduit(
      ConnectionSettings settings, String type) async {
    List<Editeur> listeEdit = [];
    String requete =
        "SELECT EDITEUR.idEditeur, nomEditeur, adresseEditeur, villeEditeur from EDITEUR, PRODUIT WHERE type='$type' AND EDITEUR.idEditeur=PRODUIT.idEditeur;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    for (var row in reponse) {
      Editeur edit = Editeur(row['idEditeur'], row['nomEditeur'],
          row['adresseEditeur'], row['villeEditeur']);
      listeEdit.add(edit);
    }
    return listeEdit;
  }

  static Future<List<int>> selectIdEditeurs(ConnectionSettings settings) async {
    List<int> listeIdEdit = [];
    String requete = "SELECT idEditeur from EDITEUR;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    for (var row in reponse) {
      int idEdit = row['idEditeur'];
      listeIdEdit.add(idEdit);
    }
    return listeIdEdit;
  }

  static Future<List<int>> selectIdEditeursByVille(
      ConnectionSettings settings, String villeEditeur) async {
    List<int> listeIdEdit = [];
    String requete =
        "SELECT idEditeur from EDITEUR WHERE villeEditeur='$villeEditeur';";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    for (var row in reponse) {
      int idEdit = row['idEditeur'];
      listeIdEdit.add(idEdit);
    }
    return listeIdEdit;
  }

  static Future<List<int>> selectIdEditeursByNom(
      ConnectionSettings settings, String nomEditeur) async {
    List<int> listeIdEdit = [];
    String requete =
        "SELECT idEditeur from EDITEUR WHERE nomEditeur='$nomEditeur';";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    for (var row in reponse) {
      int idEdit = row['idEditeur'];
      listeIdEdit.add(idEdit);
    }
    return listeIdEdit;
  }

  static Future<List<int>> selectIdEditeursByNomProduit(
      ConnectionSettings settings, String nomProduit) async {
    List<int> listeIdEdit = [];
    String requete =
        "SELECT EDITEUR.idEditeur from EDITEUR, PRODUIT WHERE nomProduit='$nomProduit' AND EDITEUR.idEditeur=PRODUIT.idEditeur;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    for (var row in reponse) {
      int idEdit = row['idEditeur'];
      listeIdEdit.add(idEdit);
    }
    return listeIdEdit;
  }

  static Future<List<int>> selectIdEditeursByTypeProduit(
      ConnectionSettings settings, String type) async {
    List<int> listeIdEdit = [];
    String requete =
        "SELECT EDITEUR.idEditeur from EDITEUR, PRODUIT WHERE type='$type' AND EDITEUR.idEditeur=PRODUIT.idEditeur;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    for (var row in reponse) {
      int idEdit = row['idEditeur'];
      listeIdEdit.add(idEdit);
    }
    return listeIdEdit;
  }

  static Future<void> insertEditeur(ConnectionSettings settings,
      String nomEditeur, String adresseEditeur, String villeEditeur) async {
    String requete =
        "INSERT INTO EDITEUR (nomEditeur, adresseEditeur, villeEditeur) VALUES('$nomEditeur', '$adresseEditeur', '$villeEditeur');";
    await LaBDFuret.executerRequete(settings, requete);
  }

  //update
  static Future<void> updateEditeur(ConnectionSettings settings, int idEditeur,
      String nomEditeur, String adresseEditeur, String villeEditeur) async {
    String requete =
        "UPDATE EDITEUR SET nomEditeur = '$nomEditeur', adresseEditeur = '$adresseEditeur', villeEditeur = '$villeEditeur' WHERE idEditeur = $idEditeur;";
    await LaBDFuret.executerRequete(settings, requete);
  }

  //delete
  static Future<void> deleteEditeur(
      ConnectionSettings settings, int idEditeur) async {
    String requete = "DELETE FROM EDITEUR WHERE idEditeur='$idEditeur'";
    await LaBDFuret.executerRequete(settings, requete);
  }

  //delete tous les Produits ayant pour Editeur un Editeur spécifique (et ainsi éviter les bugs pour supprimer un Editeur)
  static Future<void> deleteEditeurInPRODUIT(
      ConnectionSettings settings, int idEditeur) async {
    String requete = "DELETE FROM CREER WHERE idEditeur='$idEditeur'";
    await LaBDFuret.executerRequete(settings, requete);
  }

  //delete all
  static Future<void> deleteAllEditeurs(ConnectionSettings settings) async {
    String requete = "TRUNCATE TABLE EDITEUR;";
    await LaBDFuret.executerRequete(settings, requete);
  }

  // verifie l'existance d'un éditeur selon son ID
  static Future<bool> exist(ConnectionSettings settings, int idEditeur) async {
    bool exist = false;
    if (!(await DBEditeur.selectEditeur(settings, idEditeur)).estNull()) {
      exist = true;
    }
    return exist;
  }

  // getEtudiant
  static Future<Editeur> getEditeur(ConnectionSettings settings, int id) async {
    dynamic r = await selectEditeur(settings, id);
    ResultRow rr = r.first;
    return Editeur(rr['idEditeur'], rr['nomEditeur'], rr['adresseEditeur'],
        rr['villeEditeur']);
  }
}
