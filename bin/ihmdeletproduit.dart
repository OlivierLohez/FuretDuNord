import 'package:mysql1/mysql1.dart';

import 'db_produit.dart';
import 'ihm.dart';

class IHMDeleteProduit {
  // Methodes
  // L'affichage permettant de montrant le choix des différentes actions
  static Future<void> choisirActionDeleteProduit(
      ConnectionSettings settings) async {
    int choix = -1;
    while (choix != 0) {
      print("");
      print("+-------------------------------------------------------+");
      print("|                                                       |");
      print("|   Menu - Suppression Produit                          |");
      print("|   Quelle action voulez-vous choisir ?                 |");
      print("|   0 = Quitter                                         |");
      print("|   1 = Supprimer tout                                  |");
      print("|   2 = Supprimer tout en fonction d'un nom             |");
      print("|   3 = Supprimer tout en fonction d'une quantité       |");
      print("|   4 = Supprimer tout en fonction d'un type            |");
      print("|   5 = Supprimer tout en fonction d'un prix            |");
      print("|   6 = Supprimer tout en fonction d'une ville          |");
      print("|   7 = Supprimer tout en fonction d'un éditeur         |");
      print("|   8 = Supprimer un produit en fonction d'un ID        |");
      print("|   9 = Supprimer un produit en fonction d'un nom       |");
      print("|   10 = Supprimer un produit en fonction d'une quantité|");
      print("|   11 = Supprimer un produit en fonction d'une type    |");
      print("|   12 = Supprimer un produit en fonction d'un prix     |");
      print("|   13 = Supprimer un produit en fonction d'une ville   |");
      print("|   14 = Supprimer un produit en fonction d'un éditeur  |");
      print("|                                                       |");
      print("+-------------------------------------------------------+");
      choix = IHM.saisirAction(14);
      print("--------------------------------------------------");
      if (choix == 1) {
        await IHMDeleteProduit.askDeleteAllProduits(settings);
      } else if (choix == 2) {
        await IHMDeleteProduit.askDeleteAllProduitsNom(settings);
      } else if (choix == 3) {
        await IHMDeleteProduit.askDeleteAllProduitsStock(settings);
      } else if (choix == 4) {
        await IHMDeleteProduit.askDeleteAllProduitsType(settings);
      } else if (choix == 5) {
        await IHMDeleteProduit.askDeleteAllProduitsStock(settings);
      } else if (choix == 6) {
        await IHMDeleteProduit.askDeleteAllProduitsVilleEditeur(settings);
      } else if (choix == 7) {
        await IHMDeleteProduit.askDeleteAllProduitsNomEditeur(settings);
      } else if (choix == 8) {
        await IHMDeleteProduit.askDeleteProduitID(settings);
      } else if (choix == 9) {
        await IHMDeleteProduit.askDeleteProduitNom(settings);
      } else if (choix == 10) {
        await IHMDeleteProduit.askDeleteProduitStock(settings);
      } else if (choix == 11) {
        await IHMDeleteProduit.askDeleteProduitType(settings);
      } else if (choix == 12) {
        await IHMDeleteProduit.askDeleteProduitPrix(settings);
      } else if (choix == 13) {
        await IHMDeleteProduit.askDeleteProduitNomVille(settings);
      } else if (choix == 14) {
        await IHMDeleteProduit.askDeleteProduitNomEditeur(settings);
      }
    }
    print("Retour menu précédent.");
    print("--------------------------------------------------");
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> askDeleteAllProduits(ConnectionSettings settings) async {
    print("Vous voulez supprimer tous les produits.");
    if (IHM.confirmation()) {
      DBProduit.deleteAllProduits(settings);
      print("Tous les produits ont été supprimés.");
      print("Fin de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    } else {
      print("Annulation de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }

  static Future<void> askDeleteProduitID(ConnectionSettings settings) async {
    print("Vous voulez supprimer un produit en fonction d'un ID.");
    print("Veuillez saisir son ID");
    int produit = IHM.saisirIntRec();
    if (IHM.confirmation()) {
      await DBProduit.deleteProduit(settings, produit);
      print("Produit supprimé.");
      print("Fin de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    } else {
      print("Annulation de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }

  static Future<void> deleteUnProduit(ConnectionSettings settings) async {
    print("Veuillez saisir l'ID du produit à supprimer.");
    int produit = IHM.saisirIntRec();
    if (IHM.confirmation()) {
      DBProduit.deleteProduit(settings, produit);
      print("Produit supprimé.");
      print("Fin de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    } else {
      print("Annulation de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }

  static Future<void> askDeleteProduitNom(ConnectionSettings settings) async {
    print("Vous voulez supprimer un produit en fonction de son nom.");
    String nomProduit = IHM.saisirString("son nom.");
    print("Voici la liste des différents produits avec ce nom là");
    IHM.afficherDesDonnees(
        await DBProduit.selectProduitsByNom(settings, nomProduit));
    await IHMDeleteProduit.deleteUnProduit(settings);
  }

  static Future<void> askDeleteProduitStock(ConnectionSettings settings) async {
    print("Vous voulez supprimer un produit en fonction de son stock.");
    print("Veuillez saisir sa quantité.");
    int stock = IHM.saisirIntRec();
    print("Voici la liste des différents produits avec cette quantité là");
    IHM.afficherDesDonnees(
        await DBProduit.selectProduitsByStock(settings, stock));
    await IHMDeleteProduit.deleteUnProduit(settings);
  }

  static Future<void> askDeleteProduitType(ConnectionSettings settings) async {
    print("Vous voulez supprimer un produit en fonction de son type.");
    String type = IHM.saisirString("son type.");
    print("Voici la liste des différents produits avec ce type là");
    IHM.afficherDesDonnees(
        await DBProduit.selectProduitsByType(settings, type));
    await IHMDeleteProduit.deleteUnProduit(settings);
  }

  static Future<void> askDeleteProduitPrix(ConnectionSettings settings) async {
    print("Vous voulez supprimer un produit en fonction de son prix.");
    print("Veuillez saisir son prix.");
    double prix = IHM.saisirDoubleRec();
    print("Voici la liste des différents produits avec ce prix là");
    IHM.afficherDesDonnees(
        await DBProduit.selectProduitsByPrix(settings, prix));
    await IHMDeleteProduit.deleteUnProduit(settings);
  }

  static Future<void> askDeleteProduitNomVille(
      ConnectionSettings settings) async {
    print(
        "Vous voulez supprimer un produit en fonction de la ville de l'éditeur.");
    String villeEditeur = IHM.saisirString("la ville de l'éditeur.");
    print(
        "Voici la liste des différents éditeurs présente dans cette ville-là");
    IHM.afficherDesDonnees(
        await DBProduit.selectProduitsByVilleEditeur(settings, villeEditeur));
    await IHMDeleteProduit.deleteUnProduit(settings);
  }

  static Future<void> askDeleteProduitNomEditeur(
      ConnectionSettings settings) async {
    print("Vous voulez supprimer un produit en fonction du nom de l'éditeur.");
    String nomEditeur = IHM.saisirString("son nom.");
    print("Voici la liste des différents éditeurs avec ce nom là");
    IHM.afficherDesDonnees(
        await DBProduit.selectProduitsByNomEditeur(settings, nomEditeur));
    await IHMDeleteProduit.deleteUnProduit(settings);
  }

  static Future<void> askDeleteAllProduitsNom(
      ConnectionSettings settings) async {
    print("Vous voulez supprimer tous les produits du même nom.");
    String nomProduit = IHM.saisirString("le nom.");
    if (IHM.confirmation()) {
      for (int idProduit
          in await DBProduit.selectIdProduitsByNom(settings, nomProduit)) {
        await DBProduit.deleteProduit(settings, idProduit);
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

  static Future<void> askDeleteAllProduitsStock(
      ConnectionSettings settings) async {
    print(
        "Vous voulez supprimer tous les produits ayant la même quantié de stock.");
    print("Veuillez saisir la quantité.");
    int stock = IHM.saisirIntRec();
    if (IHM.confirmation()) {
      for (int idProduit
          in await DBProduit.selectIdProduitsByStock(settings, stock)) {
        await DBProduit.deleteProduit(settings, idProduit);
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

  static Future<void> askDeleteAllProduitsType(
      ConnectionSettings settings) async {
    print("Vous voulez supprimer tous les produits du même type.");
    String type = IHM.saisirString("le type.");
    if (IHM.confirmation()) {
      for (int idProduit
          in await DBProduit.selectIdProduitsByType(settings, type)) {
        await DBProduit.deleteProduit(settings, idProduit);
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

  static Future<void> askDeleteAllProduitsPrix(
      ConnectionSettings settings) async {
    print("Vous voulez supprimer tous les produits ayant le même prix.");
    print("Veuillez saisir le prix.");
    double prix = IHM.saisirDoubleRec();
    if (IHM.confirmation()) {
      for (int idProduit
          in await DBProduit.selectIdProduitsByPrix(settings, prix)) {
        await DBProduit.deleteProduit(settings, idProduit);
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

  static Future<void> askDeleteAllProduitsVilleEditeur(
      ConnectionSettings settings) async {
    print(
        "Vous voulez supprimer tous les produits dont l'éditeur vient de la même ville.");
    String villeEditeur = IHM.saisirString("la ville.");
    if (IHM.confirmation()) {
      for (int idProduit in await DBProduit.selectIdProduitsByVilleEditeur(
          settings, villeEditeur)) {
        await DBProduit.deleteProduit(settings, idProduit);
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

  static Future<void> askDeleteAllProduitsNomEditeur(
      ConnectionSettings settings) async {
    print("Vous voulez supprimer tous les produits portant le même éditeur.");
    String nomEditeur = IHM.saisirString("le nom de l'éditeur.");
    if (IHM.confirmation()) {
      for (int idProduit in await DBProduit.selectIdProduitsByNomEditeur(
          settings, nomEditeur)) {
        await DBProduit.deleteProduit(settings, idProduit);
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
