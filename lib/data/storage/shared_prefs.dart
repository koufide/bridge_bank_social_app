import 'dart:convert';

import 'package:bridgebank_social_app/data/models/session.dart';
import 'package:bridgebank_social_app/data/storage/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs extends LocalStorageService{

  static const String PREF_CONNECTED_USER_KEY = "bridgebank_social_app.PREF_CONNECTED_USER_KEY";

  final SharedPreferences _prefs;

  SharedPrefs(this._prefs);

  @override
  Future<void> clear()async {
    await _prefs.clear();
  }

  @override
  Session? connectedUser() {
   final String? jsonString =  _prefs.getString(PREF_CONNECTED_USER_KEY);
   if(jsonString == null){
     return null;
   }
   final Map<String, dynamic> jsonSession = jsonDecode(jsonString);
   return Session.fromJson(jsonSession);

  }

  @override
  Future<void> storeConnectedUser(Session session)async {
      await _prefs.setString(PREF_CONNECTED_USER_KEY, jsonEncode(session.toJson()));
  }

  @override
  Session? getConnectedUser() {
    final String? jsonString =  _prefs.getString(PREF_CONNECTED_USER_KEY);
    if(jsonString == null){
      return null;
    }
    final Map<String, dynamic> jsonSession = jsonDecode(jsonString);
    return Session.fromJson(jsonSession);
  }

}