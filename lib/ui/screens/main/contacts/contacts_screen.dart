import 'dart:io';

import 'package:bridgebank_social_app/app_setup.dart';
import 'package:bridgebank_social_app/data/models/conversation.dart';
import 'package:bridgebank_social_app/data/models/user.dart';
import 'package:bridgebank_social_app/rest/exception/auth/auth_exception.dart';
import 'package:bridgebank_social_app/ui/screens/main/conversation/conversation_screen.dart';
import 'package:bridgebank_social_app/ui/widgets/progress_ui.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ContactsScreen extends StatefulWidget {

  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();

}

class _ContactsScreenState extends State<ContactsScreen> {


  List<User> _contacts = [];


  @override
  void initState() {
    ProgressUtils.init();
    super.initState();

    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      body: ProgressUtils.isLoading? const ProgressUi():
      ListView(
          children: _contacts.map<Widget>((contact)=>
              _buildContactItemUi(contact)).toList()
      )
    );
  }

  void _loadData() {
    //Show Loading()
    ProgressUtils.showProgress(() {
      if (mounted) {
        setState(() {

        });
      }
    });

    //Load Contacts
    AppSetup.backendService.loadContacts(meId:
    AppSetup.localStorageService
        .connectedUser()
        ?.user
        ?.id
    ).then((List<User> value) {
      _contacts = value;
      //Hide Loading ()
      ProgressUtils.hideProgress(() {
        if (mounted) {
          setState(() {

          });
        }
      });
    })
        .catchError((error) {
      //Hide Loading ()

      ProgressUtils.hideProgress(() {
        if (mounted) {
          setState(() {

          });
        }
      });

      print("MessagesPage.loadData() Error $error");

      if (error is AuthException) {
        AppSetup.logout(context: context, onStartLoading: () {

        }, onCompleteLoading: () {

        });
      } else if (error is SocketException || error is ClientException) {
        AppSetup.toastLong(
            "S'il vous plâit, veuillez vérifier votre connexion internet");
      } else if (error is ArgumentError) {

      } else if (error is Exception) {

      } else {
        AppSetup.toastLong(error.message);
      }
    });
  }

  Widget _buildContactItemUi(User contact) {
    return ListTile(
      onTap: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ConversationScreen(
            conversation: Conversation(
                admins: [],
                speakers: [
                  AppSetup.localStorageService.connectedUser()!.user!.id!,
                  contact.id!
                ],
              messages: [],
              speakerList: [],
              users: [
                AppSetup.localStorageService.connectedUser()!.user!,
                contact
              ]
            )
        )));
      },
      leading: Container(
        width: 80.0,
        height: 80.0,
        decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle
        ),
        child: const Icon(Icons.person, color: Colors.white,),
      ),
      title: Text("${contact.firstName} ${contact.lastName}"),
      subtitle: Text("${contact.email}"),
    );
  }
}
