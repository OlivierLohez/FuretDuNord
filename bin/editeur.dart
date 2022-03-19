class Editeur {
  // Attributs
  int _idEditeur = 0;
  String _nomEditeur = "";
  String _adresseEditeur = "";
  String _villeEditeur = "";

  // Constructeurs
  Editeur(this._idEditeur, this._nomEditeur, this._adresseEditeur,
      this._villeEditeur);
  Editeur.sansId(this._nomEditeur, this._adresseEditeur, this._villeEditeur);

  // Getteurs
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
}
