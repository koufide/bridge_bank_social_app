

import 'dart:convert';

import 'package:bridgebank_social_app/data/models/session.dart';
import 'package:http/http.dart';

import 'backend_service.dart';

class BackendImplService extends BackendService{
  static const String BASE_URL ="https://api-socialapp.adjemincloud.com";
  static const String API_URL ="$BASE_URL/api/v1";
  static const String API_OPE_REGISTER ="/user_register";


  @override
  Future<Session> signIn({required String email, required String password}) async {
    final Uri url = Uri.parse("$API_URL/user_auth");

    final form = <String, String>{
      "email": email,
      "password": password
    };

    //throw UnimplementedError();


    final Response response = await post(url,body: form);

    if(response.statusCode == 200){
      final Map json = jsonDecode(response.body);

      if(json.containsKey("success") && json['success'] == true  &&
          json.containsKey("data") && json['data'] != null ){

        final Map<String, dynamic> jsonData = json['data'];

        return  Session.fromJson(jsonData);
      }
      throw Exception(Session);
    }else{
      throw Exception(response.body);
      //throw Exception(response.body);
    }


  }

  @override
  Future<Session> signUp({required String firstName, required String lastName, required String email, required String password}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }


}