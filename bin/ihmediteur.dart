import 'dart:io';

import 'package:mysql1/mysql1.dart';

import 'editeur.dart';

class IHMEditeur {
  // Methodes
  static Future<void> demandeInsererEditeur(
    MySqlConnection conn,
  ) async {
    print("Vous voulez saisir un éditeur.");
    print("Veuillez saisir son nom");
    String nomEditeur = saisirStringRec();
    print("Veuillez saisir sa ville");
    String villeEditeur = saisirStringRec();
    print("Veuillez saisir son adresse");
    String adresseEditeur = saisirStringRec();
    IHMEditeur.insererEditeur(
        conn, new Editeur.sansId(nomEditeur, adresseEditeur, villeEditeur));
  }

  static Future<void> select(MySqlConnection conn) async {
    try {
      String requete = "SELECT * from EDITEUR;";
      Results response = await conn.query(requete);
      for (var row in response) {
        for (var field in row) {
          print(field.toString());
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

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

  static String saisirStringRec() {
    String c = "";
    print("Veuillez indiquer une chaîne de caractère :");
    try {
      c = stdin.readLineSync().toString();
    } catch (e) {
      print("Erreur lors de la saisie");
      c = saisirStringRec();
    }
    return c;
  }
}
