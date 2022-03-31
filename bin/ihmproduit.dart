import 'db_editeur.dart';
import 'db_produit.dart';
import 'ihm.dart';
import 'ihmdeletproduit.dart';
import 'ihmselectproduit.dart';

class IHMPRODUIT {
  // Methodes
  // L'affichage permettant de montrant le choix des différentes actions
  static Future<void> choisirActionProduit() async {
    int choix = -1;
    while (choix != 0) {
      print("");
      print("+-------------------------------------------------------+");
      print("|                                                       |");
      print("|   Menu - Gestion Produit                              |");
      print("|   Quelle action voulez-vous choisir ?                 |");
      print("|   0 = Quitter                                         |");
      print("|   1 = Ajouter un produit                              |");
      print("|   2 = Supprimer un ou plusieurs produits              |");
      print("|   3 = Sélectionner un ou plusieurs produits           |");
      print("|   4 = Modifier un produit                             |");
      print("|                                                       |");
      print("+-------------------------------------------------------+");
      choix = IHM.saisirAction(4);
      if (choix == 0) {
        print("On recommence");
      }
      if (choix == 1) {
        await IHMPRODUIT.askInsertProduit();
      } else if (choix == 2) {
        await IHMDeleteProduit.choisirActionDeleteProduit();
      } else if (choix == 3) {
        await IHMSelectProduit.choisirActionSelectProduit();
      } else if (choix == 4) {
        await IHMPRODUIT.askUpdateProduit();
      }
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
    bool editeurValide = false;
    bool editeurPresent = false;
    List<int> laListeIdEditeur = await DBEditeur.selectIdEditeurs();
    while (editeurValide == false) {
      print("Veuillez saisir l'id de son éditeur");
      int idEditeur = IHM.saisirIntRec();
      //L'éditeur est présent ?
      if (laListeIdEditeur.isEmpty) {
        print("La liste éditeur est vide, veuillez la remplir");
        editeurPresent = true;
      } else {
        int i = 0;
        while (editeurPresent == false && i < laListeIdEditeur.length) {
          if (idEditeur == laListeIdEditeur[i]) {
            editeurPresent = true;
          }
          i++;
        }
        if (editeurPresent) {
          await DBProduit.insertProduit(
              nomProduit, stock, dateParution, type, prix, idEditeur);
          editeurValide = true;
        } else {
          print("Id de l'éditeur non reconnu");
        }
      }
    }
  }

  static Future<void> askUpdateProduit() async {
    print("Vous voulez modifier un produit.");
    print("Veuillez saisir son ID");
    int idProduit = IHM.saisirIntRec();
    print(idProduit);
    //Le produit est présent ?
    bool produitPresent = false;
    List<int> laListeIdProduit = await DBProduit.selectIdProduits();
    int i = 0;
    while (produitPresent == false && i < laListeIdProduit.length) {
      if (idProduit == laListeIdProduit[i]) {
        produitPresent = true;
      }
      i++;
    }
    if (produitPresent) {
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
          DBProduit.updateProduit(idProduit, nomProduit, stock, dateParution,
              type, prix, idEditeur);
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
    } else {
      print("Id du produit non reconnu");
    }
  }
}
