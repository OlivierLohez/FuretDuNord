import 'db_editeur.dart';
import 'ihm.dart';

class IHMDeletEditeur {
  // Methodes
  // L'affichage permettant de montrant le choix des différentes actions
  static Future<void> choisirActionDeletediteur() async {
    int choix = -1;
    while (choix != 0) {
      print("");
      print("+-------------------------------------------------------+");
      print("|                                                       |");
      print("|   Menu - Suppression Editeur                          |");
      print("|   Quelle action voulez-vous choisir ?                 |");
      print("|   0 = Quitter                                         |");
      print("|   1 = Supprimer tout                                  |");
      print("|   2 = Supprimer tout en fonction d'une ville          |");
      print("|   3 = Supprimer tout en fonction d'un nom             |");
      print("|   4 = Supprimer un éditeur en fonction d'un ID        |");
      print("|   5 = Supprimer un éditeur en fonction d'une ville    |");
      print("|   6 = Supprimer un éditeur en fonction d'un nom       |");
      print("|                                                       |");
      print("+-------------------------------------------------------+");
      choix = IHM.saisirAction(6);
      if (choix == 0) {
        print("On retourne au début");
      }
      if (choix == 1) {
        await IHMDeletEditeur.askDeleteAllEditeurs();
      } else if (choix == 2) {
        await IHMDeletEditeur.askDeleteAllEditeursVille();
      } else if (choix == 3) {
        await IHMDeletEditeur.askDeleteAllEditeursNom();
      } else if (choix == 4) {
        await IHMDeletEditeur.askDeleteEditeurID();
      } else if (choix == 5) {
        await IHMDeletEditeur.askDeleteEditeurVille();
      } else if (choix == 6) {
        await IHMDeletEditeur.askDeleteEditeurNom();
      }
    }
  }

  static Future<void> askDeleteAllEditeurs() async {
    print("Vous voulez supprimer tous les éditeurs.");
    if (IHM.confirmation()) {
      DBEditeur.deleteAllEditeurs();
      print("Tous les éditeurs ont été supprimés.");
      print("Fin de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    } else {
      print("Annulation de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }

  static Future<void> askDeleteEditeurID() async {
    print("Vous voulez supprimer un éditeur en fonction d'un ID.");
    print("Veuillez saisir son ID");
    int editeur = IHM.saisirIntRec();
    if (IHM.confirmation()) {
      await DBEditeur.deleteEditeur(editeur);
      print("Editeur supprimé.");
      print("Fin de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    } else {
      print("Annulation de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }

  static Future<void> deleteUnEditeur() async {
    print("Veuillez saisir l'ID de l'éditeur à supprimer.");
    int editeur = IHM.saisirIntRec();
    if (IHM.confirmation()) {
      await DBEditeur.deleteEditeur(editeur);
      print("Editeur supprimé.");
      print("Fin de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    } else {
      print("Annulation de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }

  static Future<void> askDeleteEditeurVille() async {
    print("Vous voulez supprimer un éditeur en fonction d'une ville.");
    print("Veuillez saisir la ville de l'éditeur.");
    String villEditeur = IHM.saisirStringRec();
    print(
        "Voici la liste des différents éditeurs avec présente dans cette ville-là");
    IHM.afficherDesDonnees(await DBEditeur.selectEditeursByVille(villEditeur));
    await IHMDeletEditeur.deleteUnEditeur();
  }

  static Future<void> askDeleteEditeurNom() async {
    print("Vous voulez supprimer un éditeur en fonction d'un nom.");
    print("Veuillez saisir son nom.");
    String nomEditeur = IHM.saisirStringRec();
    print("Voici la liste des différents éditeurs avec ce nom là");
    IHM.afficherDesDonnees(await DBEditeur.selectEditeursByNom(nomEditeur));
    await IHMDeletEditeur.deleteUnEditeur();
  }

  static Future<void> askDeleteAllEditeursVille() async {
    print("Vous voulez supprimer tous les éditeurs venant de la même ville.");
    print("Veuillez saisir la ville.");
    String villeEditeur = IHM.saisirStringRec();
    if (IHM.confirmation()) {
      for (int idEdit
          in await DBEditeur.selectIdEditeursByVille(villeEditeur)) {
        await DBEditeur.deleteEditeur(idEdit);
      }
      print("Les éditeurs ont été supprimés.");
      print("Fin de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    } else {
      print("Annulation de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }

  static Future<void> askDeleteAllEditeursNom() async {
    print("Vous voulez supprimer tous les éditeurs portant le même nom.");
    print("Veuillez saisir le nom.");
    String nomEditeur = IHM.saisirStringRec();
    if (IHM.confirmation()) {
      for (int idEdit in await DBEditeur.selectIdEditeursByNom(nomEditeur)) {
        await DBEditeur.deleteEditeur(idEdit);
      }
      print("Les éditeurs ont été supprimés.");
      print("Fin de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    } else {
      print("Annulation de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }
}
