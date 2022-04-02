import 'dart:html';
import 'dart:io';

import 'package:mysql1/mysql1.dart';

import 'data.dart';
import 'furetbd.dart';

class Auteur implements Data {
  //Attributs
  int _idAuteur = 0;
  String _nomAuteur = "";
  String _prenomAuteur = "";

  //Constructeurs
  Auteur(this._idAuteur, this._nomAuteur, this._prenomAuteur);
  Auteur.sansid(this._nomAuteur, this._prenomAuteur);

  Auteur.fromListString(List<String> unEdit) {
    if (unEdit.length == 3) {
      this._idAuteur = int.parse(unEdit[0]);
      this._nomAuteur = unEdit[1];
      this._prenomAuteur = unEdit[2];
    }
  }

  Auteur.vide();

  int getidAuteur() {
    return this._idAuteur;
  }

  String getnomAuteur() {
    return this._nomAuteur;
  }

  String getprenomAuteur() {
    return this._prenomAuteur;
  }

  bool estNull() {
    bool estnull = false;
    if (_idAuteur == 0 && _nomAuteur == "" && _prenomAuteur == "") {
      estnull = true;
    }
    return estnull;
  }

  @override
  String getEntete() {
    return "| id | nom | prenom |";
  }

  @override
  String getInLine() {
    return "| " +
        _idAuteur.toString() +
        " | " +
        _nomAuteur +
        " | " +
        _prenomAuteur;
  }
}
