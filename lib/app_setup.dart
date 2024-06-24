import 'package:bridgebank_social_app/data/models/session.dart';
import 'package:bridgebank_social_app/data/storage/local_storage_service.dart';
import 'package:bridgebank_social_app/data/storage/shared_prefs.dart';
import 'package:bridgebank_social_app/rest/backend_rest_service.dart';
import 'package:bridgebank_social_app/rest/backend_service.dart';
import 'package:bridgebank_social_app/ui/screens/auth/login_screen.dart';
import 'package:bridgebank_social_app/ui/screens/main/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSetup{
  static late BackendService backendService;
  static late LocalStorageService localStorageService;

  static Session? me;

  static init() async{
    backendService = BackendRestService();



    final SharedPreferences preferences =  await SharedPreferences.getInstance();

    localStorageService = SharedPrefs(preferences);

    me = localStorageService.connectedUser();

    print("AppSetup init()");
    print("App Setup init() ");
    print("App Setup init() Session $me");

  }

static Widget start(){
  if(me == null){
    return const LoginScreen();
  }else{
    return const MainScreen(title: "Bridge B Social");
  }
}

}