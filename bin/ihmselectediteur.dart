import 'db_editeur.dart';
import 'ihm.dart';

class IHMSelectEditeur {
  // Methodes
  // L'affichage permettant de montrant le choix des différentes actions
  static Future<void> choisirActionSelectEditeur() async {
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
      if (choix == 0) {
        print("On retourne au début");
      }
      if (choix == 1) {
        await IHMSelectEditeur.showAllEditeur();
      } else if (choix == 2) {
        await IHMSelectEditeur.askSelectEditeurByVille();
      } else if (choix == 3) {
        await IHMSelectEditeur.askSelectEditeurByNom();
      }
    }
  }

  static Future<void> showAllEditeur() async {
    try {
      IHM.afficherDesDonnees(await DBEditeur.selectAllEditeurs());
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> askSelectEditeurByVille() async {
    print("Vous voulez des éditeurs en fonction d'une ville.");
    print("Veuillez saisir le nom de la ville.");
    IHM.afficherDesDonnees(
        await DBEditeur.selectEditeursByVille(IHM.saisirStringRec()));
  }

  static Future<void> askSelectEditeurByNom() async {
    print("Vous voulez des éditeurs en fonction d'un nom.");
    print("Veuillez saisir le nom de l'éditeur.'");
    IHM.afficherDesDonnees(
        await DBEditeur.selectEditeursByNom(IHM.saisirStringRec()));
  }
}
