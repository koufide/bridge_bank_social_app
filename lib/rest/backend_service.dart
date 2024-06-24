import 'package:bridgebank_social_app/data/models/conversation.dart';
import 'package:bridgebank_social_app/data/models/message.dart';
import 'package:bridgebank_social_app/data/models/session.dart';

abstract class BackendService{

  Future<Session> signIn({required String email, required String password});

  Future<Session> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password});


  Future<Conversation> openConversation({
        required  List<int> speakers,
        bool isGroup = false,
        String groupName = "",
        List<int>? admins
      });

  Future<Message>  sendMessage({
    required String content,
    required String contentType, //text, audio, image
    required int senderId,
    required int conversationId
  });

  //TODO Load Conversations by Customer ID https://api-socialapp.adjemincloud.com/api/v1/conversations/customers/1

  //TODO Load Messages by Conversation ID https://api-socialapp.adjemincloud.com/api/v1/conversations/messages/2

  //TODO Load Contacts https://api-socialapp.adjemincloud.com/api/v1/contacts/1


}