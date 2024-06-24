import 'package:bridgebank_social_app/data/models/session.dart';

abstract class LocalStorageService {
  Future<void> storeConnectedUser(Session session);
  Session? connectedUser();
  Future<void> clear();
}