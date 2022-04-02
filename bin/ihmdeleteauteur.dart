import 'db_auteur.dart';
import 'ihm.dart';

class IHMDeleteAuteur {
  static Future<void> choisirActionDeletediteur() async {
    print("");
    print("+-------------------------------------------------------+");
    print("|                                                       |");
    print("|   Menu - Suppression Auteur                           |");
    print("|   Quelle action voulez-vous choisir ?                 |");
    print("|   0 = Quitter                                         |");
    print("|   1 = Supprimer tout                                  |");
    print("|   2 = Supprimer tout en fonction d'un nom             |");
    print("|   3 = Supprimer tout en fonction d'un prenom          |");
    print("|   4 = Supprimer un éditeur en fonction d'un ID        |");
    print("|   5 = Supprimer un éditeur en fonction d'un nom       |");
    print("|   6 = Supprimer un éditeur en fonction d'un prenom    |");
    print("|                                                       |");
    print("+-------------------------------------------------------+");
    int laTable = IHM.saisirAction(6);
    if (laTable == 0) {
      print("On retourne au début");
    }
    if (laTable == 1) {
      await IHMDeleteAuteur.askDeleteAllAuteurs();
    } else if (laTable == 2) {
      await IHMDeleteAuteur.askDeleteAllAuteursNom();
    } else if (laTable == 3) {
      await IHMDeleteAuteur.askDeleteAllAuteursPrenom();
    } else if (laTable == 4) {
      await IHMDeleteAuteur.askDeleteAuteurID();
    } else if (laTable == 5) {
      await IHMDeleteAuteur.askDeleteAuteurNom();
    } else if (laTable == 6) {
      await IHMDeleteAuteur.askDeleteAuteurPrenom();
    }
  }

  static Future<void> askDeleteAllAuteurs() async {
    print("Vous voulez supprimer tous les auteurs.");
    if (IHM.confirmation()) {
      DBAuteur.deleteAllAuteurs();
      print("Tous les Auteurs ont été supprimés.");
      print("Fin de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    } else {
      print("Annulation de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }

  static Future<void> askDeleteAuteurID() async {
    print("Vous voulez supprimer un auteur en fonction d'un ID.");
    print("Veuillez saisir son ID");
    int auteur = IHM.saisirIntRec();
    if (IHM.confirmation()) {
      await DBAuteur.deleteAuteur(auteur);
      print("Auteur supprimé.");
      print("Fin de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    } else {
      print("Annulation de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }

  static Future<void> askDeleteAuteurPrenom() async {
    print("Vous voulez supprimer un auteur en fonction d'un prénom.");
    print("Veuillez saisir le prenom de l'auteur.");
    String prenomAuteur = IHM.saisirStringRec();
    print("Voici la liste des différents auteurs présente avec ce prénom");
    IHM.afficherDesDonnees(await DBAuteur.selectAuteursByPrenom(prenomAuteur));
    print("Veuillez saisir l'ID de l'Auteur à supprimer.");
    int editeur = IHM.saisirIntRec();
    if (IHM.confirmation()) {
      await DBAuteur.deleteAuteur(editeur);
      print("Auteur supprimé.");
      print("Fin de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    } else {
      print("Annulation de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }

  static Future<void> askDeleteAuteurNom() async {
    print("Vous voulez supprimer un auteur en fonction d'un Nom.");
    print("Veuillez saisir le Nom de l'auteur.");
    String nomAuteur = IHM.saisirStringRec();
    print("Voici la liste des différents auteurs présente avec ce nom");
    IHM.afficherDesDonnees(await DBAuteur.selectAuteursByNom(nomAuteur));
    print("Veuillez saisir l'ID de l'Auteur à supprimer.");
    int editeur = IHM.saisirIntRec();
    if (IHM.confirmation()) {
      await DBAuteur.deleteAuteur(editeur);
      print("Auteur supprimé.");
      print("Fin de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    } else {
      print("Annulation de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }

  static Future<void> askDeleteAllAuteursPrenom() async {
    print("Vous voulez supprimer tous les Auteurs ayant le même prénom");
    print("Veuillez saisir le prénom.");
    String prenomAuteur = IHM.saisirStringRec();
    if (IHM.confirmation()) {
      for (int idAuteur
          in await DBAuteur.selectIdAuteursByPrenom(prenomAuteur)) {
        await DBAuteur.deleteAuteur(idAuteur);
      }
      print("Les auteurs ont été supprimés.");
      print("Fin de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    } else {
      print("Annulation de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }

  static Future<void> askDeleteAllAuteursNom() async {
    print("Vous voulez supprimer tous les Auteurs ayant le même nom");
    print("Veuillez saisir le nom.");
    String nomAuteur = IHM.saisirStringRec();
    if (IHM.confirmation()) {
      for (int idAuteur in await DBAuteur.selectIdAuteursByNom(nomAuteur)) {
        await DBAuteur.deleteAuteur(idAuteur);
      }
      print("Les auteurs ont été supprimés.");
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
