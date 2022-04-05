import 'package:mysql1/mysql1.dart';

import 'db_editeur.dart';
import 'ihm.dart';

class IHMSelectEditeur {
  // Methodes
  // L'affichage permettant de montrant le choix des différentes actions
  static Future<void> choisirActionSelectEditeur(
      ConnectionSettings settings) async {
    int choix = -1;
    while (choix != 0) {
      print("");
      print("+-------------------------------------------------------+");
      print("|                                                       |");
      print("|   Menu - Sélection Editeur                            |");
      print("|   Quelle action voulez-vous choisir ?                 |");
      print("|   0 = Quitter                                         |");
      print("|   1 = Afficher tout                                   |");
      print("|   2 = Afficher tout en fonction d'une ville           |");
      print("|   2 = Afficher tout en fonction d'un nom              |");
      print("|                                                       |");
      print("+-------------------------------------------------------+");
      choix = IHM.saisirAction(3);
      print("--------------------------------------------------");
      if (choix == 1) {
        await IHMSelectEditeur.showAllEditeur(settings);
      } else if (choix == 2) {
        await IHMSelectEditeur.askSelectEditeurByVille(settings);
      } else if (choix == 3) {
        await IHMSelectEditeur.askSelectEditeurByNom(settings);
      }
    }
    print("Retour menu précédent.");
    print("--------------------------------------------------");
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> showAllEditeur(ConnectionSettings settings) async {
    try {
      IHM.afficherDesDonnees(await DBEditeur.selectAllEditeurs(settings));
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> askSelectEditeurByVille(
      ConnectionSettings settings) async {
    print("Vous voulez des éditeurs en fonction d'une ville.");
    IHM.afficherDesDonnees(await DBEditeur.selectEditeursByVille(
        settings, IHM.saisirString("le nom de la ville.")));
  }

  static Future<void> askSelectEditeurByNom(ConnectionSettings settings) async {
    print("Vous voulez des éditeurs en fonction d'un nom.");
    IHM.afficherDesDonnees(await DBEditeur.selectEditeursByNom(
        settings, IHM.saisirString("le nom de l'éditeur.")));
  }
}
