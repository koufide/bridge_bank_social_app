import 'package:bridgebank_social_app/configuration/colors.dart';
import 'package:bridgebank_social_app/data/models/conversation.dart';
import 'package:bridgebank_social_app/data/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:intl/intl.dart' as intl;

class ConversationItemWidget extends StatelessWidget {

  final Conversation conversation;
  const ConversationItemWidget({super.key, required this.conversation});

  @override
  Widget build(BuildContext context) {

    return ListTile(
      leading: Stack(
        children: [
          Container(
            width: 80.0,
            height: 80.0,
            decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle
            ),
          ),
          Positioned.directional(
            textDirection: TextDirection.ltr,
            top: Adaptive.h(2.8),
            start: Adaptive.w(1.8),
            child: Container(
              width: Adaptive.w(4),
              height: Adaptive.h(4),
              decoration: BoxDecoration(
                  color: conversation.isConnected()?
                  AppColors.connectedUserColor:
                  AppColors.unConnectedUserColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Colors.white,
                      width: 5.0
                  )

              ),
            ),
          )
        ],
      ),
      title: Text(conversation.senderName(User())/*TODO Update User*/, style: const TextStyle(
          fontWeight: FontWeight.bold
      ),),
      subtitle: Text(conversation.messageContent()),
      trailing: Column(
        children: [
          Text(conversation.lastMessageDate() == null?"":intl.DateFormat("Hm").format(
              conversation.lastMessageDate()!), style: const TextStyle(
            color: AppColors.conversationDateColor,
            fontSize: 14,
          ),),

          Offstage(
            offstage: conversation.unReadCount() == 0,
            child: Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 2,
                  bottom: 2
              ),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Text("${conversation.unReadCount()}", style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12
              ),),
            ),
          )

        ],
      ),
    );
  }

}
