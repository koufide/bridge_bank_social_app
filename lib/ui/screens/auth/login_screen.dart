import 'package:bridgebank_social_app/configuration/constants.dart';
import 'package:bridgebank_social_app/ui/screens/auth/register_screen.dart';
import 'package:bridgebank_social_app/ui/widgets/customer_button.dart';
import 'package:bridgebank_social_app/ui/widgets/customer_text_field.dart';
import 'package:bridgebank_social_app/ui/widgets/progess_indicator_app.dart';
import 'package:bridgebank_social_app/ui/widgets/progress_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void _showProgress(){
    _isLoading = true;
    if(mounted){
      setState(() {

      });
    }
  }

  void hideProgress(){
    _isLoading = false;
    if(mounted) {
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text(""),       ),
      body: _isLoading?ProgressUi():SingleChildScrollView(
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
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),

            SizedBox(
              height: 2.h,
            ),
            DefaultTextField(
              textController: _emailController,
              placeholder: "Email",
              prefixIcon: Icons.email,
              obscureText: false,
            ),

            SizedBox(
              height: 2.h,
            ),

            DefaultTextField(
              textController: _passwordController,
              placeholder: "Password",
              prefixIcon: Icons.lock,
              obscureText: true,
            ),

            SizedBox(
              height: 2.h,
            ),

            // lien de mot de passe oublie
            InkWell(
              onTap: () {
                print("==> Mot de passe oublié");
              },
              child: const Text(
                "Mot de passe oublié",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),

            SizedBox(
              height: 2.h,
            ),

            // Container(
            //   child: ElevatedButton(onPressed: () {},
            //       style: ButtonStyle(
            //           backgroundColor: WidgetStateProperty.all(AppColors.secondary)
            //       ),
            //       child: const Text("Connexion")
            //   ),
            // ),

            CustomerButton(
                title: "Connexion",
                onTap: () {
                  // final route = MaterialPageRoute(
                  //     builder: (ctxt) => const MainScreen(
                  //           title: "Message Page",
                  //         ));

                           final route = MaterialPageRoute(
                      builder: (ctxt) => const MyProgessIndicatorApp()
                      );


                           //Navigator.pushReplacement(context, route);
                           Navigator.push(context, route);

                }
                //,color: AppColors.appBarTitleColor,
                ),

            CustomerButton(
                title: "S'inscrire",
                onTap: () {
                  final route = MaterialPageRoute(
                      builder: (ctxt) => const RegisterScreen());
                  Navigator.push(context, route);
                }
                //,color: AppColors.appBarTitleColor,
                ),

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

  // Widget _buildProgressUi(){
  //   return Stack(
  //     children: [
  //       Container(
  //         // todo yyy
  //       ),
  //       Center(
  //
  //       ),
  //     ],
  //   )
  // }
}
