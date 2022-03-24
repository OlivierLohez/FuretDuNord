import 'db_editeur.dart';
import 'ihm.dart';
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
    print("|   2 = Supprimer un éditeur                            |");
    print("|   3 = Sélectionner un ou plusieurs éditeurs           |");
    print("|   4 = Modifier un éditeur                             |");
    print("|                                                       |");
    print("+-------------------------------------------------------+");
    int choix = IHM.saisirAction(4);
    if (choix == 0) {
      print("On recommence");
    }
    if (choix == 1) {
      IHMEditeur.demandeInsererEditeur();
    } else if (choix == 2) {
      IHMEditeur.demandeSupprimerEditeurNom();
    } else if (choix == 3) {
      await IHMSelectEditeur.choisirActionSelectEditeur();
    } else if (choix == 4) {
      await IHMEditeur.demandeModifierEditeur();
    }
  }

  static Future<void> demandeInsererEditeur() async {
    print("Vous voulez saisir un éditeur.");
    print("Veuillez saisir son nom");
    String nomEditeur = IHM.saisirStringRec();
    print("Veuillez saisir sa ville");
    String villeEditeur = IHM.saisirStringRec();
    print("Veuillez saisir son adresse");
    String adresseEditeur = IHM.saisirStringRec();
    DBEditeur.insertEditeur(nomEditeur, adresseEditeur, villeEditeur);
  }

  static Future<void> demandeSupprimerEditeurID() async {
    print("Vous voulez supprimer un éditeur en fonction d'un ID.");
    print("Veuillez saisir son ID");
    DBEditeur.deleteEditeur(IHM.saisirIntRec());
  }

  static Future<void> demandeSupprimerEditeurNom() async {
    print("Vous voulez supprimer un éditeur en fonction d'un nom.");
    print("Veuillez saisir son nom");
    DBEditeur.deleteEditeurByName(IHM.saisirStringRec());
  }

  static Future<void> demandeModifierEditeur() async {
    print("Vous voulez modifier un éditeur.");
    print("Veuillez saisir son ID");
    int idEditeur = IHM.saisirIntRec();

    print("Veuillez saisir son nom");
    String nomEditeur = IHM.saisirStringRec();
    print("Veuillez saisir sa ville");
    String villeEditeur = IHM.saisirStringRec();
    print("Veuillez saisir son adresse");
    String adresseEditeur = IHM.saisirStringRec();
    DBEditeur.updateEditeur(
        idEditeur, nomEditeur, adresseEditeur, villeEditeur);
  }
}
