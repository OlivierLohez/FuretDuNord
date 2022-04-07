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
      print("|   3 = Afficher tout en fonction d'un nom              |");
      print("|   4 = Afficher tout en fonction d'un nom de produit   |");
      print("|   5 = Afficher tout en fonction d'un type de produit  |");
      print("|                                                       |");
      print("+-------------------------------------------------------+");
      choix = IHM.saisirAction(5);
      print("--------------------------------------------------");
      if (choix == 1) {
        await IHMSelectEditeur.showAllEditeurs(settings);
      } else if (choix == 2) {
        await IHMSelectEditeur.askSelectEditeursByVille(settings);
      } else if (choix == 3) {
        await IHMSelectEditeur.askSelectEditeursByNom(settings);
      } else if (choix == 4) {
        await IHMSelectEditeur.askSelectEditeursByNomProduit(settings);
      } else if (choix == 5) {
        await IHMSelectEditeur.askSelectEditeursByTypeProduit(settings);
      }
    }
    print("Retour menu précédent.");
    print("--------------------------------------------------");
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> showAllEditeurs(ConnectionSettings settings) async {
    try {
      IHM.afficherDesDonnees(await DBEditeur.selectAllEditeurs(settings));
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> askSelectEditeursByVille(
      ConnectionSettings settings) async {
    print("Vous voulez des éditeurs en fonction d'une ville.");
    IHM.afficherDesDonnees(await DBEditeur.selectEditeursByVille(
        settings, IHM.saisirString("le nom de la ville.")));
  }

  static Future<void> askSelectEditeursByNom(
      ConnectionSettings settings) async {
    print("Vous voulez des éditeurs en fonction d'un nom.");
    IHM.afficherDesDonnees(await DBEditeur.selectEditeursByNom(
        settings, IHM.saisirString("le nom de l'éditeur.")));
  }

  static Future<void> askSelectEditeursByNomProduit(
      ConnectionSettings settings) async {
    print("Vous voulez tous les auteurs qui ont créé un même produit.");
    IHM.afficherDesDonnees(await DBEditeur.selectEditeursByNomProduit(
        settings, IHM.saisirString("le nom du produit")));
  }

  static Future<void> askSelectEditeursByTypeProduit(
      ConnectionSettings settings) async {
    print("Vous voulez des auteurs en fonction du même type de produit.");
    IHM.afficherDesDonnees(await DBEditeur.selectEditeursByTypeProduit(
        settings, IHM.saisirString("le type de produit")));
  }
}
