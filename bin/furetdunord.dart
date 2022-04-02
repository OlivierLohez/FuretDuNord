import 'package:mysql1/mysql1.dart';

import 'ihm.dart';

void main(List<String> args) async {
  ConnectionSettings settings = IHM.setting();
  bool connectionPossible = await IHM.testConnection(settings);
  if (connectionPossible) {
    await IHM.boucleSaisie(settings);
  }
}
