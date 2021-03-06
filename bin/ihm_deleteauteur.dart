import 'package:mysql1/mysql1.dart';

import 'db_auteur.dart';
import 'ihm_principal.dart';

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
      print("|   6 = Supprimer un auteur en fonction d'un ID         |");
      print("|   7 = Supprimer un auteur en fonction d'un nom        |");
      print("|   8 = Supprimer un auteur en fonction d'un prenom     |");
      print("|   9 = Supprimer un auteur en fonction d'un produit    |");
      print("|   10 = Supprimer un auteur en fonction d'un type      |");
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
    print("Retour menu pr??c??dent.");
    print("--------------------------------------------------");
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> askDeleteAllAuteurs(ConnectionSettings settings) async {
    print("Vous voulez supprimer tous les auteurs.");
    if (IHM.confirmation()) {
      DBAuteur.deleteAllAuteurs(settings);
      print("Tous les Auteurs ont ??t?? supprim??s.");
      print("Fin de l'op??ration.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    } else {
      print("Annulation de l'op??ration.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }

  static Future<void> deleteUnAuteur(ConnectionSettings settings) async {
    int idAuteur = IHM.saisirInt("son ID");
    if (IHM.confirmation()) {
      await DBAuteur.deleteAuteurInCreer(settings, idAuteur);
      await DBAuteur.deleteAuteur(settings, idAuteur);
      print("Auteur supprim??.");
      print("Fin de l'op??ration.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    } else {
      print("Annulation de l'op??ration.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }

  static Future<void> askDeleteAuteurID(ConnectionSettings settings) async {
    print("Vous voulez supprimer un auteur en fonction d'un ID.");
    await IHMDeleteAuteur.deleteUnAuteur(settings);
  }

  static Future<void> askDeleteAuteurPrenom(ConnectionSettings settings) async {
    print("Vous voulez supprimer un auteur en fonction d'un pr??nom.");
    String prenomAuteur = IHM.saisirString("le pr??nom de l'auteur");
    print("Voici la liste des diff??rents auteurs pr??sente avec ce pr??nom");
    IHM.afficherDesDonnees(
        await DBAuteur.selectAuteursByPrenom(settings, prenomAuteur));
    await IHMDeleteAuteur.deleteUnAuteur(settings);
  }

  static Future<void> askDeleteAuteurNom(ConnectionSettings settings) async {
    print("Vous voulez supprimer un auteur en fonction d'un Nom.");
    String nomAuteur = IHM.saisirString("le nom de l'auteur");
    print("Voici la liste des diff??rents auteurs pr??sente avec ce nom");
    IHM.afficherDesDonnees(
        await DBAuteur.selectAuteursByNom(settings, nomAuteur));
    await IHMDeleteAuteur.deleteUnAuteur(settings);
  }

  static Future<void> askDeleteAuteurNomProduit(
      ConnectionSettings settings) async {
    print("Vous voulez supprimer un auteur en fonction d'un produit.");
    String nomProduit = IHM.saisirString("son nom.");
    print("Voici la liste des diff??rents auteurs avec ce nom l??");
    IHM.afficherDesDonnees(
        await DBAuteur.selectAuteursByNomProduit(settings, nomProduit));
    await IHMDeleteAuteur.deleteUnAuteur(settings);
  }

  static Future<void> askDeleteAuteurTypeProduit(
      ConnectionSettings settings) async {
    print("Vous voulez supprimer un auteur en fonction d'un type de produit.");
    String typeProduit = IHM.saisirString("son type.");
    print("Voici la liste des diff??rents auteurs avec ce nom l??");
    IHM.afficherDesDonnees(
        await DBAuteur.selectAuteursByTypeProduit(settings, typeProduit));
    await IHMDeleteAuteur.deleteUnAuteur(settings);
  }

  static Future<void> askDeleteAllAuteursPrenom(
      ConnectionSettings settings) async {
    print("Vous voulez supprimer tous les Auteurs ayant le m??me pr??nom");
    String prenomAuteur = IHM.saisirString("le pr??nom");
    if (IHM.confirmation()) {
      for (int idAuteur
          in await DBAuteur.selectIdAuteursByPrenom(settings, prenomAuteur)) {
        await DBAuteur.deleteAuteur(settings, idAuteur);
      }
      print("Les auteurs ont ??t?? supprim??s.");
      print("Fin de l'op??ration.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    } else {
      print("Annulation de l'op??ration.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }

  static Future<void> askDeleteAllAuteursNom(
      ConnectionSettings settings) async {
    print("Vous voulez supprimer tous les Auteurs ayant le m??me nom");
    String nomAuteur = IHM.saisirString("le nom");
    if (IHM.confirmation()) {
      for (int idAuteur
          in await DBAuteur.selectIdAuteursByNom(settings, nomAuteur)) {
        await DBAuteur.deleteAuteur(settings, idAuteur);
      }
      print("Les auteurs ont ??t?? supprim??s.");
      print("Fin de l'op??ration.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    } else {
      print("Annulation de l'op??ration.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }

  static Future<void> askDeleteAllAuteursNomProduit(
      ConnectionSettings settings) async {
    print("Vous voulez supprimer tous les auteurs associ??s au m??me produit.");
    String nomProduit = IHM.saisirString("le nom du produit.");
    if (IHM.confirmation()) {
      for (int idAuteur
          in await DBAuteur.selectIdAuteursByNomProduit(settings, nomProduit)) {
        await DBAuteur.deleteAuteurInCreer(settings, idAuteur);
        await DBAuteur.deleteAuteur(settings, idAuteur);
      }
      print("Les auteurs ont ??t?? supprim??s.");
      print("Fin de l'op??ration.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    } else {
      print("Annulation de l'op??ration.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }

  static Future<void> askDeleteAllAuteursTypeProduit(
      ConnectionSettings settings) async {
    print(
        "Vous voulez supprimer tous les auteurs associ??s au m??me type de produit.");
    String typeProduit = IHM.saisirString("le type de produit.");
    if (IHM.confirmation()) {
      for (int idAuteur in await DBAuteur.selectIdAuteursByTypeProduit(
          settings, typeProduit)) {
        await DBAuteur.deleteAuteurInCreer(settings, idAuteur);
        await DBAuteur.deleteAuteur(settings, idAuteur);
      }
      print("Les auteurs ont ??t?? supprim??s.");
      print("Fin de l'op??ration.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    } else {
      print("Annulation de l'op??ration.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }
}
