import 'db_editeur.dart';
import 'ihm.dart';
import 'ihmdeletediteur.dart';
import 'ihmselectediteur.dart';

class IHMEditeur {
  // Methodes
  // L'affichage permettant de montrant le choix des différentes actions
  static Future<void> choisirActionEditeur() async {
    print("");
    print("+-------------------------------------------------------+");
    print("|                                                       |");
    print("|   Menu - Gestion Editeur                              |");
    print("|   Quelle action voulez-vous choisir ?                 |");
    print("|   0 = Quitter                                         |");
    print("|   1 = Ajouter un éditeur                              |");
    print("|   2 = Supprimer un ou plusieurs éditeurs              |");
    print("|   3 = Sélectionner un ou plusieurs éditeurs           |");
    print("|   4 = Modifier un éditeur                             |");
    print("|                                                       |");
    print("+-------------------------------------------------------+");
    int choix = IHM.saisirAction(4);
    if (choix == 0) {
      print("On recommence");
    }
    if (choix == 1) {
      IHMEditeur.askInsertEditeur();
    } else if (choix == 2) {
      IHMDeletEditeur.choisirActionDeletediteur();
    } else if (choix == 3) {
      await IHMSelectEditeur.choisirActionSelectEditeur();
    } else if (choix == 4) {
      await IHMEditeur.askUpdateEditeur();
    }
  }

  static Future<void> askInsertEditeur() async {
    print("Vous voulez saisir un éditeur.");
    print("Veuillez saisir son nom");
    String nomEditeur = IHM.saisirStringRec();
    print("Veuillez saisir sa ville");
    String villeEditeur = IHM.saisirStringRec();
    print("Veuillez saisir son adresse");
    String adresseEditeur = IHM.saisirStringRec();
    DBEditeur.insertEditeur(nomEditeur, adresseEditeur, villeEditeur);
  }

  static Future<void> askUpdateEditeur() async {
    print("Vous voulez modifier un éditeur.");
    print("Veuillez saisir son ID");
    int idEditeur = IHM.saisirIntRec();
    //print(idEditeur);
    print("Vous souhaitez modifier l'éditeur :");
    IHM.afficherUneDonnee(await DBEditeur.selectEditeur(idEditeur));
    print("Veuillez saisir son nom");
    String nomEditeur = IHM.saisirStringRec();
    print("Veuillez saisir sa ville");
    String villeEditeur = IHM.saisirStringRec();
    print("Veuillez saisir son adresse");
    String adresseEditeur = IHM.saisirStringRec();
    if (IHM.confirmation()) {
      if (await DBEditeur.exist(idEditeur)) {
        DBEditeur.updateEditeur(
            idEditeur, nomEditeur, adresseEditeur, villeEditeur);
        print("Editeur modifié.");
        print("Fin de l'opération.");
        print("--------------------------------------------------");
        print("");
        await Future.delayed(Duration(seconds: 1));
        print("L'éditeur a été changé en :");
        IHM.afficherUneDonnee(await DBEditeur.selectEditeur(idEditeur));
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
