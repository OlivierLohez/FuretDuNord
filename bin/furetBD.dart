import 'package:mysql1/mysql1.dart';

class LaBDFuret {
  // Attribut
  String _host = 'localhost';
  int _port = 3306;
  String _user = 'dartFuret';
  String _password = 'btsinfo';
  String _db = 'dbFuret';

  // Constructeur
  LaBDFuret();

  // Méthodes
  ConnectionSettings settingsLaBD() {
    ConnectionSettings settings = new ConnectionSettings(
      host: this._host,
      port: this._port,
      user: this._user,
      password: this._password,
      db: this._db,
    );
    return settings;
  }
}
