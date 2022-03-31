import 'dart:io';

import 'data.dart';
import 'ihmbdd.dart';
import 'ihmediteur.dart';
import 'ihmproduit.dart';

class IHM {
  // Méthodes
  // La boucle permettant de faire des saisies jusqu'à ce que l'on ne souhaite plus continuer
  static Future<void> boucleSaisie() async {
    print("Bonjour, utilisateur !");
    bool continuer = true;
    while (continuer) {
      continuer = await IHM.choisirAction();
    }
    print("Au revoir, utilisateur !");
  }

  // L'affichage permettant de montrant le choix des différentes tables
  static Future<bool> choisirAction() async {
    bool continuer = true;
    print("");
    print("+-------------------------------------------------------+");
    print("|                                                       |");
    print("|   Menu - Menu principal                               |");
    print("|   Quelle table voulez-vous choisir ?                  |");
    print("|   0 = Fin                                             |");
    print("|   1 = Manipuler les BDD                               |");
    print("|   2 = Auteur                                          |");
    print("|   3 = Editeur                                         |");
    print("|   4 = Produit                                         |");
    print("|                                                       |");
    print("+-------------------------------------------------------+");
    int laTable = IHM.saisirAction(4);
    if (laTable == 1) {
      await IHMBDD.choisirActionBDD();
    } else if (laTable == 2) {
    } else if (laTable == 3) {
      await IHMEditeur.choisirActionEditeur();
    } else if (laTable == 4) {
      await IHMPRODUIT.choisirActionProduit();
    } else if (laTable == 0) {
      continuer = false;
    }
    return continuer;
  }

  // Saisie des entiers de manière récurssive
  static int saisirIntRec() {
    print("");
    int i = 0;
    //print("Veuillez indiquer un nombre entier :");
    try {
      i = int.parse(stdin.readLineSync().toString());
    } catch (e) {
      print("Erreur lors de la saisie");
      i = saisirIntRec();
    }
    return i;
  }

  // Saisie des réels de manière récurssive
  static double saisirDoubleRec() {
    print("");
    double i = 0;
    //print("Veuillez indiquer un nombre réel :");
    try {
      i = double.parse(stdin.readLineSync().toString());
    } catch (e) {
      print("Erreur lors de la saisie");
      i = saisirDoubleRec();
    }
    return i;
  }

  // Saisie des strings de manière récurssive
  static String saisirStringRec() {
    print("");
    String c = "";
    //print("Veuillez indiquer une chaîne de caractère :");
    try {
      c = stdin.readLineSync().toString();
    } catch (e) {
      print("Erreur lors de la saisie");
      c = saisirStringRec();
    }
    return c;
  }

  // Saisie d'une action en fonction du nombre d'action autre que quitter
  static int saisirAction(int max) {
    bool valide = false;
    int action = -1;
    while (!valide) {
      try {
        action = IHM.saisirIntRec();
        if (action >= 0 && action <= max) {
          valide = true;
        } else {
          print("Vous n'avez pas saisi une action valide.");
        }
      } catch (e) {
        print("Erreur lors de la saisie");
      }
    }
    return action;
  }

  static void afficherUneDonnee(Data data) {
    print(data.getEntete());
    print(data.getInLine());
  }

  static void afficherDesDonnees(List<Data> dataList) {
    print(dataList.first.getEntete());
    for (Data laDonnee in dataList) {
      print(laDonnee.getInLine());
    }
    IHM.saisirStringRec();
  }

  // retourne un boolean pour demande de confirmation
  static bool confirmation() {
    bool saisieValide = false;
    bool confirme = false;
    while (!saisieValide) {
      print("Confirmer vous l'action ? (o/n)");
      String reponse = stdin.readLineSync().toString();
      if (reponse.toLowerCase() == "o") {
        saisieValide = true;
        confirme = true;
      } else if (reponse.toLowerCase() == "n") {
        saisieValide = true;
        print("Annulation.");
      } else {
        print("Erreur dans la saisie.");
      }
    }
    return confirme;
  }
}
