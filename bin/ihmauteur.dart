import 'db_auteur.dart';
import 'ihm.dart';
import 'ihmdeleteauteur.dart';
import 'ihmselectauteur.dart';

class IHMAuteur {
  static Future<void> choisirActionAuteur() async {
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
    int choix = IHM.saisirAction(4);
    if (choix == 0) {
      print("On recommence");
    }
    if (choix == 1) {
      IHMAuteur.askInsertAuteur();
    } else if (choix == 2) {
      IHMDeleteAuteur.choisirActionDeletediteur();
    } else if (choix == 3) {
      await IHMSelectAuteur.choisirActionSelectAuteur();
    } else if (choix == 4) {
      await IHMAuteur.askUpdateAuteur();
    }
  }

  static Future<void> askInsertAuteur() async {
    print("Vous voulez saisir un Auteur.");
    print("Veuillez saisir son nom");
    String nomAuteur = IHM.saisirStringRec();
    print("Veuillez saisir son prénom");
    String prenomAuteur = IHM.saisirStringRec();
    DBAuteur.insertAuteur(nomAuteur, prenomAuteur);
  }

  static Future<void> askUpdateAuteur() async {
    print("Vous voulez modifier un auteur.");
    print("Veuillez saisir son ID");
    int idAuteur = IHM.saisirIntRec();
    //print(idEditeur);
    print("Vous souhaitez modifier l'éditeur :");
    IHM.afficherUneDonnee(await DBAuteur.selectAuteur(idAuteur));
    print("Veuillez saisir son nom");
    String nomAuteur = IHM.saisirStringRec();
    print("Veuillez saisir son prénom");
    String prenomAuteur = IHM.saisirStringRec();
    if (IHM.confirmation()) {
      if (await DBAuteur.exist(idAuteur)) {
        DBAuteur.updateAuteur(idAuteur, nomAuteur, prenomAuteur);
        print("Editeur modifié.");
        print("Fin de l'opération.");
        print("--------------------------------------------------");
        print("");
        await Future.delayed(Duration(seconds: 1));
        print("L'éditeur a été changé en :");
        IHM.afficherUneDonnee(await DBAuteur.selectAuteur(idAuteur));
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
