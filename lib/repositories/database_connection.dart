import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DataBaseConnection {
  setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_todolist_sqflite');
    var database =
        await openDatabase(path, version: 1, onCreate: _onCreateDataBase);

    return database;
  }

  _onCreateDataBase(Database database, int version) async {
    await database.execute(
        "CREATE TABLE PRODUCT(id TEXT PRIMARY KEY, NAME TEXT, IMAGE TEXT, PRICE TEXT)");
  }
}
