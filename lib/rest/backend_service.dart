import 'package:bridgebank_social_app/data/models/session.dart';

abstract class BackendService {
  Future<Session> signIn({required String email, required String password});
  Future<Session> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });
}
