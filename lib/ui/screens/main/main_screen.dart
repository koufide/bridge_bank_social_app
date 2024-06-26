import 'dart:ui';

import 'package:bridgebank_social_app/app_setup.dart';
import 'package:bridgebank_social_app/configuration/colors.dart';
import 'package:bridgebank_social_app/ui/screens/main/pages/groups_page.dart';
import 'package:bridgebank_social_app/ui/screens/main/pages/messages_page.dart';
import 'package:bridgebank_social_app/ui/widgets/custom_button.dart';
import 'package:bridgebank_social_app/ui/widgets/dialogs.dart';
import 'package:bridgebank_social_app/ui/widgets/progress_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class MainScreen extends StatefulWidget {
  final String title;
  const MainScreen({super.key, required this.title});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  bool _isLoading = false;


  void _showProgress(){
    _isLoading = true;
    if(mounted){
      setState(() {

      });
    }
  }

  void _hideProgress(){
    _isLoading = false;
    if(mounted){
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return _isLoading?const Scaffold(
      body: ProgressUi(),
    ):DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primary,
              centerTitle: true,
              title: Text(widget.title, style: const TextStyle(
                  color: AppColors.appBarTitleColor,
                  fontWeight: FontWeight.bold
              ),),
              actions: [

                IconButton(
                    onPressed: (){

                      //Show Disclaimer and Take confirmation

                     Dialogs.showConfirmDialog(
                         context: context,
                         message: "Êtes-vous sûr de vouloir vous déconnecter?",
                         onCancel: (){
                           print("onCancel()");

                         },
                         onConfirm: (){
                           print("onConfirm()");
                           AppSetup.logout(context:context, onStartLoading:_showProgress, onCompleteLoading:_hideProgress);

                         });

                      },
                    icon: const Icon(Icons.logout, color: Colors.white,)
                )

              ],
              bottom: const TabBar(
                labelColor: Colors.white,
                tabs: [
                  Tab(
                    text: "Message",
                  ),
                  Tab(
                    text: "Group",
                  )
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                MessagesPage(),
                GroupsPage(),
              ],
            )
        )
    );
  }
}
