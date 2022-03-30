import 'db_produit.dart';
import 'ihm.dart';

class IHMSelectProduit {
  // Methodes
  // L'affichage permettant de montrant le choix des différentes actions
  static Future<void> choisirActionSelectProduit() async {
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
      if (choix == 0) {
        print("On retourne au début");
      }
      if (choix == 1) {
        await IHMSelectProduit.showAllProduits();
      } else if (choix == 2) {
        await IHMSelectProduit.askSelectProduitsByNom();
      } else if (choix == 3) {
        await IHMSelectProduit.askSelectProduitsByStock();
      } else if (choix == 4) {
        await IHMSelectProduit.askSelectProduitsByType();
      } else if (choix == 5) {
        await IHMSelectProduit.askSelectProduitsByPrix();
      } else if (choix == 6) {
        await IHMSelectProduit.askSelectProduitsByNomEditeur();
      } else if (choix == 7) {
        await IHMSelectProduit.askSelectProduitsByVilleEditeur();
      }
    }
  }

  static Future<void> showAllProduits() async {
    try {
      IHM.afficherDesDonnees(await DBProduit.selectAllProduits());
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> askSelectProduitsByNom() async {
    print("Vous voulez des produits en fonction d'un nom de produit.");
    print("Veuillez saisir le nom du produit");
    IHM.afficherDesDonnees(
        await DBProduit.selectProduitsByNom(IHM.saisirStringRec()));
  }

  static Future<void> askSelectProduitsByStock() async {
    print("Vous voulez des produits en fonction d'un stock de produit.");
    print("Veuillez saisir la quantité du produit");
    IHM.afficherDesDonnees(
        await DBProduit.selectProduitsByStock(IHM.saisirIntRec()));
  }

  static Future<void> askSelectProduitsByType() async {
    print("Vous voulez des produits en fonction d'un type de produit.");
    print("Veuillez saisir le type du produit");
    IHM.afficherDesDonnees(
        await DBProduit.selectProduitsByType(IHM.saisirStringRec()));
  }

  static Future<void> askSelectProduitsByPrix() async {
    print("Vous voulez des produits en fonction d'un prix de produit.");
    print("Veuillez saisir le prix du produit");
    IHM.afficherDesDonnees(
        await DBProduit.selectProduitsByPrix(IHM.saisirDoubleRec()));
  }

  static Future<void> askSelectProduitsByNomEditeur() async {
    print("Vous voulez des produits en fonction du nom de l'éditeur.");
    print("Veuillez saisir le nom de l'éditeur");
    IHM.afficherDesDonnees(
        await DBProduit.selectProduitsByNomEditeur(IHM.saisirStringRec()));
  }

  static Future<void> askSelectProduitsByVilleEditeur() async {
    print("Vous voulez des produits en fonction de la ville de l'éditeur.");
    print("Veuillez saisir ville de l'éditeur");
    IHM.afficherDesDonnees(
        await DBProduit.selectProduitsByVilleEditeur(IHM.saisirStringRec()));
  }
}
