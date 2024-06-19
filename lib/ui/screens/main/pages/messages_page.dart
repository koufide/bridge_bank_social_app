import 'package:bridgebank_social_app/data/models/conversation.dart';
import 'package:bridgebank_social_app/ui/widgets/conversation_item_widget.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {

  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ConversationItemWidget(
          conversation: Conversation(
              senderName: "Innocent N'guessan",
              messageContent: "Hello, Comment ça va?",
              isConnected: true,
              unReadCount: 5,
              lastMessageDate: DateTime.now().subtract(const Duration(
                  hours: 2
              ))
          ),
        ),
        ConversationItemWidget(
          conversation: Conversation(
              senderName: "Rokiatou Ouattara",
              messageContent: "Hello, Comment ça va?",
              isConnected: false,
              unReadCount: 0,
              lastMessageDate: DateTime.now().subtract(const Duration(
                  hours: 3
              ))
          ),
        ),
      ],
    );
  }
}
