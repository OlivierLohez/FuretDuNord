import 'data.dart';

class Editeur implements Data {
  // Attributs

  int _idEditeur = 0;
  String _nomEditeur = "";
  String _adresseEditeur = "";
  String _villeEditeur = "";

  // Constructeurs
  Editeur(this._idEditeur, this._nomEditeur, this._adresseEditeur,
      this._villeEditeur);
  Editeur.sansId(this._nomEditeur, this._adresseEditeur, this._villeEditeur);

  Editeur.fromListString(List<String> unEdit) {
    if (unEdit.length == 4) {
      this._idEditeur = int.parse(unEdit[0]);
      this._nomEditeur = unEdit[1];
      this._adresseEditeur = unEdit[2];
      this._villeEditeur = unEdit[3];
    }
  }
  Editeur.vide();
  int getIdEditeur() {
    return this._idEditeur;
  }

  String getNomEditeur() {
    return this._nomEditeur;
  }

  String getAdresseEditeur() {
    return this._adresseEditeur;
  }

  String getVilleEditeur() {
    return this._villeEditeur;
  }

  bool estNull() {
    bool estnull = false;
    if (_idEditeur == 0 &&
        _nomEditeur == "" &&
        _adresseEditeur == "" &&
        _villeEditeur == "") {
      estnull = true;
    }
    return estnull;
  }

  @override
  String getEntete() {
    return "| id | nom | adresse | ville |";
  }

  @override
  String getInLine() {
    return "| " +
        _idEditeur.toString() +
        " | " +
        _nomEditeur +
        " | " +
        _adresseEditeur +
        " | " +
        _villeEditeur +
        " |";
  }
}
