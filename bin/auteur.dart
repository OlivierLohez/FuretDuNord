import 'dart:io';

import 'package:mysql1/mysql1.dart';

import 'furetbd.dart';

class Auteur {
  int _idauteur = 0;
  String _nom = "";
  String _prenom = "";

  Auteur(this._idauteur, this._nom, this._prenom);
  Auteur.sansid(this._nom, this._prenom);

  void ajouterauteur(String nom, String prenom, MySqlConnection conn) async {
    try {
      String requete = "INSERT INTO AUTEUR(nom,prenom) VALUES('" +
          nom +
          "','" +
          prenom +
          "')";
      await conn.query(requete);
    } catch (e) {
      print(e.toString());
    }
  }

  void affichertouslesauteur(conn) async {
    try {
      String requete = "Select * from AUTEUR";
      Results reponse = await conn.query(requete);

      for (var row in reponse) {
        for (var fields in row) {
          stdout.write(fields.toString());
        }
      }
      await conn.query(requete);
    } catch (e) {
      print(e.toString());
    }
  }

  // void supprimerauteur() async {
  //   try {
  //     MySqlConnection conn = await MySqlConnection.connect
  //   } catch (e) {}
  // }

  int getidAuteur() {
    return this._idauteur;
  }

  String getnom() {
    return this._nom;
  }

  String getprenom() {
    return this._prenom;
  }
}
