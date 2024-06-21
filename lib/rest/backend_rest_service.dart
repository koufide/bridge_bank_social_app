import 'dart:convert';

import 'package:bridgebank_social_app/data/models/session.dart';
import 'package:bridgebank_social_app/rest/backend_service.dart';
import 'package:http/http.dart';

class BackendRestService extends BackendService{

  static final String BASE_URL = "https://api-socialapp.adjemincloud.com";
  static final String API_URL = "$BASE_URL/api/v1";

  @override
  Future<Session> signIn({
    required String email,
    required String password})async {

    final Uri url = Uri.parse("$API_URL/user_auth");
    final Response response = await post(url,
        body:<String, String>{
          "email":email,
          "password":password
        }
    );

    if(response.statusCode == 200){

      final Map json = jsonDecode(response.body);
      if(json.containsKey('success') && json['success'] == true
      && json.containsKey("data") && json['data'] != null
      ){
        final Map<String, dynamic> jsonData = json['data'];
        return Session.fromJson(jsonData);
      }
      throw Exception(response.body);

    }else{

      throw Exception(response.body);
    }


  }

  @override
  Future<String> signUp({required String firstName, required String lastName, required String email, required String password}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

}