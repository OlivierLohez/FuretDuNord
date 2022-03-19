import 'dart:io';

import 'package:mysql1/mysql1.dart';

import 'editeur.dart';
import 'ihm.dart';

class IHMEditeur {
  // Methodes
  static Future<void> insererEditeur(
      MySqlConnection conn, Editeur lEditeur) async {
    try {
      String requete =
          "INSERT INTO EDITEUR (nomEditeur,adresseEditeur,villeEditeur) VALUES('" +
              lEditeur.getNomEditeur() +
              "','" +
              lEditeur.getAdresseEditeur() +
              "','" +
              lEditeur.getVilleEditeur() +
              "') ;";
      await conn.query(requete);
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> demandeInsererEditeur(
    MySqlConnection conn,
  ) async {
    print("Vous voulez saisir un éditeur.");
    print("Veuillez saisir son nom");
    String nomEditeur = IHM.saisirStringRec();
    print("Veuillez saisir sa ville");
    String villeEditeur = IHM.saisirStringRec();
    print("Veuillez saisir son adresse");
    String adresseEditeur = IHM.saisirStringRec();
    IHMEditeur.insererEditeur(
        conn, new Editeur.sansId(nomEditeur, adresseEditeur, villeEditeur));
  }

  static Future<void> supprimerEditeurNom(
      MySqlConnection conn, String nomEditeur) async {
    try {
      String requete =
          "DELETE FROM EDITEUR WHERE nomEditeur='" + nomEditeur + "';";
      await conn.query(requete);
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> demandeSupprimerEditeurNom(
    MySqlConnection conn,
  ) async {
    print("Vous voulez supprimer un éditeur.");
    print("Veuillez saisir son nom");
    IHMEditeur.supprimerEditeurNom(conn, IHM.saisirStringRec());
  }

  static Future<void> selectAllEditeur(MySqlConnection conn) async {
    try {
      String requete = "SELECT * from EDITEUR;";
      Results response = await conn.query(requete);
      for (var row in response) {
        int i = 0;
        for (var field in row) {
          if (i == row.length - 1) {
            print(field.toString());
          } else {
            stdout.write(field.toString());
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
