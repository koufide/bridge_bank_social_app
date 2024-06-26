import 'dart:async';
import 'dart:io';

import 'package:bridgebank_social_app/app_setup.dart';
import 'package:bridgebank_social_app/data/models/conversation.dart';
import 'package:bridgebank_social_app/rest/exception/auth/auth_exception.dart';
import 'package:bridgebank_social_app/ui/widgets/conversation_item_widget.dart';
import 'package:bridgebank_social_app/ui/widgets/progress_ui.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MessagesPage extends StatefulWidget {

  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {

  List<Conversation> _conversations = [];


  @override
  void initState() {
    ProgressUtils.init();
    super.initState();

    _loadData();
  }

  @override
  Widget build(BuildContext context) {


    return ProgressUtils.isLoading? ProgressUi():ListView(
      children: _conversations.map<Widget>((conversation)=>
          ConversationItemWidget(
          conversation: conversation)).toList()
    );
  }

  void _loadData() {

  //Show Loading()
   ProgressUtils.showProgress((){
     if(mounted){
       setState(() {

       });
     }
   }) ;

  //Load Conversations
   AppSetup.backendService.loadMyConversations(meId:
   AppSetup.localStorageService.connectedUser()?.user?.id
   ).then((List<Conversation> value){

     _conversations = value;

     //Hide Loading ()
     ProgressUtils.hideProgress((){
       if(mounted){
         setState(() {

         });
       }
     }) ;

   })
   .catchError((error){

     //Hide Loading ()

     ProgressUtils.hideProgress((){
       if(mounted){
         setState(() {

         });
       }
     }) ;

     print("MessagesPage.loadData() Error $error");

     if(error is AuthException){

       AppSetup.logout(context: context, onStartLoading: (){

       }, onCompleteLoading: (){

       });

     }else if(error is SocketException || error is ClientException){
       AppSetup.toastLong("S'il vous plâit, veuillez vérifier votre connexion internet");
     }else if(error is ArgumentError){

     }else if(error is Exception){

     }else{
       AppSetup.toastLong(error.message);
     }
   });



  // setState((){
    //
    // _conversations = [];
    // });

  }
}
