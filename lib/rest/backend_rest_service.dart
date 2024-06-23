import 'dart:convert';

import 'package:bridgebank_social_app/data/models/session.dart';
import 'package:bridgebank_social_app/rest/backend_service.dart';
import 'package:bridgebank_social_app/rest/exception/auth/auth_exception.dart';
import 'package:http/http.dart';

class BackendRestService extends BackendService {
  static const String BASE_URL = "https://api-socialapp.adjemincloud.com";
  static const String API_URL = "$BASE_URL/api/v1";

  @override
  Future<Session> signIn(
      {required String email, required String password}) async {
    final Uri url = Uri.parse("$API_URL/user_auth");
    final Response response = await post(url,
        body: <String, String>{"email": email, "password": password});

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);

      if (json.containsKey('success') &&
          json['success'] == true &&
          json.containsKey("data") &&
          json['data'] != null) {
        final Map<String, dynamic> jsonData = json['data'];
        return Session.fromJson(jsonData);
      }
      throw Exception(response.body);
    } else if (response.statusCode == 401 &&
        response.headers['content-type'] == "application/json") {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final String message =
          json.containsKey("message") ? json['message'] : "Unauthoried";
      throw AuthException(message);
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<Session> signUp(
      {required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    final Uri url = Uri.parse("$API_URL/user_register");

    final Response response = await post(url, body: <String, String>{
      "email": email,
      "password": password,
      "first_name": firstName,
      "last_name": lastName
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map<String, dynamic> json = jsonDecode(response.body);

      if (json.containsKey('success') &&
          json['success'] == true &&
          json.containsKey("data") &&
          json['data'] != null) {
        final Map<String, dynamic> jsonData = json['data'];
        return Session.fromJson(jsonData);
      }
      throw Exception(response.body);
    } else if (response.statusCode == 401 &&
        response.headers['content-type'] == "application/json") {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final String message =
          json.containsKey("message") ? json['message'] : "Unauthoried";
      throw AuthException(message);
    } else if (response.statusCode == 400) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final String message =
          json.containsKey("message") ? json['message'] : "Bad request";
      throw ArgumentError(message);
    } else {
      throw Exception(response.body);
    }
  }
}
