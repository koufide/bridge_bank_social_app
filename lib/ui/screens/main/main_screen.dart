
import 'package:bridgebank_social_app/configuration/colors.dart';
import 'package:bridgebank_social_app/ui/screens/main/pages/groups_page.dart';
import 'package:bridgebank_social_app/ui/screens/main/pages/messages_page.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final String title;
  const MainScreen({super.key, required this.title});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primary,
              centerTitle: true,
              title: Text(widget.title, style: const TextStyle(
                  color: AppColors.appBarTitleColor,
                  fontWeight: FontWeight.bold
              ),),
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
