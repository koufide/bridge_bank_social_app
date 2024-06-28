import 'package:bridgebank_social_app/data/models/session.dart';

abstract class LocalStorageService{

  Future<void> storeConnectedUser(Session session);

  Session? connectedUser();
  Session? getConnectedUser();



  Future<void> clear();


}