import 'package:bridgebank_social_app/data/models/conversation.dart';
// import 'package:bridgebank_social_app/data/models/message.dart';
// import 'package:bridgebank_social_app/data/models/session.dart';
import 'package:bridgebank_social_app/rest/backend_rest_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // test("Check login successful", ()async{
  //
  //   final res = await BackendRestService()
  //       .signIn(email: "koufide@adjemin.com",
  //       password: "123456789");
  //
  //   print("Body Response => $res");
  //
  //   expect(res is Session, true);
  //
  // });

  // test("Check register successful", ()async{
  //
  //   final res = await BackendRestService()
  //       .signUp(
  //       firstName: "Ange",
  //       lastName: "Bagui",
  //       email: "${DateTime.now().microsecond}@adjemin.com",
  //       password: "123456789");
  //
  //   print("Body Response => $res");
  //
  //   expect(res is Session, true);
  //
  // });

  // test("Check sendMessage successfull", () async {
  //   // final res = await BackendRestService().sendMessage(
  //   //   content: "Hello FIK",
  //   //   contentType: MessageContentType.text.name,
  //   //   senderId: 2,
  //   //   conversationId: 4,
  //   // );
  //
  //   final res = await BackendRestService().sendMessage(
  //       content: "content",
  //       contentType: MessageContentType.text.name,
  //       senderId: 2,
  //       conversationId: 4
  //   );
  //
  //   print("Body Response => $res");
  //
  //   expect(res is Message, true);
  // });

  test("Check conversation successfull", () async {

    final res = await BackendRestService().openConversation(
        speakers: [14,2]
    );

    print("Body Response => $res");

    expect(res is Conversation, true);
  });

}
