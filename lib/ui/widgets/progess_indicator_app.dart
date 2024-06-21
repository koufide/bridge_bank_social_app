// import 'package:bridgebank_social_app/configuration/colors.dart';
// import 'package:bridgebank_social_app/configuration/colors.dart';
import 'package:flutter/material.dart';

class MyProgessIndicatorApp extends StatefulWidget {
  const MyProgessIndicatorApp({super.key});

  @override
  State<MyProgessIndicatorApp> createState() => _MyProgessIndicatorAppState();
} //ProgessIndicatorApp

class _MyProgessIndicatorAppState extends State<MyProgessIndicatorApp>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // const Text("Circulation progress indicatorrr",
            // style: TextStyle(color: AppColors.secondary,
            // ),
            //  ),
            CircularProgressIndicator(
              value: controller.value,
              semanticsLabel: "Chargement",
            )
          ],
        ),
      ),
    );
  }
}//_MyProgessIndicatorAppState