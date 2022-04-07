import 'package:mysql1/mysql1.dart';

import 'db_auteur.dart';
import 'ihm.dart';

class IHMSelectAuteur {
  // Methodes
  // L'affichage permettant de montrant le choix des différentes actions
  static Future<void> choisirActionSelectAuteur(
      ConnectionSettings settings) async {
    int choix = -1;
    while (choix != 0) {
      print("");
      print("+-------------------------------------------------------+");
      print("|                                                       |");
      print("|   Menu - Sélection Auteur                             |");
      print("|   Quelle action voulez-vous choisir ?                 |");
      print("|   0 = Quitter                                         |");
      print("|   1 = Afficher tout                                   |");
      print("|   2 = Afficher tout en fonction d'un prenom           |");
      print("|   3 = Afficher tout en fonction d'un nom              |");
      print("|   4 = Afficher tout en fonction d'un nom de produit   |");
      print("|   5 = Afficher tout en fonction d'un type de produit  |");
      print("|                                                       |");
      print("+-------------------------------------------------------+");
      choix = IHM.saisirAction(5);
      print("--------------------------------------------------");
      if (choix == 1) {
        await IHMSelectAuteur.showAllAuteur(settings);
      } else if (choix == 2) {
        await IHMSelectAuteur.askSelectAuteursByPrenom(settings);
      } else if (choix == 3) {
        await IHMSelectAuteur.askSelectAuteursByNom(settings);
      } else if (choix == 4) {
        await IHMSelectAuteur.askSelectAuteursByNomProduit(settings);
      } else if (choix == 5) {
        await IHMSelectAuteur.askSelectAuteursByTypeProduit(settings);
      }
    }
    print("Retour menu précédent.");
    print("--------------------------------------------------");
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> showAllAuteur(ConnectionSettings settings) async {
    try {
      IHM.afficherDesDonnees(await DBAuteur.selectAllAuteurs(settings));
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> askSelectAuteursByPrenom(
      ConnectionSettings settings) async {
    print("Vous voulez des éditeurs en fonction d'un prénom.");
    IHM.afficherDesDonnees(await DBAuteur.selectAuteursByPrenom(
        settings, IHM.saisirString("le prénom")));
  }

  static Future<void> askSelectAuteursByNom(ConnectionSettings settings) async {
    print("Vous voulez des auteurs en fonction d'un nom.");
    IHM.afficherDesDonnees(await DBAuteur.selectAuteursByNom(
        settings, IHM.saisirString("le nom de l'auteur")));
  }

  static Future<void> askSelectAuteursByNomProduit(
      ConnectionSettings settings) async {
    print("Vous voulez tous les auteurs qui ont créé un même produit.");
    IHM.afficherDesDonnees(await DBAuteur.selectAuteursByNomProduit(
        settings, IHM.saisirString("le nom du produit")));
  }

  static Future<void> askSelectAuteursByTypeProduit(
      ConnectionSettings settings) async {
    print("Vous voulez des auteurs en fonction du même type de produit.");
    IHM.afficherDesDonnees(await DBAuteur.selectAuteursByTypeProduit(
        settings, IHM.saisirString("le type de produit")));
  }
}
