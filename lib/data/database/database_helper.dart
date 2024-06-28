

import 'dart:convert';

import 'package:bridgebank_social_app/configuration/constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  static const String TABLESESSION = "sessions";

  static Database? database;


// Open the database and store the reference.
  static connection() async{
    database = await openDatabase(
      join(
        await getDatabasesPath(),
      Constants.databaseName,
      ),
      onCreate: (db, version) async{
        const String sql='CREATE TABLE $TABLESESSION ("id INTEGER PRIMARY KEY,data TEXT")';
        await db.execute(sql);
      },
      version: Constants.databaseVersion
    );
    return database;
  } // connection


  static insertSession(Map<String, dynamic> data) async {
    await database?.insert(TABLESESSION,
        {
          "data":jsonEncode(data)
        });
  } //insertSession

static Future<List<Map<String, dynamic>>?> selectAllSession() async{
    return await database?.query(TABLESESSION);
} //selectSession

static deleteAllSession() async{
    await database?.rawDelete("DELETE FROM TABLE $TABLESESSION");
    // database?.delete(TABLESESSION);
} // deleteAllSession

} // class