import 'package:bridgebank_social_app/app_setup.dart';
import 'package:bridgebank_social_app/configuration/constants.dart';
import 'package:bridgebank_social_app/data/models/session.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class TokenManager{

  static isExpired(){
    print("TokenManager.isExpired()");
    final Session? me = AppSetup.localStorageService.connectedUser();
    final String? token  = me?.authorization?.token;
    if(token != null){
      return JwtDecoder.isExpired(token);
    }
    return true;
  }
  static refresh(){

    print("TokenManager.refresh()");

    final Session? me = AppSetup.localStorageService.connectedUser();
    final String? token  = me?.authorization?.token;
    if(token != null){
      final bool hasExpired = JwtDecoder.isExpired(token);
      if(hasExpired == false){//Token is not expired

        final Duration remainingTime = JwtDecoder.getRemainingTime(token);
        print("JwtDecoder.getRemainingTime =>> $remainingTime");
        if(remainingTime.inMinutes <Constants.TOKEN_REMAINING_REFRESH_DELAY){
          print("We refresh our token");

          AppSetup.backendService.refreshToken(session: me)
          .then((session){
            AppSetup.localStorageService.storeConnectedUser(session).
            whenComplete((){
              print("Token is refreshed");
            });
          });

        }


      }
    }

  }

}