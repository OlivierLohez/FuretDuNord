import 'dart:developer';

import 'package:mysql1/mysql1.dart';
import 'auteur.dart';
import 'furetbd.dart';

class DBAuteur {
  static Future<Auteur> selectAuteur(int idAuteur) async {
    Auteur edit = Auteur.vide();
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete = "SELECT * FROM AUTEUR WHERE idAuteur=" +
            idAuteur.toString() +
            " AND EXISTS (SELECT idEditeur FROM EDITEUR WHERE idEditeur=" +
            idAuteur.toString() +
            " );";
        Results reponse = await conn.query(requete);
        edit = Auteur(reponse.first['idAuteur'], reponse.first['nomAuteur'],
            reponse.first['prenomAuteur']);
      } catch (e) {
        log(e.toString());
      }
      conn.close();
    } catch (e) {
      log(e.toString());
    }

    return edit;
  }

  static Future<List<Auteur>> selectAllAuteurs() async {
    List<Auteur> listeAut = [];
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete = "SELECT * FROM EDITEUR;";
        Results reponse = await conn.query(requete);
        for (var row in reponse) {
          Auteur edit =
              Auteur(row['idAuteur'], row['nomAuteur'], row['prenomAuteur']);
          listeAut.add(edit);
        }
      } catch (e) {
        log(e.toString());
      }
      conn.close();
    } catch (e) {
      log(e.toString());
    }

    return listeAut;
  }

  static Future<List<Auteur>> selectAuteursByPrenom(String prenomAuteur) async {
    List<Auteur> listeAut = [];
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete =
            "SELECT * from AUTEUR WHERE villeAuteur='" + prenomAuteur + "';";
        Results reponse = await conn.query(requete);
        for (var row in reponse) {
          Auteur edit =
              Auteur(row['idEditeur'], row['nomEditeur'], row['prenomAuteur']);
          listeAut.add(edit);
        }
      } catch (e) {
        print(e.toString());
      }
      conn.close();
    } catch (e) {
      print(e.toString());
    }
    return listeAut;
  }

  static Future<List<Auteur>> selectAuteursByNom(String nomAuteur) async {
    List<Auteur> listeAut = [];
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete =
            "SELECT * from AUTEUR WHERE nomAuteur='" + nomAuteur + "';";
        Results reponse = await conn.query(requete);
        for (var row in reponse) {
          Auteur aut =
              Auteur(row['idAuteur'], row['nomAuteur'], row['prenomAuteur']);
          listeAut.add(aut);
        }
      } catch (e) {
        print(e.toString());
      }
      conn.close();
    } catch (e) {
      print(e.toString());
    }
    return listeAut;
  }

  static Future<List<int>> selectIdAuteursByPrenom(String prenomAuteur) async {
    List<int> listeIdAut = [];
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete = "SELECT idAuteur from AUTEUR WHERE prenomAuteur='" +
            prenomAuteur +
            "';";
        Results reponse = await conn.query(requete);
        for (var row in reponse) {
          int idAut = row['idAuteur'];
          listeIdAut.add(idAut);
        }
      } catch (e) {
        print(e.toString());
      }
      conn.close();
    } catch (e) {
      print(e.toString());
    }
    return listeIdAut;
  }

  static Future<List<int>> selectIdAuteursByNom(String nomAuteur) async {
    List<int> listeIdAut = [];
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete =
            "SELECT idAuteur from AUTEUR WHERE nomAuteur='" + nomAuteur + "';";
        Results reponse = await conn.query(requete);
        for (var row in reponse) {
          int idAut = row['idAuteur'];
          listeIdAut.add(idAut);
        }
      } catch (e) {
        print(e.toString());
      }
      conn.close();
    } catch (e) {
      print(e.toString());
    }
    return listeIdAut;
  }

  static Future<void> insertAuteur(
      String nomAuteur, String prenomAuteur) async {
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete =
            "INSERT INTO AUTEUR (nomAuteur, prenomAuteur) VALUES('" +
                nomAuteur +
                "', '" +
                prenomAuteur +
                "');";
        await conn.query(requete);
      } catch (e) {
        log(e.toString());
      }
      conn.close();
    } catch (e) {
      log(e.toString());
    }
  }

  //update auteur
  static Future<void> updateAuteur(
      int idAuteur, String nomAuteur, String prenomAuteur) async {
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete = "UPDATE AUTEUR SET nomAuteur = '" +
            nomAuteur +
            "', prenomAuteur = '" +
            prenomAuteur +
            "' WHERE idAuteur = " +
            idAuteur.toString() +
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
  static Future<void> deleteAuteur(int idAuteur) async {
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete =
            "DELETE FROM AUTEUR WHERE idAuteur='" + idAuteur.toString() + "'";
        await conn.query(requete);
      } catch (e) {
        log(e.toString());
      }
      conn.close();
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> deleteAuteurByName(String nomAuteur) async {
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete =
            "DELETE FROM AUTEUR WHERE nomAuteur='" + nomAuteur + "';";
        await conn.query(requete);
      } catch (e) {
        print(e.toString());
      }
      conn.close();
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> deleteAuteurByPrenom(String prenomAuteur) async {
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete =
            "DELETE FROM AUTEUR WHERE prenomAuteur='" + prenomAuteur + "';";
        await conn.query(requete);
      } catch (e) {
        print(e.toString());
      }
      conn.close();
    } catch (e) {
      print(e.toString());
    }
  }

  //delete all auteur
  static Future<void> deleteAllAuteurs() async {
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete = "TRUNCATE TABLE AUTEUR;";
        await conn.query(requete);
      } catch (e) {
        log(e.toString());
      }
      conn.close();
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<bool> exist(int idAuteur) async {
    bool exist = false;
    if (!(await DBAuteur.selectAuteur(idAuteur)).estNull()) {
      exist = true;
    }
    return exist;
  }

  //getAuteur
  static Future<Auteur> getAuteur(int id) async {
    dynamic r = await selectAuteur(id);
    ResultRow rr = r.first;
    return Auteur(rr['idAuteur'], rr['nomAuteur'], rr['prenomAuteur']);
  }
}
