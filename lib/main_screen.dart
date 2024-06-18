import 'dart:ui';

import 'package:bridgebank_social_app/colors.dart';
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text(widget.title, style: const TextStyle(
          color: AppColors.appBarTitleColor,
          fontWeight: FontWeight.bold
        ),),
      ),
      body: Column(
        children: [

          ListTile(
            leading: Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                  color: Colors.black,
                shape: BoxShape.circle
              ),
            ),
            title: Text("Etham Walker", style: TextStyle(
              fontWeight: FontWeight.bold
            ),),
            subtitle: Text("Hey when are you going?"),
            trailing: Column(
              children: [
                Text("9:45AM", style: TextStyle(
                  color: Color(0xFF9F9F9F),
                  fontSize: 14,
                ),),

                Container(
                  margin: EdgeInsets.only(top: 8),
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 2,
                    bottom: 2
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text("14", style: TextStyle(
                    color: Colors.white,
                    fontSize: 12
                  ),),
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
