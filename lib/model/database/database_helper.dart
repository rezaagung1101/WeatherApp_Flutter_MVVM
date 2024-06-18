import 'package:openweather_mvvm/model/data/weather.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database; //instance making

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'weather_database.db');
    return openDatabase(path, version: 1, onCreate: (db, version) {
      return db.execute(
        '''
          CREATE TABLE weather(
            city TEXT PRIMARY KEY, 
            updatedAt TEXT, 
            description TEXT, 
            temperature TEXT, 
            minTemperature TEXT, 
            maxTemperature TEXT, 
            sunrise TEXT, 
            sunset TEXT, 
            windSpeed TEXT, 
            pressure TEXT, 
            humidity TEXT
          )
          ''',
      );
    });
  }

  Future<void> insertWeather(Weather weather) async {
    final db = await database;
    await db.insert(
        'weather',
        weather.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<Weather?> getWeather(String city) async {
    final db = await database;
    final maps = await db.query(
        'weather',
        where: 'city = ?',
        whereArgs: [city],
    );
    if(maps.isNotEmpty){
      return Weather.fromMap(maps.first);
    }
    return null;
  }

}
