import 'package:bridgebank_social_app/data/models/conversation.dart';
import 'package:bridgebank_social_app/data/models/message.dart';
import 'package:bridgebank_social_app/data/models/session.dart';
import 'package:bridgebank_social_app/data/models/user.dart';
import 'package:bridgebank_social_app/rest/backend_rest_service.dart';
import 'package:bridgebank_social_app/rest/exception/auth/auth_exception.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  test("Check login successful", ()async{

    final res = await BackendRestService()
        .signIn(email: "angebagui@adjemin.com",
        password: "123456789");

    print("Body Response => $res");

    expect(res is Session, true);

  });

  test("Check register successful", ()async{

    final res = await BackendRestService()
        .signUp(
        firstName: "Ange",
        lastName: "Bagui",
        email: "${DateTime.now().microsecond}@adjemin.com",
        password: "123456789");

    print("Body Response => $res");

    expect(res is Session, true);

  });

  test("Check openConversation", ()async{

    final res = await BackendRestService()
        .openConversation(speakers: [14,2]);

    print("Body Response => $res");

    expect(res is Conversation, true);

  });

  test("Check openConversation with bad token", ()async{

    try{
      final res = await BackendRestService()
          .openConversation(speakers: [14,2]);

      print("Body Response => $res");

    }catch(error){

      print("Error $error");

      expect(error is AuthException , true);
    }

  });

  test("Check sendMessage successfully", ()async{

    print("MessageContentType.text => ${MessageContentType.text.name}");
    final res = await BackendRestService()
        .sendMessage(
        content: "Hello, Comment ça va ?",
        contentType: MessageContentType.text.name,
        senderId: 2,
        conversationId: 4);

    print("Body Response => $res");

    expect(res is Message, true);

  });

  test("Check loadMyConversations successfully", ()async{

    final session = await BackendRestService()
        .signIn(email: "angebagui@adjemin.com",
        password: "123456789");

    final res = await BackendRestService()
        .loadMyConversations(meId: session.user?.id);

    print("Body Response => $res");

    expect(res is List<Conversation>, true);

  });

  test("Check loadMessagesByConversationID successfully", ()async{

    final res = await BackendRestService()
        .loadMessagesByConversationID(
        conversationId: 2);

    print("Body Response => $res");

    expect(res is List<Message>, true);

  });

  test("Check loadContacts successfully", ()async{

    final res = await BackendRestService()
        .loadContacts();

    print("Body Response => $res");

    expect(res is List<User>, true);

  });

  test('Check successful refresh_token', () async {
    final Session ses = await BackendRestService().signIn(email: "rouattara150@gmail.com", password: "1234");
    final res = await BackendRestService().refreshToken(session: ses);

    print("Backend Test ===> : $res");

    expect(res is Session, true);
  });

  test('Check successful logout', () async {
    final Session ses = await BackendRestService().signIn(email: "rouattara150@gmail.com", password: "1234");
    final res = await BackendRestService().signOut(session: ses);

    print("Backend Test ===>: $res");

    expect(res, true);
  });

  test('Check unsuccessful logout', () async {
    final Session ses = Session.fromJson({
      "user": {
        "id": 2,
        "first_name": "Test",
        "last_name": "Test",
        "email": "angebagui@adjemin.com",
        "password": "UF.uGDM2dw1E4M7QHKV4uiQEzKHVQZmJ7LC",
        "photo": null,
        "created_at": "2023-12-02T00:02:33.000000Z",
        "updated_at": "2023-12-02T00:02:33.000000Z",
        "deleted_at": null
      },
      "authorization": {
        "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FwaS1zb2NpYWxhcHAuYWRqZW1pbmNsb3VkLmNvbS9hcGkvdjEvdXNlcl9hdXRoIiwiaWF0IjoxNzE5NDAwOTg5LCJleHAiOjE3MTk0MDEwNDksIm5iZiI6MTcxOTQwMDk4OSwianRpIjoiNG14MlA0UFJEajhMVnNaVSIsInN1YiI6IjIiLCJwcnYiOiIxZDBhMDIwYWNmNWM0YjZjNDk3OTg5ZGYxYWJmMGZiZDRlOGM4ZDYzIn0.et936G5ZEnA2OgEWy9pTouW8X9F1zLGAtZ40jif4lCk",
        "type": "bearer"
      }
    });

    try {
      final res = await BackendRestService().signOut(session: ses);
      print("Backend Test ===> Load Contacts : $res");
    }
    catch (e) {
      print(e);
      expect(e is AuthException, true);
    }

  });

}