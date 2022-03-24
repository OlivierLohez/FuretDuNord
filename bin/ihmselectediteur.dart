import 'dart:io';

import 'package:mysql1/mysql1.dart';
import 'db_editeur.dart';
import 'furetbd.dart';
import 'ihm.dart';

class IHMSelectEditeur {
  // Methodes
  // L'affichage permettant de montrant le choix des différentes actions
  static Future<bool> choisirActionSelectEditeur() async {
    bool continuer = true;
    print("+--------------------------------------------+");
    print("|                                            |");
    print("|   Quelle action voulez-vous choisir ?      |");
    print("|   0 = Retour au début                      |");
    print("|   1 = Afficher tout                        |");
    print("|   2 = Afficher en fonction d'une ville     |");
    print("|                                            |");
    print("+--------------------------------------------+");
    int laTable = IHM.saisirAction(2);
    if (laTable == 0) {
      print("On retourne au début");
    }
    if (laTable == 1) {
      await IHMSelectEditeur.afficherAllEditeur();
    } else if (laTable == 2) {
      await IHMSelectEditeur.demandeSelectEditeurByVille();
    }

    return continuer;
  }

  static Future<void> afficherAllEditeur() async {
    try {
      MySqlConnection conn =
          await MySqlConnection.connect(LaBDFuret.settingsLaBD());
      try {
        IHM.afficherDesDonnees(await DBEditeur.selectAllEditeurs());
      } catch (e) {
        print(e.toString());
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> demandeSelectEditeurByVille() async {
    print("Vous voulez des éditeurs en fonction d'une ville.");
    print("Veuillez saisir le nom de la ville");
    IHM.afficherDesDonnees(
        await DBEditeur.selectEditeursByVille(IHM.saisirStringRec()));
  }
}
