import 'furetbd.dart';
import 'ihm.dart';

class IHMBDD {
  // menu pour la gestion basic de la BDD
  static Future<void> choisirActionBDD() async {
    int choix = -1;
    while (choix != 0) {
      print("");
      print("+-------------------------------------------------------+");
      print("|                                                       |");
      print("|   Menu - Gestion BDD                                  |");
      print("|   Quelle table voulez-vous choisir ?                  |");
      print("|   0 = Quitter                                         |");
      print("|   1 = Création des tables de la BDD                   |");
      print("|   2 = Verification des tables de la BDD               |");
      print("|   3 = Afficher les tables de la BDD                   |");
      print("|   4 = Supprimer une table dans la BDD                 |");
      print("|   5 = Supprimer toutes les tables dans la BDD         |");
      print("|                                                       |");
      print("+-------------------------------------------------------+");

      choix = IHM.saisirAction(5);
      print("--------------------------------------------------");

      if (choix == 1) {
        await IHMBDD.createTable();
      } else if (choix == 2) {
        await IHMBDD.checkTable();
      } else if (choix == 3) {
        await IHMBDD.selectTable();
      } else if (choix == 4) {
        await IHMBDD.deleteTable();
      } else if (choix == 5) {
        await IHMBDD.deleteAllTables();
      }
    }
    print("Retour menu précédent.");
    print("--------------------------------------------------");
    await Future.delayed(Duration(seconds: 1));
  }

  // action pour creer les tables
  static Future<void> createTable() async {
    print("Création des tables manquantes dans la BDD ...");
    await LaBDFuret.createTables();
    print("Fin de l'opération.");
    print("--------------------------------------------------");
    await Future.delayed(Duration(seconds: 1));
  }

// action pour vérifier les tables
  static Future<void> checkTable() async {
    print("Verification des tables dans la BDD ...");
    if (await LaBDFuret.checkTables()) {
      print("Toutes les tables sont présentes dans la BDD.");
    } else {
      print("Il manque des tables dans la BDD.");
    }
    print("Fin de l'opération.");
    print("--------------------------------------------------");
    await Future.delayed(Duration(seconds: 1));
  }

// action pour afficher les tables
  static Future<void> selectTable() async {
    List<String> listTable = await LaBDFuret.selectTables();
    print("Liste des tables :");
    for (var table in listTable) {
      print("- $table");
    }
    print("Fin de l'opération.");
    print("--------------------------------------------------");
    await Future.delayed(Duration(seconds: 1));
  }

// action pour supprimer une table
  static Future<void> deleteTable() async {
    print("Quelle table voulez vous supprimer ?");
    String table = IHM.saisirStringRec();
    if (IHM.confirmation()) {
      LaBDFuret.dropTable(table);
      print("Table supprimée.");
      print("Fin de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    } else {
      print("Annulation de l'opération.");
      print("--------------------------------------------------");
      await Future.delayed(Duration(seconds: 1));
    }
  }

// action pour supprimer les tables
  static Future<void> deleteAllTables() async {
    if (IHM.confirmation()) {
      LaBDFuret.dropAllTable();
      print("Tables supprimées.");
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
