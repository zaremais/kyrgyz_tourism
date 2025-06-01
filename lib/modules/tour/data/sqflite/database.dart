import 'package:sqflite/sqflite.dart';
import 'schema.dart';

class FavoriteToursDatabase {
  static final FavoriteToursDatabase instance =
      FavoriteToursDatabase._internal();

  static Database? _database;

  FavoriteToursDatabase._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();

    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = "$databasePath/favorite_tours_db.db";
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    return await db.execute(''' 
  CREATE TABLE ${FavoriteToursFields.tableName}( 
  ${FavoriteToursFields.tourId} ${FavoriteToursFields.idType}
    )
    ''');
  }
}
