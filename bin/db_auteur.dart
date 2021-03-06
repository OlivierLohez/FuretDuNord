import 'package:mysql1/mysql1.dart';
import 'auteur.dart';
import 'db_bdd.dart';

class DBAuteur {
  static Future<Auteur> selectAuteur(
      ConnectionSettings settings, int idAuteur) async {
    Auteur edit = Auteur.vide();
    String requete =
        "SELECT * FROM AUTEUR WHERE idAuteur=$idAuteur AND EXISTS (SELECT idAuteur FROM EDITEUR WHERE idAuteur=$idAuteur );";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    edit = Auteur(reponse.first['idAuteur'], reponse.first['nomAuteur'],
        reponse.first['prenomAuteur']);
    return edit;
  }

  static Future<List<Auteur>> selectAllAuteurs(
      ConnectionSettings settings) async {
    List<Auteur> listeAut = [];
    String requete = "SELECT * FROM AUTEUR;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    for (var row in reponse) {
      Auteur aut =
          Auteur(row['idAuteur'], row['nomAuteur'], row['prenomAuteur']);
      listeAut.add(aut);
    }
    return listeAut;
  }

  static Future<List<Auteur>> selectAuteursByPrenom(
      ConnectionSettings settings, String prenomAuteur) async {
    List<Auteur> listeAut = [];
    String requete = "SELECT * from AUTEUR WHERE prenomAuteur='$prenomAuteur';";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    if (reponse.isEmpty) {
      listeAut.add(Auteur.vide());
    } else {
      for (var row in reponse) {
        Auteur edit =
            Auteur(row['idEditeur'], row['nomEditeur'], row['prenomAuteur']);
        listeAut.add(edit);
      }
    }
    return listeAut;
  }

  static Future<List<Auteur>> selectAuteursByNom(
      ConnectionSettings settings, String nomAuteur) async {
    List<Auteur> listeAut = [];
    String requete = "SELECT * from AUTEUR WHERE nomAuteur='$nomAuteur';";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    if (reponse.isEmpty) {
      listeAut.add(Auteur.vide());
    } else {
      for (var row in reponse) {
        Auteur aut =
            Auteur(row['idAuteur'], row['nomAuteur'], row['prenomAuteur']);
        listeAut.add(aut);
      }
    }
    return listeAut;
  }

  static Future<List<Auteur>> selectAuteursByNomProduit(
      ConnectionSettings settings, String nomProduit) async {
    List<Auteur> listeAut = [];
    String requete =
        "SELECT AUTEUR.idAuteur, nomAuteur, prenomAuteur from AUTEUR, CREER, PRODUIT WHERE nomProduit='$nomProduit' AND AUTEUR.idAuteur=CREER.idAuteur AND CREER.idProduit=PRODUIT.idProduit;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    if (reponse.isEmpty) {
      listeAut.add(Auteur.vide());
    } else {
      for (var row in reponse) {
        Auteur aut =
            Auteur(row['idAuteur'], row['nomAuteur'], row['prenomAuteur']);
        listeAut.add(aut);
      }
    }
    return listeAut;
  }

  static Future<List<Auteur>> selectAuteursByTypeProduit(
      ConnectionSettings settings, String type) async {
    List<Auteur> listeAut = [];
    String requete =
        "SELECT AUTEUR.idAuteur, nomAuteur, prenomAuteur from AUTEUR, CREER, PRODUIT WHERE type='$type' AND AUTEUR.idAuteur=CREER.idAuteur AND CREER.idProduit=PRODUIT.idProduit;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    if (reponse.isEmpty) {
      listeAut.add(Auteur.vide());
    } else {
      for (var row in reponse) {
        Auteur aut =
            Auteur(row['idAuteur'], row['nomAuteur'], row['prenomAuteur']);
        listeAut.add(aut);
      }
    }

    return listeAut;
  }

  static Future<List<int>> selectIdAuteurs(ConnectionSettings settings) async {
    List<int> listeIdAut = [];
    String requete = "SELECT idAuteur from AUTEUR;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    for (var row in reponse) {
      int idAut = row['idAuteur'];
      listeIdAut.add(idAut);
    }
    return listeIdAut;
  }

  static Future<List<int>> selectIdAuteursByPrenom(
      ConnectionSettings settings, String prenomAuteur) async {
    List<int> listeIdAut = [];
    String requete =
        "SELECT idAuteur from AUTEUR WHERE prenomAuteur='$prenomAuteur';";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    for (var row in reponse) {
      int idAut = row['idAuteur'];
      listeIdAut.add(idAut);
    }
    return listeIdAut;
  }

  static Future<List<int>> selectIdAuteursByNom(
      ConnectionSettings settings, String nomAuteur) async {
    List<int> listeIdAut = [];
    String requete =
        "SELECT idAuteur from AUTEUR WHERE nomAuteur='$nomAuteur';";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    for (var row in reponse) {
      int idAut = row['idAuteur'];
      listeIdAut.add(idAut);
    }
    return listeIdAut;
  }

  static Future<List<int>> selectIdAuteursByNomProduit(
      ConnectionSettings settings, String nomProduit) async {
    List<int> listeIdAut = [];
    String requete =
        "SELECT AUTEUR.idAuteur from AUTEUR, CREER, PRODUIT WHERE nomProduit='$nomProduit' AND AUTEUR.idAuteur=CREER.idAuteur AND CREER.idProduit=PRODUIT.idProduit;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    for (var row in reponse) {
      int idAut = row['idAuteur'];
      listeIdAut.add(idAut);
    }
    return listeIdAut;
  }

  static Future<List<int>> selectIdAuteursByTypeProduit(
      ConnectionSettings settings, String type) async {
    List<int> listeIdAut = [];
    String requete =
        "SELECT AUTEUR.idAuteur from AUTEUR, CREER, PRODUIT WHERE type='$type' AND AUTEUR.idAuteur=CREER.idAuteur AND CREER.idProduit=PRODUIT.idProduit;";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    for (var row in reponse) {
      int idAut = row['idAuteur'];
      listeIdAut.add(idAut);
    }
    return listeIdAut;
  }

  static Future<int> selectIdLastAuteur(ConnectionSettings settings) async {
    String requete =
        "SELECT * FROM AUTEUR WHERE idAuteur=(SELECT MAX(idAuteur) FROM AUTEUR);";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    int idAuteur = reponse.first['idAuteur'];
    return idAuteur;
  }

  static Future<void> insertAuteur(ConnectionSettings settings,
      String nomAuteur, String prenomAuteur) async {
    String requete =
        "INSERT INTO AUTEUR (nomAuteur, prenomAuteur) VALUES('$nomAuteur', '$prenomAuteur');";
    await LaBDFuret.executerRequete(settings, requete);
  }

  static Future<void> insertAuteurtInCreer(
      ConnectionSettings settings, int idProduit, int idAuteur) async {
    String requete =
        "INSERT INTO CREER (idProduit, idAuteur) VALUES($idProduit, $idAuteur);";
    await LaBDFuret.executerRequete(settings, requete);
  }

  //update auteur
  static Future<void> updateAuteur(ConnectionSettings settings, int idAuteur,
      String nomAuteur, String prenomAuteur) async {
    String requete =
        "UPDATE AUTEUR SET nomAuteur = '$nomAuteur', prenomAuteur = '$prenomAuteur' WHERE idAuteur = $idAuteur;";
    await LaBDFuret.executerRequete(settings, requete);
  }

  //delete
  static Future<void> deleteAuteur(
      ConnectionSettings settings, int idAuteur) async {
    String requete = "DELETE FROM AUTEUR WHERE idAuteur=$idAuteur;";
    await LaBDFuret.executerRequete(settings, requete);
  }

  static Future<void> deleteAuteurInCreer(
      ConnectionSettings settings, int idAuteur) async {
    String requete = "DELETE FROM CREER WHERE idAuteur=$idAuteur;";
    await LaBDFuret.executerRequete(settings, requete);
  }

  //delete all auteur
  static Future<void> deleteAllAuteurs(ConnectionSettings settings) async {
    String requete = "TRUNCATE TABLE AUTEUR;";
    await LaBDFuret.executerRequete(settings, requete);
  }

  static Future<bool> exist(ConnectionSettings settings, int idAuteur) async {
    bool exist = false;
    if (!(await DBAuteur.selectAuteur(settings, idAuteur)).estNull()) {
      exist = true;
    }
    return exist;
  }

  //getAuteur
  static Future<Auteur> getAuteur(ConnectionSettings settings, int id) async {
    dynamic r = await selectAuteur(settings, id);
    ResultRow rr = r.first;
    return Auteur(rr['idAuteur'], rr['nomAuteur'], rr['prenomAuteur']);
  }
}
