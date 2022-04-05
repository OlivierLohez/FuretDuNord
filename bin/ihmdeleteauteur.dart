import 'package:mysql1/mysql1.dart';

import 'db_auteur.dart';
import 'ihm.dart';

class IHMDeleteAuteur {
  static Future<void> choisirActionDeletAuteur(
      ConnectionSettings settings) async {
    int choix = -1;
    while (choix != 0) {
      print("");
      print("+-------------------------------------------------------+");
      print("|                                                       |");
      print("|   Menu - Suppression Auteur                           |");
      print("|   Quelle action voulez-vous choisir ?                 |");
      print("|   0 = Quitter                                         |");
      print("|   1 = Supprimer tout                                  |");
      print("|   2 = Supprimer tout en fonction d'un nom             |");
      print("|   3 = Supprimer tout en fonction d'un prenom          |");
      print("|   4 = Supprimer un éditeur en fonction d'un ID        |");
      print("|   5 = Supprimer un éditeur en fonction d'un nom       |");
      print("|   6 = Supprimer un éditeur en fonction d'un prenom    |");
      print("|                                                       |");
      print("+-------------------------------------------------------+");
      choix = IHM.saisirAction(6);
      print("--------------------------------------------------");
      if (choix == 1) {
        await IHMDeleteAuteur.askDeleteAllAuteurs(settings);
      } else if (choix == 2) {
        await IHMDeleteAuteur.askDeleteAllAuteursNom(settings);
      } else if (choix == 3) {
        await IHMDeleteAuteur.askDeleteAllAuteursPrenom(settings);
      } else if (choix == 4) {
        await IHMDeleteAuteur.askDeleteAuteurID(settings);
      } else if (choix == 5) {
        await IHMDeleteAuteur.askDeleteAuteurNom(settings);
      } else if (choix == 6) {
        await IHMDeleteAuteur.askDeleteAuteurPrenom(settings);
      }
    }
    print("Retour menu précédent.");
    print("--------------------------------------------------");
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> askDeleteAllAuteurs(ConnectionSettings settings) async {
    print("Vous voulez supprimer tous les auteurs.");
    if (IHM.confirmation()) {
      DBAuteur.deleteAllAuteurs(settings);
      print("Tous les Auteurs ont été supprimés.");
      print("Fin de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    } else {
      print("Annulation de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }

  static Future<void> askDeleteAuteurID(ConnectionSettings settings) async {
    print("Vous voulez supprimer un auteur en fonction d'un ID.");
    print("Veuillez saisir son ID");
    int auteur = IHM.saisirIntRec();
    if (IHM.confirmation()) {
      await DBAuteur.deleteAuteur(settings, auteur);
      print("Auteur supprimé.");
      print("Fin de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    } else {
      print("Annulation de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }

  static Future<void> askDeleteAuteurPrenom(ConnectionSettings settings) async {
    print("Vous voulez supprimer un auteur en fonction d'un prénom.");
    String prenomAuteur = IHM.saisirString("le prénom de l'auteur");
    print("Voici la liste des différents auteurs présente avec ce prénom");
    IHM.afficherDesDonnees(
        await DBAuteur.selectAuteursByPrenom(settings, prenomAuteur));
    print("Veuillez saisir l'ID de l'Auteur à supprimer.");
    int editeur = IHM.saisirIntRec();
    if (IHM.confirmation()) {
      await DBAuteur.deleteAuteur(settings, editeur);
      print("Auteur supprimé.");
      print("Fin de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    } else {
      print("Annulation de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }

  static Future<void> askDeleteAuteurNom(ConnectionSettings settings) async {
    print("Vous voulez supprimer un auteur en fonction d'un Nom.");
    String nomAuteur = IHM.saisirString("le nom de l'auteur");
    print("Voici la liste des différents auteurs présente avec ce nom");
    IHM.afficherDesDonnees(
        await DBAuteur.selectAuteursByNom(settings, nomAuteur));
    print("Veuillez saisir l'ID de l'Auteur à supprimer.");
    int editeur = IHM.saisirIntRec();
    if (IHM.confirmation()) {
      await DBAuteur.deleteAuteur(settings, editeur);
      print("Auteur supprimé.");
      print("Fin de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    } else {
      print("Annulation de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }

  static Future<void> askDeleteAllAuteursPrenom(
      ConnectionSettings settings) async {
    print("Vous voulez supprimer tous les Auteurs ayant le même prénom");
    String prenomAuteur = IHM.saisirString("le prénom");
    if (IHM.confirmation()) {
      for (int idAuteur
          in await DBAuteur.selectIdAuteursByPrenom(settings, prenomAuteur)) {
        await DBAuteur.deleteAuteur(settings, idAuteur);
      }
      print("Les auteurs ont été supprimés.");
      print("Fin de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    } else {
      print("Annulation de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }

  static Future<void> askDeleteAllAuteursNom(
      ConnectionSettings settings) async {
    print("Vous voulez supprimer tous les Auteurs ayant le même nom");
    String nomAuteur = IHM.saisirString("le nom");
    if (IHM.confirmation()) {
      for (int idAuteur
          in await DBAuteur.selectIdAuteursByNom(settings, nomAuteur)) {
        await DBAuteur.deleteAuteur(settings, idAuteur);
      }
      print("Les auteurs ont été supprimés.");
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
