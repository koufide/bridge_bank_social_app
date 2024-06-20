import 'package:bridgebank_social_app/ui/screens/auth/connexion.dart';
import 'package:flutter/material.dart';



class MyLogin extends StatelessWidget {
  const MyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                
              ),
            ),
          ),
        ),
        
      ],
    );
  }
}