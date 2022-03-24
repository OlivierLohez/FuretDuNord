import 'data.dart';

class Produit implements Data {
  // Attributs

  int _idProduit = 0;
  String _nomProduit = "";
  int _stock = 0;
  String _dateParution = "";
  String _type = "";
  double _prix = 0;
  int _idEditeur = 0;

  // Constructeurs
  Produit(this._idProduit, this._nomProduit, this._stock, this._dateParution,
      this._type, this._prix, this._idEditeur);
  Produit.sansId(this._nomProduit, this._stock, this._dateParution, this._type,
      this._prix, this._idEditeur);

  Produit.fromListString(List<String> unEdit) {
    if (unEdit.length == 4) {
      this._idProduit = int.parse(unEdit[0]);
      this._nomProduit = unEdit[1];
      this._stock = int.parse(unEdit[2]);
      this._dateParution = unEdit[3];
      this._type = unEdit[4];
      this._prix = double.parse(unEdit[5]);
      this._idEditeur = int.parse(unEdit[6]);
    }
  }
  Produit.vide();
  int getIdProduit() {
    return this._idProduit;
  }

  String getNomProduit() {
    return this._nomProduit;
  }

  int getStock() {
    return this._stock;
  }

  String getDateParution() {
    return this._dateParution;
  }

  String getType() {
    return this._type;
  }

  double getPrix() {
    return this._prix;
  }

  int getIdEditeur() {
    return this._idEditeur;
  }

  bool estNull() {
    bool estnull = false;
    if (_idProduit == 0 &&
        _nomProduit == "" &&
        _stock == 0 &&
        _dateParution == "" &&
        _type == "" &&
        _prix == 0 &&
        _idEditeur == 0) {
      estnull = true;
    }
    return estnull;
  }

  @override
  String getEntete() {
    return "| id du Produit | nom | stock | date parution | type | prix | id de l'éditeur |";
  }

  @override
  String getInLine() {
    return "| " +
        _idProduit.toString() +
        " | " +
        _nomProduit +
        " | " +
        _stock.toString() +
        " | " +
        _dateParution +
        " | " +
        _type +
        " | " +
        _prix.toString() +
        " | " +
        _idEditeur.toString() +
        " |";
  }
}
