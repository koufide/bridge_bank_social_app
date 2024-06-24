import 'package:bridgebank_social_app/configuration/colors.dart';
import 'package:bridgebank_social_app/data/models/conversation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:intl/intl.dart' as intl;

class ConversationItemWidget extends StatelessWidget {

  final Conversation conversation;
  const ConversationItemWidget({super.key, required this.conversation});

  @override
  Widget build(BuildContext context) {
   /* return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      padding: EdgeInsets.only(left: Constants.defaultPadding),
      child: Row(
        children: [
          Container(
            width: Adaptive.w(22),
            height: Adaptive.h(10),
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [

                Container(
                 width: Adaptive.w(20),
                  height: Adaptive.h(10),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle
                  ),
                ),

                Positioned.directional(
                  textDirection: TextDirection.ltr,
                  bottom: Adaptive.h(0.08),
                  start: Adaptive.w(0.8),
                  child: Container(
                    width: Adaptive.w(5),
                    height: Adaptive.h(5),
                    decoration: BoxDecoration(
                        color: AppColors.connectedUserColor,
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

          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  Text("Etham Walker", style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
                  Text("Hey when are you going eeee,, ,e,eekeke"
                      "mememememmeme?", maxLines: 2,)

                ],
              ),
            ),
          ),
          
          Container(
            width: Adaptive.w(22),
            height: Adaptive.h(22),
            margin: EdgeInsets.only(top: 16),
            child: Column(
              children: [
                Text("9:45AM", style: TextStyle(
                  color: AppColors.conversationDateColor
                ),),

                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 2,
                      bottom: 2
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.conversationUnReadCountColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text("14", style: TextStyle(
                    color: AppColors.conversationUnReadCountTextColor
                  ),),
                )
              ],
            ),
          )
        ],
      ),
    );*/

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
              // decoration: BoxDecoration(
              //     color: conversation.isConnected?
              //     AppColors.connectedUserColor:
              //     AppColors.unConnectedUserColor,
              //     shape: BoxShape.circle,
              //     border: Border.all(
              //         color: Colors.white,
              //         width: 5.0
              //     )
              //
              // ),
            ),
          )
        ],
      ),
      // title: Text(conversation.senderName??'Unknown name', style: const TextStyle(
      //     fontWeight: FontWeight.bold
      // ),
      // ),
      // subtitle: Text(conversation.messageContent??'Unavailable message'),
      trailing: Column(
        children: [
          // Text(conversation.lastMessageDate == null?"":intl.DateFormat("Hm").format(
          //     conversation.lastMessageDate!), style: const TextStyle(
          //   color: AppColors.conversationDateColor,
          //   fontSize: 14,
          // ),),

          Offstage(
            offstage: conversation.unReadCount == 0,
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
              child: Text("${conversation.unReadCount}", style: const TextStyle(
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
