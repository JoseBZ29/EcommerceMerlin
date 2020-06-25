
import 'package:sqflite/sqflite.dart';
import 'package:project_ecommerce/repositories/database_connection.dart';

class Repository{

  DataBaseConnection _databaseconnection;

  Repository(){
    _databaseconnection = DataBaseConnection();
  }

  static Database _dataBase;

  Future<Database> get database async {
    print("Se pinches prendio la databeis");
    if(_dataBase!=null) return _dataBase;
    _dataBase=await _databaseconnection.setDatabase();
    return _dataBase;
  }

  insertData(table, data) async {
    print('-----------------------------------entro al pinche inserData----------------------------');
    var connection = await database;
    return await connection.insert(table, data);
  }

  readData(table) async {
    var connection = await database;
    return await connection.query(table);
  }
}