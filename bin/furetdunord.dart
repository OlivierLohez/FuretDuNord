import 'package:mysql1/mysql1.dart';

import 'furetbd.dart';
import 'ihm.dart';
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
    bool valide = true;
    while (valide) {
      String laTable = IHM.choisirTable();
      if (laTable == '1') {
      } else if (laTable == '2') {
        String laTableEditeur = IHMEditeur.choisirTableEditeur();
        if (laTableEditeur == '0') {
          print("On recommence");
        }
        if (laTableEditeur == '1') {
          IHMEditeur.demandeInsererEditeur(conn);
        } else if (laTableEditeur == '2') {
          IHMEditeur.demandeSupprimerEditeurNom(conn);
        } else {
          print("Choix non reconnu, fin.");
          valide = false;
        }
      } else {
        valide = false;
      }
    }

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
