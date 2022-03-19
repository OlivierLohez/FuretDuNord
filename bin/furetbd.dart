import 'package:mysql1/mysql1.dart';

class LaBDFuret {
  // Attribut
  static final String _host = 'localhost';
  static final int _port = 3306;
  static final String _user = 'dartFuret';
  static final String _password = 'btsinfo';
  static final String _db = 'dbFuret';

  // Constructeur
  //LaBDFuret();

  // Méthodes
  // On fait une méthode statique qui donne tous les paramètres nécessaires à la connexion sur la base de donnée
  static ConnectionSettings settingsLaBD() {
    ConnectionSettings settings = new ConnectionSettings(
      host: _host,
      port: _port,
      user: _user,
      password: _password,
      db: _db,
    );
    return settings;
  }
}
