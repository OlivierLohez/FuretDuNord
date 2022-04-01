import 'package:mysql1/mysql1.dart';

import 'ihm.dart';

void main(List<String> args) async {
  ConnectionSettings settings = IHM.setting();
  await IHM.boucleSaisie(settings);
}
