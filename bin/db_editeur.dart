import 'dart:developer';

import 'package:mysql1/mysql1.dart';

import 'furetbd.dart';
import 'editeur.dart';

class DBEditeur {
  static Future<Editeur> selectEditeur(int idEditeur) async {
    Editeur edit = Editeur.vide();
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete = "SELECT * FROM EDITEUR WHERE idEditeur=" +
            idEditeur.toString() +
            " AND EXISTS (SELECT idEditeur FROM EDITEUR WHERE idEditeur=" +
            idEditeur.toString() +
            " );";
        Results reponse = await conn.query(requete);
        edit = Editeur(reponse.first['idEditeur'], reponse.first['nomEditeur'],
            reponse.first['adresseEditeur'], reponse.first['villeEditeur']);
      } catch (e) {
        log(e.toString());
      }
      conn.close();
    } catch (e) {
      log(e.toString());
    }

    return edit;
  }

  static Future<List<Editeur>> selectAllEditeurs() async {
    List<Editeur> listeEdit = [];
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete = "SELECT * FROM EDITEUR;";
        Results reponse = await conn.query(requete);
        for (var row in reponse) {
          Editeur edit = Editeur(row['idEditeur'], row['nomEditeur'],
              row['adresseEditeur'], row['villeEditeur']);
          listeEdit.add(edit);
        }
      } catch (e) {
        log(e.toString());
      }
      conn.close();
    } catch (e) {
      log(e.toString());
    }

    return listeEdit;
  }

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
  }

  static Future<List<Editeur>> selectEditeursByNom(String nomEditeur) async {
    List<Editeur> listeEdit = [];
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete =
            "SELECT * from EDITEUR WHERE nomEditeur='" + nomEditeur + "';";
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
  }

  static Future<List<int>> selectIdEditeurs() async {
    List<int> listeIdEdit = [];
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete = "SELECT idEditeur from EDITEUR;";
        Results reponse = await conn.query(requete);
        for (var row in reponse) {
          int idEdit = row['idEditeur'];
          listeIdEdit.add(idEdit);
        }
      } catch (e) {
        print(e.toString());
      }
      conn.close();
    } catch (e) {
      print(e.toString());
    }
    return listeIdEdit;
  }

  static Future<List<int>> selectIdEditeursByVille(String villeEditeur) async {
    List<int> listeIdEdit = [];
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete = "SELECT idEditeur from EDITEUR WHERE villeEditeur='" +
            villeEditeur +
            "';";
        Results reponse = await conn.query(requete);
        for (var row in reponse) {
          int idEdit = row['idEditeur'];
          listeIdEdit.add(idEdit);
        }
      } catch (e) {
        print(e.toString());
      }
      conn.close();
    } catch (e) {
      print(e.toString());
    }
    return listeIdEdit;
  }

  static Future<List<int>> selectIdEditeursByNom(String nomEditeur) async {
    List<int> listeIdEdit = [];
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete = "SELECT idEditeur from EDITEUR WHERE nomEditeur='" +
            nomEditeur +
            "';";
        Results reponse = await conn.query(requete);
        for (var row in reponse) {
          int idEdit = row['idEditeur'];
          listeIdEdit.add(idEdit);
        }
      } catch (e) {
        print(e.toString());
      }
      conn.close();
    } catch (e) {
      print(e.toString());
    }
    return listeIdEdit;
  }

  static Future<void> insertEditeur(
      String nomEditeur, String adresseEditeur, String villeEditeur) async {
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete =
            "INSERT INTO EDITEUR (nomEditeur, adresseEditeur, villeEditeur) VALUES('" +
                nomEditeur +
                "', '" +
                adresseEditeur +
                "', '" +
                villeEditeur +
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

  //update
  static Future<void> updateEditeur(int idEditeur, String nomEditeur,
      String adresseEditeur, String villeEditeur) async {
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete = "UPDATE EDITEUR SET nomEditeur = '" +
            nomEditeur +
            "', adresseEditeur = '" +
            adresseEditeur +
            "', villeEditeur = '" +
            villeEditeur +
            "' WHERE idEditeur = " +
            idEditeur.toString() +
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
  static Future<void> deleteEditeur(int idEditeur) async {
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete = "DELETE FROM EDITEUR WHERE idEditeur='" +
            idEditeur.toString() +
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

  static Future<void> deleteEditeurByName(String nomEditeur) async {
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete =
            "DELETE FROM EDITEUR WHERE nomEditeur='" + nomEditeur + "';";
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
  static Future<void> deleteAllEditeurs() async {
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        String requete = "TRUNCATE TABLE EDITEUR;";
        await conn.query(requete);
      } catch (e) {
        log(e.toString());
      }
      conn.close();
    } catch (e) {
      log(e.toString());
    }
  }

  // verifie l'existance d'un éditeur selon son ID
  static Future<bool> exist(int idEditeur) async {
    bool exist = false;
    if (!(await DBEditeur.selectEditeur(idEditeur)).estNull()) {
      exist = true;
    }
    return exist;
  }

  // getEtudiant
  static Future<Editeur> getEditeur(int id) async {
    dynamic r = await selectEditeur(id);
    ResultRow rr = r.first;
    return Editeur(rr['idEditeur'], rr['nomEditeur'], rr['adresseEditeur'],
        rr['villeEditeur']);
  }
}
