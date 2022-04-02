import 'db_auteur.dart';
import 'ihm.dart';

class IHMSelectAuteur {
  // Methodes
  // L'affichage permettant de montrant le choix des différentes actions
  static Future<void> choisirActionSelectAuteur() async {
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
      await IHMSelectAuteur.showAllAuteur();
    } else if (laTable == 2) {
      await IHMSelectAuteur.askSelectAuteurByPrenom();
    } else if (laTable == 3) {
      await IHMSelectAuteur.askSelectAuteurByNom();
    }
  }

  static Future<void> showAllAuteur() async {
    try {
      IHM.afficherDesDonnees(await DBAuteur.selectAllAuteurs());
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> askSelectAuteurByPrenom() async {
    print("Vous voulez des éditeurs en fonction d'un prénom.");
    print("Veuillez saisir le prénom.");
    IHM.afficherDesDonnees(
        await DBAuteur.selectAuteursByPrenom(IHM.saisirStringRec()));
  }

  static Future<void> askSelectAuteurByNom() async {
    print("Vous voulez des auteurs en fonction d'un nom.");
    print("Veuillez saisir le nom de l'auteur.'");
    IHM.afficherDesDonnees(
        await DBAuteur.selectAuteursByNom(IHM.saisirStringRec()));
  }
}
