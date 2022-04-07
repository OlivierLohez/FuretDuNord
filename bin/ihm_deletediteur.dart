import 'package:mysql1/mysql1.dart';

import 'db_editeur.dart';
import 'ihm_principal.dart';

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
      print("|   4 = Supprimer tout en fonction d'un produit         |");
      print("|   5 = Supprimer tout en fonction d'un type            |");
      print("|   6 = Supprimer un éditeur en fonction d'un ID        |");
      print("|   7 = Supprimer un éditeur en fonction d'une ville    |");
      print("|   8 = Supprimer un éditeur en fonction d'un nom       |");
      print("|   9 = Supprimer un éditeur en fonction d'un produit   |");
      print("|   10 = Supprimer un éditeur en fonction d'un type     |");
      print("|                                                       |");
      print("+-------------------------------------------------------+");
      choix = IHM.saisirAction(10);
      print("--------------------------------------------------");
      if (choix == 1) {
        await IHMDeletEditeur.askDeleteAllEditeurs(settings);
      } else if (choix == 2) {
        await IHMDeletEditeur.askDeleteAllEditeursVille(settings);
      } else if (choix == 3) {
        await IHMDeletEditeur.askDeleteAllEditeursNom(settings);
      } else if (choix == 4) {
        await IHMDeletEditeur.askDeleteAllEditeursNomProduit(settings);
      } else if (choix == 5) {
        await IHMDeletEditeur.askDeleteAllEditeursTypeProduit(settings);
      } else if (choix == 6) {
        await IHMDeletEditeur.askDeleteEditeurID(settings);
      } else if (choix == 7) {
        await IHMDeletEditeur.askDeleteEditeurVille(settings);
      } else if (choix == 8) {
        await IHMDeletEditeur.askDeleteEditeurNom(settings);
      } else if (choix == 9) {
        await IHMDeletEditeur.askDeleteEditeurNomProduit(settings);
      } else if (choix == 10) {
        await IHMDeletEditeur.askDeleteEditeurTypeProduit(settings);
      }
    }
    print("Retour menu précédent.");
    print("--------------------------------------------------");
    await Future.delayed(Duration(seconds: 1));
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
    IHMDeletEditeur.deleteUnEditeur(settings);
  }

  static Future<void> deleteUnEditeur(ConnectionSettings settings) async {
    int idEditeur = IHM.saisirInt("son ID");
    print(
        "Attention, TOUS les produits qui dépendaient de l'éditeur choisi seront aussi supprimés.");
    if (IHM.confirmation()) {
      await DBEditeur.deleteEditeurInCreerAndProduit(settings, idEditeur);
      await DBEditeur.deleteEditeur(settings, idEditeur);
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

  static Future<void> askDeleteEditeurNomProduit(
      ConnectionSettings settings) async {
    print("Vous voulez supprimer un éditeur en fonction d'un produit.");
    String nomProduit = IHM.saisirString("son nom.");
    print("Voici la liste des différents éditeur avec ce nom là");
    IHM.afficherDesDonnees(
        await DBEditeur.selectEditeursByNomProduit(settings, nomProduit));
    await IHMDeletEditeur.deleteUnEditeur(settings);
  }

  static Future<void> askDeleteEditeurTypeProduit(
      ConnectionSettings settings) async {
    print("Vous voulez supprimer un auteur en fonction d'un type de produit.");
    String typeProduit = IHM.saisirString("son type.");
    print("Voici la liste des différents auteurs avec ce nom là");
    IHM.afficherDesDonnees(
        await DBEditeur.selectEditeursByTypeProduit(settings, typeProduit));
    await IHMDeletEditeur.deleteUnEditeur(settings);
  }

  static Future<void> askDeleteAllEditeursVille(
      ConnectionSettings settings) async {
    print("Vous voulez supprimer tous les éditeurs venant de la même ville.");
    String villeEditeur = IHM.saisirString("la ville");
    print(
        "Attention, TOUS les produits qui dépendaient de l'éditeur choisi seront aussi supprimés.");
    if (IHM.confirmation()) {
      for (int idEditeur
          in await DBEditeur.selectIdEditeursByVille(settings, villeEditeur)) {
        await DBEditeur.deleteEditeurInCreerAndProduit(settings, idEditeur);
        await DBEditeur.deleteEditeur(settings, idEditeur);
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
    print(
        "Attention, TOUS les produits qui dépendaient de l'éditeur choisi seront aussi supprimés.");
    if (IHM.confirmation()) {
      for (int idEditeur
          in await DBEditeur.selectIdEditeursByNom(settings, nomEditeur)) {
        await DBEditeur.deleteEditeurInCreerAndProduit(settings, idEditeur);
        await DBEditeur.deleteEditeur(settings, idEditeur);
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

  static Future<void> askDeleteAllEditeursNomProduit(
      ConnectionSettings settings) async {
    print("Vous voulez supprimer tous les éditeurs associés au même produit.");
    String nomProduit = IHM.saisirString("le nom du produit.");
    print(
        "Attention, TOUS les produits qui dépendaient de l'éditeur choisi seront aussi supprimés.");
    if (IHM.confirmation()) {
      for (int idEditeur in await DBEditeur.selectIdEditeursByNomProduit(
          settings, nomProduit)) {
        await DBEditeur.deleteEditeurInCreerAndProduit(settings, idEditeur);
        await DBEditeur.deleteEditeur(settings, idEditeur);
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

  static Future<void> askDeleteAllEditeursTypeProduit(
      ConnectionSettings settings) async {
    print(
        "Vous voulez supprimer tous les éditeurs associés au même type de produit.");
    String typeProduit = IHM.saisirString("le type de produit.");
    print(
        "Attention, TOUS les produits qui dépendaient de l'éditeur choisi seront aussi supprimés.");
    if (IHM.confirmation()) {
      for (int idEditeur in await DBEditeur.selectIdEditeursByTypeProduit(
          settings, typeProduit)) {
        await DBEditeur.deleteEditeurInCreerAndProduit(settings, idEditeur);
        await DBEditeur.deleteEditeur(settings, idEditeur);
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
