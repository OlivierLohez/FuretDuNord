import 'package:mysql1/mysql1.dart';

import 'furetbd.dart';
import 'ihmediteur.dart';

void main(List<String> args) async {
  ConnectionSettings settings = LaBDFuret.settingsLaBD();
  try {
    print("Début");
    MySqlConnection conn = await MySqlConnection.connect(settings);
    print("Connexion réussie !");
    /*
    try {
      LaBDFuret.creerTables(conn);
    } catch (e) {
      print("Les tables sont déjà créées");
    }*/
    //IHMEditeur.demandeInsererEditeur(conn);
    IHMEditeur.demandeSupprimerEditeurNom(conn);
    try {
      await conn.close();
      print("Connexion terminée !");
    } catch (e) {
      print("Erreur de déconnexion !");
    }
  } catch (e) {
    print(e.toString());
  }
}
