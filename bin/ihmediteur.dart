import 'package:mysql1/mysql1.dart';

import 'db_editeur.dart';
import 'ihm.dart';
import 'ihmdeletediteur.dart';
import 'ihmselectediteur.dart';

class IHMEditeur {
  // Methodes
  // L'affichage permettant de montrant le choix des différentes actions
  static Future<void> choisirActionEditeur(ConnectionSettings settings) async {
    int choix = -1;
    while (choix != 0) {
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
      choix = IHM.saisirAction(4);
      print("--------------------------------------------------");
      if (choix == 1) {
        await IHMEditeur.askInsertEditeur(settings);
      } else if (choix == 2) {
        IHMDeletEditeur.choisirActionDeletediteur(settings);
      } else if (choix == 3) {
        await IHMSelectEditeur.choisirActionSelectEditeur(settings);
      } else if (choix == 4) {
        await IHMEditeur.askUpdateEditeur(settings);
      }
    }
    print("Retour menu précédent.");
    print("--------------------------------------------------");
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> askInsertEditeur(ConnectionSettings settings) async {
    print("Vous voulez saisir un éditeur.");
    String nomEditeur = IHM.saisirString("son nom");
    String villeEditeur = IHM.saisirString("sa ville");
    String adresseEditeur = IHM.saisirString("son adresse");
    await DBEditeur.insertEditeur(
        settings, nomEditeur, adresseEditeur, villeEditeur);
  }

  static Future<void> askUpdateEditeur(ConnectionSettings settings) async {
    print("Vous voulez modifier un éditeur.");
    print("Veuillez saisir son ID");
    int idEditeur = IHM.saisirIntRec();
    //L'éditeur est présent ?
    bool editeurPresent = false;
    List<int> laListeIdEditeur = await DBEditeur.selectIdEditeurs(settings);
    int i = 0;
    while (editeurPresent == false && i < laListeIdEditeur.length) {
      if (idEditeur == laListeIdEditeur[i]) {
        editeurPresent = true;
      }
      i++;
    }
    if (editeurPresent) {
      print("Vous souhaitez modifier l'éditeur :");
      IHM.afficherUneDonnee(await DBEditeur.selectEditeur(settings, idEditeur));
      String nomEditeur = IHM.saisirString("son nom");
      String villeEditeur = IHM.saisirString("sa ville");
      String adresseEditeur = IHM.saisirString("son adresse");
      if (IHM.confirmation()) {
        if (await DBEditeur.exist(settings, idEditeur)) {
          DBEditeur.updateEditeur(
              settings, idEditeur, nomEditeur, adresseEditeur, villeEditeur);
          print("Editeur modifié.");
          print("Fin de l'opération.");
          print("--------------------------------------------------");
          print("");
          await Future.delayed(Duration(seconds: 1));
          print("L'éditeur a été changé en :");
          IHM.afficherUneDonnee(
              await DBEditeur.selectEditeur(settings, idEditeur));
          await Future.delayed(Duration(seconds: 1));
        } else {
          print("L'éditeur n'existe pas.");
        }
      } else {
        print("Annulation de l'opération.");
        print("--------------------------------------------------");
        await Future.delayed(Duration(seconds: 1));
      }
    } else {
      print("Id de l'éditeur non reconnu");
    }
  }
}
