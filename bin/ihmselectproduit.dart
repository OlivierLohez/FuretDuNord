import 'package:mysql1/mysql1.dart';

import 'db_produit.dart';
import 'ihm.dart';

class IHMSelectProduit {
  // Methodes
  // L'affichage permettant de montrant le choix des différentes actions
  static Future<void> choisirActionSelectProduit(
      ConnectionSettings settings) async {
    int choix = -1;
    while (choix != 0) {
      print("");
      print("+-------------------------------------------------------+");
      print("|                                                       |");
      print("|   Menu - Sélection Produit                            |");
      print("|   Quelle action voulez-vous choisir ?                 |");
      print("|   0 = Quitter                                         |");
      print("|   1 = Afficher tout                                   |");
      print("|   2 = Afficher tout en fonction d'un nom              |");
      print("|   3 = Afficher tout en fonction du stock              |");
      print("|   4 = Afficher tout en fonction d'un type             |");
      print("|   5 = Afficher tout en fonction d'un prix             |");
      print("|   6 = Afficher tout en fonction du nom de l'editeur   |");
      print("|   7 = Afficher tout en fonction de la ville d'editeur |");
      print("|                                                       |");
      print("+-------------------------------------------------------+");
      choix = IHM.saisirAction(7);
      print("--------------------------------------------------");
      if (choix == 1) {
        await IHMSelectProduit.showAllProduits(settings);
      } else if (choix == 2) {
        await IHMSelectProduit.askSelectProduitsByNom(settings);
      } else if (choix == 3) {
        await IHMSelectProduit.askSelectProduitsByStock(settings);
      } else if (choix == 4) {
        await IHMSelectProduit.askSelectProduitsByType(settings);
      } else if (choix == 5) {
        await IHMSelectProduit.askSelectProduitsByPrix(settings);
      } else if (choix == 6) {
        await IHMSelectProduit.askSelectProduitsByNomEditeur(settings);
      } else if (choix == 7) {
        await IHMSelectProduit.askSelectProduitsByVilleEditeur(settings);
      }
    }
    print("Retour menu précédent.");
    print("--------------------------------------------------");
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> showAllProduits(ConnectionSettings settings) async {
    try {
      IHM.afficherDesDonnees(await DBProduit.selectAllProduits(settings));
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> askSelectProduitsByNom(
      ConnectionSettings settings) async {
    print("Vous voulez des produits en fonction d'un nom de produit.");
    IHM.afficherDesDonnees(await DBProduit.selectProduitsByNom(
        settings, IHM.saisirString("le nom du produit")));
  }

  static Future<void> askSelectProduitsByStock(
      ConnectionSettings settings) async {
    print("Vous voulez des produits en fonction d'un stock de produit.");
    print("Veuillez saisir la quantité du produit");
    IHM.afficherDesDonnees(
        await DBProduit.selectProduitsByStock(settings, IHM.saisirIntRec()));
  }

  static Future<void> askSelectProduitsByType(
      ConnectionSettings settings) async {
    print("Vous voulez des produits en fonction d'un type de produit.");
    IHM.afficherDesDonnees(await DBProduit.selectProduitsByType(
        settings, IHM.saisirString("le type du produit")));
  }

  static Future<void> askSelectProduitsByPrix(
      ConnectionSettings settings) async {
    print("Vous voulez des produits en fonction d'un prix de produit.");
    print("Veuillez saisir le prix du produit");
    IHM.afficherDesDonnees(
        await DBProduit.selectProduitsByPrix(settings, IHM.saisirDoubleRec()));
  }

  static Future<void> askSelectProduitsByNomEditeur(
      ConnectionSettings settings) async {
    print("Vous voulez des produits en fonction du nom de l'éditeur.");
    IHM.afficherDesDonnees(await DBProduit.selectProduitsByNomEditeur(
        settings, IHM.saisirString("le nom de l'éditeur")));
  }

  static Future<void> askSelectProduitsByVilleEditeur(
      ConnectionSettings settings) async {
    print("Vous voulez des produits en fonction de la ville de l'éditeur.");
    IHM.afficherDesDonnees(await DBProduit.selectProduitsByVilleEditeur(
        settings, IHM.saisirString("la ville de l'éditeur")));
  }
}
