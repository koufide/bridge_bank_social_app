import 'package:bridgebank_social_app/data/models/conversation.dart';
import 'package:bridgebank_social_app/data/models/message.dart';
import 'package:bridgebank_social_app/data/models/session.dart';

abstract class BackendService {
  Future<Session> signIn({required String email, required String password});

  Future<Session> signUp(
      {required String firstName,
      required String lastName,
      required String email,
      required String password});
// }

  Future<Conversation> openConversation({
    required List<int> speakers,
    bool isGroup = false,
    String groupName = "",
    List<int>? admins,
  });

  Future<Message> sendMessage({
    required String content,
    required String contentType,
    required int senderId,
    required int conversationId,
  });

  Future<List<Conversation>> loadConversationByCustomerId({
    int? customerId
  });

  Future<List<Message>> loadMessageByConversationId({
    int? conversationId
  });

  //TODO LOAD
}
