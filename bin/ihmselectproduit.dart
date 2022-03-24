import 'db_produit.dart';
import 'ihm.dart';

class IHMSelectProduit {
  // Methodes
  // L'affichage permettant de montrant le choix des différentes actions
  static Future<void> choisirActionSelectProduit() async {
    print("");
    print("+-------------------------------------------------------+");
    print("|                                                       |");
    print("|   Menu - Sélection Produit                            |");
    print("|   Quelle action voulez-vous choisir ?                 |");
    print("|   0 = Quitter                                         |");
    print("|   1 = Afficher tout                                   |");
    //print("|   2 = Afficher tout en fonction d'une ville           |");
    print("|                                                       |");
    print("+-------------------------------------------------------+");
    int laTable = IHM.saisirAction(1);
    if (laTable == 0) {
      print("On retourne au début");
    }
    if (laTable == 1) {
      await IHMSelectProduit.showAllProduits();
    } else if (laTable == 2) {
      //await IHMSelectProduit.askSelectEditeurByVille();
    }
  }

  static Future<void> showAllProduits() async {
    try {
      IHM.afficherDesDonnees(await DBProduit.selectAllProduits());
    } catch (e) {
      print(e.toString());
    }
  }
/*
  static Future<void> askSelectProduitByVille() async {
    print("Vous voulez des éditeurs en fonction d'une ville.");
    print("Veuillez saisir le nom de la ville");
    IHM.afficherDesDonnees(
        await DBEditeur.selectEditeursByVille(IHM.saisirStringRec()));
  }
  */
}
