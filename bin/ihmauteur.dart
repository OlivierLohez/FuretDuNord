import 'package:mysql1/mysql1.dart';

import 'db_auteur.dart';
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
      print("|   3 = Sélectionner un ou plusieurs auteurs            |");
      print("|   4 = Modifier un auteur                              |");
      print("|                                                       |");
      print("+-------------------------------------------------------+");
      choix = IHM.saisirAction(4);
      if (choix == 0) {
        print("On recommence");
      }
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
  }

  static Future<void> askInsertAuteur(ConnectionSettings settings) async {
    print("Vous voulez saisir un Auteur.");
    String nomAuteur = IHM.saisirString("son nom");
    String prenomAuteur = IHM.saisirString("son prénom");
    DBAuteur.insertAuteur(settings, nomAuteur, prenomAuteur);
  }

  static Future<void> askUpdateAuteur(ConnectionSettings settings) async {
    print("Vous voulez modifier un auteur.");
    print("Veuillez saisir son ID");
    int idAuteur = IHM.saisirIntRec();
    //print(idEditeur);
    print("Vous souhaitez modifier l'éditeur :");
    IHM.afficherUneDonnee(await DBAuteur.selectAuteur(settings, idAuteur));
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
        print("L'éditeur a été changé en :");
        IHM.afficherUneDonnee(await DBAuteur.selectAuteur(settings, idAuteur));
        await Future.delayed(Duration(seconds: 1));
      } else {
        print("L'éditeur n'existe pas.");
      }
    } else {
      print("Annulation de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }
}
