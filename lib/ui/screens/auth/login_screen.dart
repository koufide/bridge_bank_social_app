import 'package:bridgebank_social_app/configuration/constants.dart';
import 'package:bridgebank_social_app/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:bridgebank_social_app/configuration/colors.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 8.h,),
            //Display Logo
            _buildLogoUi(),
            SizedBox(height: 4.h,),
            Center(
              child: Text("Connexion", style: Theme.of(context).textTheme
                .headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
              ),),
            ),
            Center(
              child: Text("Connectez vous maintenant !", style: Theme.of(context).textTheme
                  .titleLarge,),
            ),
            //Email
            SizedBox(height: 4.h,),
            //Email
            DefaultTextField(
              textController: _emailController,
              inputType:  TextInputType.emailAddress,
              placeholder: "Email",
              prefixIcon: Icons.email,
            ),
            SizedBox(height: 2.h,),
            //Password
            DefaultTextField(
              textController: _passwordController,
              inputType:  TextInputType.text,
              placeholder: "Mot de passe",
              prefixIcon: Icons.lock,
            ),
            //TODO Chalp de soisi Mot de passe
            //TODO Lien Mot de passe Oublié?
            //TODO Bouton Connexion
            //TODO Bouton Inscription
          ],
        ),
      ),
    );
  }

  Widget _buildLogoUi(){
    return Center(
      child: Image.asset("${Constants.imagesDirectory}/bank_logo.png",
      width: 60.w,
      ),
    );
  }
}
