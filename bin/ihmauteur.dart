import 'package:mysql1/mysql1.dart';

import 'db_auteur.dart';
import 'db_produit.dart';
import 'ihm.dart';
import 'ihmdeleteauteur.dart';
import 'ihmselectauteur.dart';

class IHMAuteur {
  static Future<void> choisirActionAuteur(ConnectionSettings settings) async {
    int choix = -1;
    while (choix != 0) {
      print("");
      print("+-------------------------------------------------------+");
      print("|                                                       |");
      print("|   Menu - Gestion Auteur                               |");
      print("|   Quelle action voulez-vous choisir ?                 |");
      print("|   0 = Quitter                                         |");
      print("|   1 = Ajouter un auteur                               |");
      print("|   2 = Supprimer un ou plusieurs auteurs               |");
      print("|   3 = Afficher un ou plusieurs auteurs                |");
      print("|   4 = Modifier un auteur                              |");
      print("|                                                       |");
      print("+-------------------------------------------------------+");
      choix = IHM.saisirAction(4);
      print("--------------------------------------------------");
      if (choix == 1) {
        await IHMAuteur.askInsertAuteur(settings);
      } else if (choix == 2) {
        await IHMDeleteAuteur.choisirActionDeletAuteur(settings);
      } else if (choix == 3) {
        await IHMSelectAuteur.choisirActionSelectAuteur(settings);
      } else if (choix == 4) {
        await IHMAuteur.askUpdateAuteur(settings);
      }
    }
    print("Retour menu précédent.");
    print("--------------------------------------------------");
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> askInsertAuteur(ConnectionSettings settings) async {
    print("Vous voulez saisir un Auteur.");
    String nomAuteur = IHM.saisirString("son nom");
    String prenomAuteur = IHM.saisirString("son prénom");
    DBAuteur.insertAuteur(settings, nomAuteur, prenomAuteur);
    await IHMAuteur.askInsertAuteurInCreer(
        settings, await DBAuteur.selectIdLastAuteur(settings));
  }

  static Future<void> askUpdateAuteur(ConnectionSettings settings) async {
    print("Vous voulez modifier un auteur.");
    int idAuteur = IHM.saisirInt("son ID");
    //L'auteur est présent ?
    bool auteurPresent = false;
    List<int> laListeIdauteur = await DBAuteur.selectIdAuteurs(settings);
    int i = 0;
    while (auteurPresent == false && i < laListeIdauteur.length) {
      if (idAuteur == laListeIdauteur[i]) {
        auteurPresent = true;
      }
      i++;
    }
    if (auteurPresent) {
      print("Vous souhaitez modifier l'auteur :");
      IHM.afficherUneDonnee(await DBAuteur.selectAuteur(settings, idAuteur));
      if (IHM.confirmation()) {
        String nomAuteur = IHM.saisirString("son nom");
        String prenomAuteur = IHM.saisirString("son prénom");
        if (IHM.confirmation()) {
          if (await DBAuteur.exist(settings, idAuteur)) {
            DBAuteur.updateAuteur(settings, idAuteur, nomAuteur, prenomAuteur);
            print("Editeur modifié.");
            print("Fin de l'opération.");
            print("--------------------------------------------------");
            print("");
            await Future.delayed(Duration(seconds: 1));
            print("L'auteur a été changé en :");
            IHM.afficherUneDonnee(
                await DBAuteur.selectAuteur(settings, idAuteur));
          } else {
            print("Vous ne souhaitez pas modifier l'auteur.");
            print("Annulation de l'opération.");
            print("--------------------------------------------------");
            await Future.delayed(Duration(seconds: 1));
          }
          await Future.delayed(Duration(seconds: 1));
          await IHMAuteur.askInsertAuteurInCreer(settings, idAuteur);
        } else {
          print("L'auteur n'existe pas.");
        }
      } else {
        print("Annulation de l'opération.");
        print("--------------------------------------------------");
        await Future.delayed(Duration(seconds: 1));
      }
    } else {
      print("Id de l'auteur non reconnu");
    }
  }

  static Future<void> askInsertAuteurInCreer(
      ConnectionSettings settings, int idAuteur) async {
    print("Voulez-vous associer ce produit avec un auteur ?");
    if (IHM.confirmation()) {
      print("Avec quel produit voulez-vous associer l'auteur ?");
      int idProduit = IHM.saisirInt("son ID");
      //Le produit est présent ?
      bool produitPresent = false;
      List<int> laListeIdProduits = await DBProduit.selectIdProduits(settings);
      int i = 0;
      while (produitPresent == false && i < laListeIdProduits.length) {
        if (idProduit == laListeIdProduits[i]) {
          produitPresent = true;
        }
        i++;
      }
      if (produitPresent) {
        print("Vous souhaitez associer au produit :");
        IHM.afficherUneDonnee(
            await DBProduit.selectProduit(settings, idProduit));
        if (IHM.confirmation()) {
          await DBAuteur.insertAuteurtInCreer(settings, idProduit, idAuteur);
        }
      } else {
        print("Id du produit non reconnu");
        print("--------------------------------------------------");
        await Future.delayed(Duration(seconds: 1));
      }
    } else {
      print("Le produit ne sera pas associé.");
    }
  }
}
