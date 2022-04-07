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
      print("|   4 = Supprimer tout en fonction d'un produit         |");
      print("|   5 = Supprimer tout en fonction d'un type            |");
      print("|   6 = Supprimer un éditeur en fonction d'un ID        |");
      print("|   7 = Supprimer un éditeur en fonction d'un nom       |");
      print("|   8 = Supprimer un éditeur en fonction d'un prenom    |");
      print("|   9 = Supprimer un éditeur en fonction d'un produit   |");
      print("|   10 = Supprimer un éditeur en fonction d'un type     |");
      print("|                                                       |");
      print("+-------------------------------------------------------+");
      choix = IHM.saisirAction(10);
      print("--------------------------------------------------");
      if (choix == 1) {
        await IHMDeleteAuteur.askDeleteAllAuteurs(settings);
      } else if (choix == 2) {
        await IHMDeleteAuteur.askDeleteAllAuteursNom(settings);
      } else if (choix == 3) {
        await IHMDeleteAuteur.askDeleteAllAuteursPrenom(settings);
      } else if (choix == 4) {
        await IHMDeleteAuteur.askDeleteAllAuteursNomProduit(settings);
      } else if (choix == 5) {
        await IHMDeleteAuteur.askDeleteAllAuteursTypeProduit(settings);
      } else if (choix == 6) {
        await IHMDeleteAuteur.askDeleteAuteurID(settings);
      } else if (choix == 7) {
        await IHMDeleteAuteur.askDeleteAuteurNom(settings);
      } else if (choix == 8) {
        await IHMDeleteAuteur.askDeleteAuteurPrenom(settings);
      } else if (choix == 9) {
        await IHMDeleteAuteur.askDeleteAuteurNomProduit(settings);
      } else if (choix == 10) {
        await IHMDeleteAuteur.askDeleteAuteurTypeProduit(settings);
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

  static Future<void> deleteUnAuteur(ConnectionSettings settings) async {
    int idAuteur = IHM.saisirInt("son ID");
    if (IHM.confirmation()) {
      await DBAuteur.deleteAuteurInCreer(settings, idAuteur);
      await DBAuteur.deleteAuteur(settings, idAuteur);
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

  static Future<void> askDeleteAuteurID(ConnectionSettings settings) async {
    print("Vous voulez supprimer un auteur en fonction d'un ID.");
    await IHMDeleteAuteur.deleteUnAuteur(settings);
  }

  static Future<void> askDeleteAuteurPrenom(ConnectionSettings settings) async {
    print("Vous voulez supprimer un auteur en fonction d'un prénom.");
    String prenomAuteur = IHM.saisirString("le prénom de l'auteur");
    print("Voici la liste des différents auteurs présente avec ce prénom");
    IHM.afficherDesDonnees(
        await DBAuteur.selectAuteursByPrenom(settings, prenomAuteur));
    await IHMDeleteAuteur.deleteUnAuteur(settings);
  }

  static Future<void> askDeleteAuteurNom(ConnectionSettings settings) async {
    print("Vous voulez supprimer un auteur en fonction d'un Nom.");
    String nomAuteur = IHM.saisirString("le nom de l'auteur");
    print("Voici la liste des différents auteurs présente avec ce nom");
    IHM.afficherDesDonnees(
        await DBAuteur.selectAuteursByNom(settings, nomAuteur));
    await IHMDeleteAuteur.deleteUnAuteur(settings);
  }

  static Future<void> askDeleteAuteurNomProduit(
      ConnectionSettings settings) async {
    print("Vous voulez supprimer un auteur en fonction d'un produit'.");
    String nomProduit = IHM.saisirString("son nom.");
    print("Voici la liste des différents auteurs avec ce nom là");
    IHM.afficherDesDonnees(
        await DBAuteur.selectAuteursByNomProduit(settings, nomProduit));
    await IHMDeleteAuteur.deleteUnAuteur(settings);
  }

  static Future<void> askDeleteAuteurTypeProduit(
      ConnectionSettings settings) async {
    print("Vous voulez supprimer un auteur en fonction d'un type de produit'.");
    String typeProduit = IHM.saisirString("son type.");
    print("Voici la liste des différents auteurs avec ce nom là");
    IHM.afficherDesDonnees(
        await DBAuteur.selectAuteursByTypeProduit(settings, typeProduit));
    await IHMDeleteAuteur.deleteUnAuteur(settings);
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

  static Future<void> askDeleteAllAuteursNomProduit(
      ConnectionSettings settings) async {
    print("Vous voulez supprimer tous les auteurs associés au même produit.");
    String nomProduit = IHM.saisirString("le nom du produit.");
    if (IHM.confirmation()) {
      for (int idAuteur
          in await DBAuteur.selectIdAuteursByNomProduit(settings, nomProduit)) {
        await DBAuteur.deleteAuteurInCreer(settings, idAuteur);
        await DBAuteur.deleteAuteur(settings, idAuteur);
      }
      print("Les produits ont été supprimés.");
      print("Fin de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    } else {
      print("Annulation de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }

  static Future<void> askDeleteAllAuteursTypeProduit(
      ConnectionSettings settings) async {
    print(
        "Vous voulez supprimer tous les auteurs associés au même type de produit.");
    String typeProduit = IHM.saisirString("le type de produit.");
    if (IHM.confirmation()) {
      for (int idAuteur in await DBAuteur.selectIdAuteursByTypeProduit(
          settings, typeProduit)) {
        await DBAuteur.deleteAuteurInCreer(settings, idAuteur);
        await DBAuteur.deleteAuteur(settings, idAuteur);
      }
      print("Les produits ont été supprimés.");
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
