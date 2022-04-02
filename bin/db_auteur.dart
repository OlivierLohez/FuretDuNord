import 'package:mysql1/mysql1.dart';
import 'auteur.dart';
import 'furetbd.dart';

class DBAuteur {
  static Future<Auteur> selectAuteur(
      ConnectionSettings settings, int idAuteur) async {
    Auteur edit = Auteur.vide();
    String requete =
        "SELECT * FROM AUTEUR WHERE idAuteur=$idAuteur AND EXISTS (SELECT idEditeur FROM EDITEUR WHERE idEditeur=$idAuteur );";
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
    String requete = "SELECT * from AUTEUR WHERE villeAuteur='$prenomAuteur';";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    for (var row in reponse) {
      Auteur edit =
          Auteur(row['idEditeur'], row['nomEditeur'], row['prenomAuteur']);
      listeAut.add(edit);
    }
    return listeAut;
  }

  static Future<List<Auteur>> selectAuteursByNom(
      ConnectionSettings settings, String nomAuteur) async {
    List<Auteur> listeAut = [];
    String requete = "SELECT * from AUTEUR WHERE nomAuteur='$nomAuteur';";
    Results reponse = await LaBDFuret.executerRequete(settings, requete);
    for (var row in reponse) {
      Auteur aut =
          Auteur(row['idAuteur'], row['nomAuteur'], row['prenomAuteur']);
      listeAut.add(aut);
    }
    return listeAut;
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

  static Future<void> insertAuteur(ConnectionSettings settings,
      String nomAuteur, String prenomAuteur) async {
    String requete =
        "INSERT INTO AUTEUR (nomAuteur, prenomAuteur) VALUES('$nomAuteur', '$prenomAuteur');";
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

  static Future<void> deleteAuteurByName(
      ConnectionSettings settings, String nomAuteur) async {
    String requete = "DELETE FROM AUTEUR WHERE nomAuteur='$nomAuteur';";
    await LaBDFuret.executerRequete(settings, requete);
  }

  static Future<void> deleteAuteurByPrenom(
      ConnectionSettings settings, String prenomAuteur) async {
    String requete = "DELETE FROM AUTEUR WHERE prenomAuteur='$prenomAuteur';";
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
