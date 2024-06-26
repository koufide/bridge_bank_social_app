import 'dart:convert';

import 'package:bridgebank_social_app/app_setup.dart';
import 'package:bridgebank_social_app/data/models/conversation.dart';
import 'package:bridgebank_social_app/data/models/message.dart';
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

  @override
  Future<Conversation> openConversation(
      {
        required List<int> speakers,
      bool isGroup = false,
      String groupName = "",
      List<int>? admins}) async {
    final Uri url = Uri.parse("$API_URL/open_conversation");

    // final Session session =
    //     await signIn(email: "vincent@adjemin.com", password: "123456789");
    // final String? token = session.authorization?.token;
    //

    final Session? session = AppSetup.me;
    final String? token = session?.authorization?.token;


    print("authorization : Bearer $token");

    final Response response = await post(url,
        body: jsonEncode({
          "speakers": speakers,
          "is_group": isGroup,
          "group_name": groupName,
          "admins": admins ?? []
        }),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        });

    if (response.statusCode == 200) {
      final Map<String, dynamic>? json = jsonDecode(response.body);

      if (json == null) {
        throw Exception(response.body);
      }

      if (json.containsKey("success") &&
          json["success"] == true &&
          json['data'] != null) {
        final Map<String, dynamic> jsonData = json['data'];
        return Conversation.fromJson(jsonData);
      }

      throw Exception(response.body);


    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      if (response.headers['content-type'] == "application/json") {
        final Map<String, dynamic> json = jsonDecode(response.body);

        if (json.containsKey("message") && json['message'] != null) {
          if (json['message'].isEmpty() || json['message'] == "") {
            throw AuthException(json['message']);
          } else {
            throw ArgumentError(json['message']);
          }
        }
      }
      throw Exception(response.body);
    } else {
      throw Exception(response.body);
    }
  } // openConversation

  @override
  Future<Message> sendMessage(
      {
        required String content,
      required String contentType,
      required int senderId,
      required int conversationId}) async {
    // throw UnimplementedError();

    final Uri url = Uri.parse("$API_URL/messages");

    final Session? session = AppSetup.me;

    // final Session session =
    //     await signIn(email: "vincent@adjemin.com", password: "123456789");

    final String? token = session?.authorization?.token;

    print("authorization : Bearer $token");

    final Response response = await post(url,
        body: <String, String>{
          "content": content,
          "content_type": MessageContentType.text.name,
          "sender_id": "$senderId",
          "conversation_id": "$conversationId"
        },
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        });

    if (response.statusCode == 200) {
      final Map<String, dynamic>? json = jsonDecode(response.body);

      if (json == null) {
        throw Exception(response.body);
      }

      if (json.containsKey("success") &&
          json["success"] == true &&
          json['data'] != null) {
        final Map<String, dynamic> jsonData = json['data'];
        return Message.fromJson(jsonData);
      }
      throw Exception(response.body);

    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      if (response.headers['content-type'] == "application/json") {
        final Map<String, dynamic> json = jsonDecode(response.body);

        if (json.containsKey("message") && json['message'] != null) {
          if (json['message'].isEmpty() || json['message'] == "") {
            throw AuthException(json['message']);
          } else {
            throw ArgumentError(json['message']);
          }
        }
      }
      throw Exception(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<List<Conversation>> loadConversationByCustomerId({int? customerId}) async {
    final Session? session = AppSetup.me;
    final String? token = session?.authorization?.token;
    final Uri url = Uri.parse("$API_URL/conversations/customers/$customerId??$session?.user?.id");

    final Response response = await get(url,
     headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
        }
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic>? json = jsonDecode(response.body);

      if (json == null) {
        throw Exception(response.body);
      }

      if (json.containsKey("success") &&
          json["success"] == true &&
          json['data'] != null) {
        final Map<String, dynamic> jsonData = json['data'];
        return Message.fromJson(jsonData);
      }
      throw Exception(response.body);

    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      if (response.headers['content-type'] == "application/json") {
        final Map<String, dynamic> json = jsonDecode(response.body);

        if (json.containsKey("message") && json['message'] != null) {
          if (json['message'].isEmpty() || json['message'] == "") {
            throw AuthException(json['message']);
          } else {
            throw ArgumentError(json['message']);
          }
        }
      }
      throw Exception(response.body);
    } else {
      throw Exception(response.body);
    }


  }

  @override
  Future<List<Message>> loadMessageByConversationId({int? conversationId}) {
    // TODO: implement loadMessageByConversationId
    throw UnimplementedError();
  }


}
