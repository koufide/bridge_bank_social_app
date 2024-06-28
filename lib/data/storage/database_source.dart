
import 'dart:convert';

import 'package:bridgebank_social_app/data/database/database_helper.dart';
import 'package:bridgebank_social_app/data/models/session.dart';
import 'package:bridgebank_social_app/data/storage/local_storage_service.dart';

class DatabaseSource extends LocalStorageService{

  static List<Map<String, dynamic>>? _list = [];
  static  DatabaseSource? _instance;
  DatabaseSource._();

  Future<DatabaseSource> getInstance () async{
    _list =  await DatabaseHelper.selectAllSession();
    if(_instance == null){
      _instance = DatabaseSource._();
    }
    return _instance!;
  }


  @override
  Future<void> clear() async {
    await DatabaseHelper.deleteAllSession();
    // throw UnimplementedError();
  }

  @override
  Session? connectedUser() {
    // TODO: implement connectedUser
    throw UnimplementedError();
  }

  @override
  Future<void> storeConnectedUser(Session session) async {

    await DatabaseHelper.deleteAllSession();


    // throw UnimplementedError();
    await DatabaseHelper.insertSession(
      session.toJson(),
    );

    refreshList();
  }

  @override
  Session? getConnectedUser() {
    // _list =  await DatabaseHelper.selectAllSession();
    if(_list == null){
      return null;
    }

    if(_list!.isEmpty){
      return null;
    }
    Map<String, dynamic> row = _list!.first;
    // if(row.containsKey("data")){
      String data = row["data"];
      Map<String, dynamic> json = jsonDecode(data);
      return Session.fromJson(json);
    // }

  } // getConnectedUser


static void refreshList() async{
  _list =  await DatabaseHelper.selectAllSession();
} //refreshList



}