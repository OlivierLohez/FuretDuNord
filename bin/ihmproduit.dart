import 'db_produit.dart';
import 'ihm.dart';
import 'ihmselectproduit.dart';

class IHMPRODUIT {
  // Methodes
  // L'affichage permettant de montrant le choix des différentes actions
  static Future<void> choisirActionProduit() async {
    print("");
    print("+-------------------------------------------------------+");
    print("|                                                       |");
    print("|   Menu - Gestion Produit                              |");
    print("|   Quelle action voulez-vous choisir ?                 |");
    print("|   0 = Quitter                                         |");
    print("|   1 = Ajouter un produit                              |");
    print("|   2 = Supprimer un produit                            |");
    print("|   3 = Supprimer tous les produits                     |");
    print("|   4 = Sélectionner un ou plusieurs produits           |");
    print("|   5 = Modifier un produit                             |");
    print("|                                                       |");
    print("+-------------------------------------------------------+");
    int choix = IHM.saisirAction(5);
    if (choix == 0) {
      print("On recommence");
    }
    if (choix == 1) {
      IHMPRODUIT.askInsertProduit();
    } else if (choix == 2) {
      IHMPRODUIT.askDeleteProduitName();
    } else if (choix == 3) {
      DBProduit.deleteAllProduits();
    } else if (choix == 4) {
      await IHMSelectProduit.choisirActionSelectProduit();
    } else if (choix == 5) {
      await IHMPRODUIT.askUpdateProduit();
    }
  }

  static Future<void> askInsertProduit() async {
    print("Vous voulez saisir un produit.");
    print("Veuillez saisir son nom");
    String nomProduit = IHM.saisirStringRec();
    print("Veuillez saisir sa quantité");
    int stock = IHM.saisirIntRec();
    print("Veuillez saisir sa date de parution");
    String dateParution = IHM.saisirStringRec();
    print("Veuillez saisir son type");
    String type = IHM.saisirStringRec();
    print("Veuillez saisir son prix");
    double prix = IHM.saisirDoubleRec();
    print("Veuillez saisir l'id de son éditeur");
    int idEditeur = IHM.saisirIntRec();
    DBProduit.insertProduit(
        nomProduit, stock, dateParution, type, prix, idEditeur);
  }

  static Future<void> askDeleteProduitID() async {
    print("Vous voulez supprimer un produit en fonction d'un ID.");
    print("Veuillez saisir son ID");
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

  static Future<void> askDeleteProduitName() async {
    print("Vous voulez supprimer un produit en fonction d'un nom.");
    print("Veuillez saisir son nom");
    String produit = IHM.saisirStringRec();
    if (IHM.confirmation()) {
      DBProduit.deleteProduitByName(produit);
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

  static Future<void> askUpdateProduit() async {
    print("Vous voulez modifier un produit.");
    print("Veuillez saisir son ID");
    int idProduit = IHM.saisirIntRec();
    //print(idProduit);
    print("Vous souhaitez modifier le produit :");
    IHM.afficherUneDonnee(await DBProduit.selectProduit(idProduit));
    print("Veuillez saisir son nom");
    String nomProduit = IHM.saisirStringRec();
    print("Veuillez saisir sa quantité");
    int stock = IHM.saisirIntRec();
    print("Veuillez saisir sa date de parution");
    String dateParution = IHM.saisirStringRec();
    print("Veuillez saisir son type");
    String type = IHM.saisirStringRec();
    print("Veuillez saisir son prix");
    double prix = IHM.saisirDoubleRec();
    print("Veuillez saisir l'id de son éditeur");
    int idEditeur = IHM.saisirIntRec();
    if (IHM.confirmation()) {
      if (await DBProduit.exist(idProduit)) {
        DBProduit.updateProduit(
            idProduit, nomProduit, stock, dateParution, type, prix, idEditeur);
        print("Produit modifié.");
        print("Fin de l'opération.");
        print("--------------------------------------------------");
        print("");
        await Future.delayed(Duration(seconds: 1));
        print("Le produit a été changé en :");
        IHM.afficherUneDonnee(await DBProduit.selectProduit(idProduit));
        await Future.delayed(Duration(seconds: 1));
      } else {
        print("Le produit n'existe pas.");
      }
    } else {
      print("Annulation de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }
}
