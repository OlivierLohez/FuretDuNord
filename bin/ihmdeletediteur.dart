import 'package:mysql1/mysql1.dart';

import 'db_editeur.dart';
import 'ihm.dart';

class IHMDeletEditeur {
  // Methodes
  // L'affichage permettant de montrant le choix des différentes actions
  static Future<void> choisirActionDeletediteur(
      ConnectionSettings settings) async {
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
        await IHMDeletEditeur.askDeleteAllEditeurs(settings);
      } else if (choix == 2) {
        await IHMDeletEditeur.askDeleteAllEditeursVille(settings);
      } else if (choix == 3) {
        await IHMDeletEditeur.askDeleteAllEditeursNom(settings);
      } else if (choix == 4) {
        await IHMDeletEditeur.askDeleteEditeurID(settings);
      } else if (choix == 5) {
        await IHMDeletEditeur.askDeleteEditeurVille(settings);
      } else if (choix == 6) {
        await IHMDeletEditeur.askDeleteEditeurNom(settings);
      }
    }
  }

  static Future<void> askDeleteAllEditeurs(ConnectionSettings settings) async {
    print("Vous voulez supprimer tous les éditeurs.");
    if (IHM.confirmation()) {
      DBEditeur.deleteAllEditeurs(settings);
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

  static Future<void> askDeleteEditeurID(ConnectionSettings settings) async {
    print("Vous voulez supprimer un éditeur en fonction d'un ID.");
    print("Veuillez saisir son ID");
    int editeur = IHM.saisirIntRec();
    if (IHM.confirmation()) {
      await DBEditeur.deleteEditeur(settings, editeur);
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

  static Future<void> deleteUnEditeur(ConnectionSettings settings) async {
    print("Veuillez saisir l'ID de l'éditeur à supprimer.");
    int editeur = IHM.saisirIntRec();
    if (IHM.confirmation()) {
      await DBEditeur.deleteEditeur(settings, editeur);
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

  static Future<void> askDeleteEditeurVille(ConnectionSettings settings) async {
    print("Vous voulez supprimer un éditeur en fonction d'une ville.");
    String villEditeur = IHM.saisirString("la ville de l'éditeur");
    print(
        "Voici la liste des différents éditeurs avec présente dans cette ville-là");
    IHM.afficherDesDonnees(
        await DBEditeur.selectEditeursByVille(settings, villEditeur));
    await IHMDeletEditeur.deleteUnEditeur(settings);
  }

  static Future<void> askDeleteEditeurNom(ConnectionSettings settings) async {
    print("Vous voulez supprimer un éditeur en fonction d'un nom.");
    String nomEditeur = IHM.saisirString("son nom");
    print("Voici la liste des différents éditeurs avec ce nom là");
    IHM.afficherDesDonnees(
        await DBEditeur.selectEditeursByNom(settings, nomEditeur));
    await IHMDeletEditeur.deleteUnEditeur(settings);
  }

  static Future<void> askDeleteAllEditeursVille(
      ConnectionSettings settings) async {
    print("Vous voulez supprimer tous les éditeurs venant de la même ville.");
    String villeEditeur = IHM.saisirString("la ville");
    if (IHM.confirmation()) {
      for (int idEdit
          in await DBEditeur.selectIdEditeursByVille(settings, villeEditeur)) {
        await DBEditeur.deleteEditeur(settings, idEdit);
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

  static Future<void> askDeleteAllEditeursNom(
      ConnectionSettings settings) async {
    print("Vous voulez supprimer tous les éditeurs portant le même nom.");
    String nomEditeur = IHM.saisirString("le nom");
    if (IHM.confirmation()) {
      for (int idEdit
          in await DBEditeur.selectIdEditeursByNom(settings, nomEditeur)) {
        await DBEditeur.deleteEditeur(settings, idEdit);
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
