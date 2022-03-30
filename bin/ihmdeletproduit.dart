import 'db_produit.dart';
import 'ihm.dart';

class IHMDeleteProduit {
  // Methodes
  // L'affichage permettant de montrant le choix des différentes actions
  static Future<void> choisirActionDeleteProduit() async {
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
      print("|   10 = Supprimer un produit en fonction d'une quantité |");
      print("|   11 = Supprimer un produit en fonction d'une type     |");
      print("|   12 = Supprimer un produit en fonction d'un prix      |");
      print("|   13 = Supprimer un produit en fonction d'une ville    |");
      print("|   14 = Supprimer un produit en fonction d'un éditeur   |");
      print("|                                                       |");
      print("+-------------------------------------------------------+");
      choix = IHM.saisirAction(14);
      if (choix == 0) {
        print("On retourne au début");
      }
      if (choix == 1) {
        await IHMDeleteProduit.askDeleteAllProduits();
      } else if (choix == 2) {
        await IHMDeleteProduit.askDeleteAllProduitsNom();
      } else if (choix == 3) {
        await IHMDeleteProduit.askDeleteAllProduitsStock();
      } else if (choix == 4) {
        await IHMDeleteProduit.askDeleteAllProduitsType();
      } else if (choix == 5) {
        await IHMDeleteProduit.askDeleteAllProduitsStock();
      } else if (choix == 6) {
        await IHMDeleteProduit.askDeleteAllProduitsVilleEditeur();
      } else if (choix == 7) {
        await IHMDeleteProduit.askDeleteAllProduitsNomEditeur();
      } else if (choix == 8) {
        await IHMDeleteProduit.askDeleteProduitID();
      } else if (choix == 9) {
        await IHMDeleteProduit.askDeleteProduitNom();
      } else if (choix == 10) {
        await IHMDeleteProduit.askDeleteProduitStock();
      } else if (choix == 11) {
        await IHMDeleteProduit.askDeleteProduitType();
      } else if (choix == 12) {
        await IHMDeleteProduit.askDeleteProduitPrix();
      } else if (choix == 13) {
        await IHMDeleteProduit.askDeleteProduitNomVille();
      } else if (choix == 14) {
        await IHMDeleteProduit.askDeleteProduitNomEditeur();
      }
    }
  }

  static Future<void> askDeleteAllProduits() async {
    print("Vous voulez supprimer tous les produits.");
    if (IHM.confirmation()) {
      DBProduit.deleteAllProduits();
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

  static Future<void> askDeleteProduitID() async {
    print("Vous voulez supprimer un produit en fonction d'un ID.");
    print("Veuillez saisir son ID");
    int produit = IHM.saisirIntRec();
    if (IHM.confirmation()) {
      await DBProduit.deleteProduit(produit);
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

  static Future<void> deleteUnProduit() async {
    print("Veuillez saisir l'ID du produit à supprimer.");
    int produit = IHM.saisirIntRec();
    if (IHM.confirmation()) {
      DBProduit.deleteProduit(produit);
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

  static Future<void> askDeleteProduitNom() async {
    print("Vous voulez supprimer un produit en fonction de son nom.");
    print("Veuillez saisir son nom.");
    String nomProduit = IHM.saisirStringRec();
    print("Voici la liste des différents produits avec ce nom là");
    IHM.afficherDesDonnees(await DBProduit.selectProduitsByNom(nomProduit));
    await IHMDeleteProduit.deleteUnProduit();
  }

  static Future<void> askDeleteProduitStock() async {
    print("Vous voulez supprimer un produit en fonction de son stock.");
    print("Veuillez saisir sa quantité.");
    int stock = IHM.saisirIntRec();
    print("Voici la liste des différents produits avec cette quantité là");
    IHM.afficherDesDonnees(await DBProduit.selectProduitsByStock(stock));
    await IHMDeleteProduit.deleteUnProduit();
  }

  static Future<void> askDeleteProduitType() async {
    print("Vous voulez supprimer un produit en fonction de son type.");
    print("Veuillez saisir son type.");
    String type = IHM.saisirStringRec();
    print("Voici la liste des différents produits avec ce type là");
    IHM.afficherDesDonnees(await DBProduit.selectProduitsByType(type));
    await IHMDeleteProduit.deleteUnProduit();
  }

  static Future<void> askDeleteProduitPrix() async {
    print("Vous voulez supprimer un produit en fonction de son prix.");
    print("Veuillez saisir son prix.");
    double prix = IHM.saisirDoubleRec();
    print("Voici la liste des différents produits avec ce prix là");
    IHM.afficherDesDonnees(await DBProduit.selectProduitsByPrix(prix));
    await IHMDeleteProduit.deleteUnProduit();
  }

  static Future<void> askDeleteProduitNomVille() async {
    print(
        "Vous voulez supprimer un produit en fonction de la ville de l'éditeur.");
    print("Veuillez saisir la ville de l'éditeur.");
    String villeEditeur = IHM.saisirStringRec();
    print(
        "Voici la liste des différents éditeurs présente dans cette ville-là");
    IHM.afficherDesDonnees(
        await DBProduit.selectProduitsByVilleEditeur(villeEditeur));
    await IHMDeleteProduit.deleteUnProduit();
  }

  static Future<void> askDeleteProduitNomEditeur() async {
    print("Vous voulez supprimer un produit en fonction du nom de l'éditeur.");
    print("Veuillez saisir son nom.");
    String nomEditeur = IHM.saisirStringRec();
    print("Voici la liste des différents éditeurs avec ce nom là");
    IHM.afficherDesDonnees(
        await DBProduit.selectProduitsByNomEditeur(nomEditeur));
    await IHMDeleteProduit.deleteUnProduit();
  }

  static Future<void> askDeleteAllProduitsNom() async {
    print("Vous voulez supprimer tous les produits du même nom.");
    print("Veuillez saisir le nom.");
    String nomProduit = IHM.saisirStringRec();
    if (IHM.confirmation()) {
      for (int idProduit in await DBProduit.selectIdProduitsByNom(nomProduit)) {
        await DBProduit.deleteProduit(idProduit);
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

  static Future<void> askDeleteAllProduitsStock() async {
    print(
        "Vous voulez supprimer tous les produits ayant la même quantié de stock.");
    print("Veuillez saisir la quantité.");
    int stock = IHM.saisirIntRec();
    if (IHM.confirmation()) {
      for (int idProduit in await DBProduit.selectIdProduitsByStock(stock)) {
        await DBProduit.deleteProduit(idProduit);
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

  static Future<void> askDeleteAllProduitsType() async {
    print("Vous voulez supprimer tous les produits du même type.");
    print("Veuillez saisir le type.");
    String type = IHM.saisirStringRec();
    if (IHM.confirmation()) {
      for (int idProduit in await DBProduit.selectIdProduitsByType(type)) {
        await DBProduit.deleteProduit(idProduit);
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

  static Future<void> askDeleteAllProduitsPrix() async {
    print("Vous voulez supprimer tous les produits ayant le même prix.");
    print("Veuillez saisir le prix.");
    double prix = IHM.saisirDoubleRec();
    if (IHM.confirmation()) {
      for (int idProduit in await DBProduit.selectIdProduitsByPrix(prix)) {
        await DBProduit.deleteProduit(idProduit);
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

  static Future<void> askDeleteAllProduitsVilleEditeur() async {
    print(
        "Vous voulez supprimer tous les produits dont l'éditeur vient de la même ville.");
    print("Veuillez saisir la ville.");
    String villeEditeur = IHM.saisirStringRec();
    if (IHM.confirmation()) {
      for (int idProduit
          in await DBProduit.selectIdProduitsByVilleEditeur(villeEditeur)) {
        await DBProduit.deleteProduit(idProduit);
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

  static Future<void> askDeleteAllProduitsNomEditeur() async {
    print("Vous voulez supprimer tous les produits portant le même éditeur.");
    print("Veuillez saisir le nom de l'éditeur.");
    String nomEditeur = IHM.saisirStringRec();
    if (IHM.confirmation()) {
      for (int idProduit
          in await DBProduit.selectIdProduitsByNomEditeur(nomEditeur)) {
        await DBProduit.deleteProduit(idProduit);
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
