import 'dart:io';

import 'package:bridgebank_social_app/app_setup.dart';
import 'package:bridgebank_social_app/configuration/constants.dart';
import 'package:bridgebank_social_app/data/models/session.dart';
import 'package:bridgebank_social_app/main.dart';
import 'package:bridgebank_social_app/rest/exception/auth/auth_exception.dart';
import 'package:bridgebank_social_app/ui/screens/auth/register_screen.dart';
import 'package:bridgebank_social_app/ui/widgets/custom_button.dart';
import 'package:bridgebank_social_app/ui/widgets/custom_text_field.dart';
import 'package:bridgebank_social_app/ui/widgets/progress_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:bridgebank_social_app/configuration/colors.dart';
import 'package:bridgebank_social_app/rest/backend_rest_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  void _showProgress() {
    _isLoading = true;
    if (mounted) {
      setState(() {});
    }
  }

  void _hideProgress() {
    _isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    // Nettoyer les contrôleurs lorsqu'ils ne sont plus nécessaires
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    // Récupérer les valeurs des champs de texte
    final String email = _emailController.text;
    final String password = _passwordController.text;

    // Faire quelque chose avec les valeurs, par exemple, les envoyer à un serveur
    print('Email: $email');
    print('Password: $password');

    try {
      final Session res =
          await BackendRestService().signIn(email: email, password: password);
      print("RES ==> " + res.user.toString());

      // Afficher un message de succès et rediriger vers la page d'accueil
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Connexion réussie')),
      );

      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => MyHomePage(title: "Accueil")),
      // );

      // Fluttertoast.showToast(
      //     msg: "This is Center Short Toast",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0
      // );

    } on Exception catch (e) {
      print('RES ==> Failed to login: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Échec de la connexion: $e')),
      );
    }

  }



  void _submitLogin(){
    print("User onTap===>Se connecter");

    if(_emailController.text.isEmpty){

      Fluttertoast.showToast(
          msg: "Email incorrect",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );

      return;
    }
    if(_passwordController.text.isEmpty){

      Fluttertoast.showToast(
          msg: "Password incorrect",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );

      return;
    }

    //show Dialog
    _showProgress();

    final String email = _emailController.text.trim().toString();
    final String password = _passwordController.text.trim().toString();

    AppSetup.backendService.signIn(email: email, password: password)
    .then( (Session value){
      _hideProgress();
      print("Session $value");

    }).catchError((erreur){
      _hideProgress();
      print("LoginScreen._submitLogin() =>> Erreur => $erreur");

      if(erreur is AuthException){
        AppSetup.toastLong(erreur.message);

      }else if(erreur is SocketException || erreur is Client){
        AppSetup.toastLong("Veuillez verifier votre connexion INTERNET");
      }else if(erreur is Exception){
        AppSetup.toastLong("Exception $erreur");
      }else if(erreur is ArgumentError){
        AppSetup.toastLong("ArgumentError $erreur");
      }else{
        AppSetup.toastLong("Inconnu $erreur");
      }


    });



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _isLoading
            ? const ProgressUi()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 8.h,
                    ),
                    //Display Logo
                    _buildLogoUi(),
                    SizedBox(
                      height: 4.h,
                    ),
                    Center(
                      child: Text(
                        "Connexion",
                        style:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Connectez vous maintenant !",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    //Email
                    SizedBox(
                      height: 4.h,
                    ),
                    //Email
                    DefaultTextField(
                      textController: _emailController,
                      inputType: TextInputType.emailAddress,
                      placeholder: "Email",
                      prefixIcon: Icons.email,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    //Password
                    DefaultTextField(
                      textController: _passwordController,
                      inputType: TextInputType.text,
                      placeholder: "Mot de passe",
                      prefixIcon: Icons.lock,
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),

                    //Lien Mot de passe oublié
                    InkWell(
                      onTap: () {
                        print("User onTap===>");
                      },
                      child: const Text(
                        "Mot de passe oublié?",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),

                    SizedBox(
                      height: 2.h,
                    ),
                    //Bouton Connexion
                    CustomButton(
                        title: "Se connecter",
                        // onPressed: (){
                        // },
                        onTap: () {
                          // print("User onTap===>Se connecter");
                          //
                          // if(_emailController.text.isEmpty){
                          //
                          //   Fluttertoast.showToast(
                          //       msg: "Email incorrect",
                          //       toastLength: Toast.LENGTH_LONG,
                          //       gravity: ToastGravity.TOP,
                          //       timeInSecForIosWeb: 1,
                          //       backgroundColor: Colors.red,
                          //       textColor: Colors.white,
                          //       fontSize: 16.0
                          //   );
                          //
                          //   return;
                          // }
                          // if(_passwordController.text.isEmpty){
                          //
                          //   Fluttertoast.showToast(
                          //       msg: "Password incorrect",
                          //       toastLength: Toast.LENGTH_LONG,
                          //       gravity: ToastGravity.TOP,
                          //       timeInSecForIosWeb: 1,
                          //       backgroundColor: Colors.red,
                          //       textColor: Colors.white,
                          //       fontSize: 16.0
                          //   );
                          //
                          //   return;
                          // }

                          //  signIn();
                          // setState(() {
                          //   print(
                          //       "User onTap _handleLogin ===>Se connecter _handleLogin");
                          //   _handleLogin();
                          // });

                          _submitLogin();



                        }),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomButton(
                        title: "S'inscrire",
                        color: AppColors.primary,
                        onTap: () {
                          final route = MaterialPageRoute(
                              builder: (ctxt) => const RegisterScreen());
                          Navigator.pushReplacement(context, route);
                        }),
                    //TODO Bouton Inscription
                  ],
                ),
              ));
  }

  Widget _buildLogoUi() {
    return Center(
      child: Image.asset(
        "${Constants.imagesDirectory}/bank_logo.png",
        width: 60.w,
      ),
    );
  }
}
