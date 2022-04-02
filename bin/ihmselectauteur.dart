import 'package:mysql1/mysql1.dart';

import 'db_auteur.dart';
import 'ihm.dart';

class IHMSelectAuteur {
  // Methodes
  // L'affichage permettant de montrant le choix des différentes actions
  static Future<void> choisirActionSelectAuteur(
      ConnectionSettings settings) async {
    print("");
    print("+-------------------------------------------------------+");
    print("|                                                       |");
    print("|   Menu - Sélection Auteur                             |");
    print("|   Quelle action voulez-vous choisir ?                 |");
    print("|   0 = Quitter                                         |");
    print("|   1 = Afficher tout                                   |");
    print("|   2 = Afficher tout en fonction d'un prenom           |");
    print("|   2 = Afficher tout en fonction d'un nom              |");
    print("|                                                       |");
    print("+-------------------------------------------------------+");
    int laTable = IHM.saisirAction(3);
    if (laTable == 0) {
      print("On retourne au début");
    }
    if (laTable == 1) {
      await IHMSelectAuteur.showAllAuteur(settings);
    } else if (laTable == 2) {
      await IHMSelectAuteur.askSelectAuteurByPrenom(settings);
    } else if (laTable == 3) {
      await IHMSelectAuteur.askSelectAuteurByNom(settings);
    }
  }

  static Future<void> showAllAuteur(ConnectionSettings settings) async {
    try {
      IHM.afficherDesDonnees(await DBAuteur.selectAllAuteurs(settings));
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> askSelectAuteurByPrenom(
      ConnectionSettings settings) async {
    print("Vous voulez des éditeurs en fonction d'un prénom.");
    IHM.afficherDesDonnees(await DBAuteur.selectAuteursByPrenom(
        settings, IHM.saisirString("le prénom")));
  }

  static Future<void> askSelectAuteurByNom(ConnectionSettings settings) async {
    print("Vous voulez des auteurs en fonction d'un nom.");
    IHM.afficherDesDonnees(await DBAuteur.selectAuteursByNom(
        settings, IHM.saisirString("le nom de l'auteur")));
  }
}
