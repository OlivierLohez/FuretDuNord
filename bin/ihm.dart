import 'dart:io';

class IHM {
  // Méthodes
  // Saisie des entiers de manière récurssive
  static int saisirIntRec() {
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
}
