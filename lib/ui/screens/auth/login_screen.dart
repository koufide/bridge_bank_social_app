import 'package:bridgebank_social_app/configuration/constants.dart';
import 'package:bridgebank_social_app/ui/widgets/customer_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:bridgebank_social_app/configuration/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _focusNode= FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text(""),       ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             SizedBox(
               //height: 2.h,
               height: Adaptive.h(7),
            ),
            _buildLogoUi(),
            //todo TITRE

            Center(
              child: Text(
                "Connexion",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),

            Center(
              child: Text(
                "Connectez vous maintenant",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge,
              ),
            ),

            SizedBox(height: 2.h,),
            DefaultTextField(
              textController: _emailController,
              placeholder: "Email",
              prefixIcon: Icons.email,
              obscureText: false,
            ),
            SizedBox(height: 2.h,),
            DefaultTextField(textController: _passwordController,
              placeholder: "Password",
              prefixIcon: Icons.lock,
              obscureText: true,
            ),


            //todo MOT DE PASSE
            //todo BOUTON CONNEXION
            //todo BOUTON OU LIEN INSCRIPTION
            //todo LIEN MOT DE PASSE OUBLIE
          ],
        ),
      ),
    );
  }

  Widget _buildLogoUi() {
    return Center(
      child: Image.asset(
        "${Constants.imagesDirectory}/bank_logo.png",
        width: Adaptive.w(100),
      ),
    );
  }
}
