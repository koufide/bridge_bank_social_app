import 'package:bridgebank_social_app/configuration/constants.dart';
import 'package:bridgebank_social_app/data/models/session.dart';
import 'package:bridgebank_social_app/rest/backend_rest_service.dart';
import 'package:bridgebank_social_app/ui/screens/auth/login_screen.dart';
import 'package:bridgebank_social_app/ui/widgets/custom_button.dart';
import 'package:bridgebank_social_app/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:bridgebank_social_app/configuration/colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  bool _isTermsAccepted = false;

  Future<void> _inscription() async {
    //recuperer les variables
    final String firstName = _firstNameController.text;
    final String lastName = _lastNameController.text;
    final String email = _emailController.text;
    final String password = _passwordController.text;

    print('Email: $email');
    print('Password: $password');
    print('lastName: $lastName');
    print('firstName: $firstName');

    try {
      final Session res = await BackendRestService().signUp(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password);

      print("RES ==> " + res.user.toString());

      // Afficher un message de succès et rediriger vers la page d'accueil
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('inscription réussie')),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Échec de la connexion: $e')),
      );
    }
  } // inscription

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                "Inscription",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: Constants.defaultPadding,
                  right: Constants.defaultPadding),
              child: Text(
                "Rejoignez nous maintenant ! Ouvrez un compte pour accéder à la communauté.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            //FirstName
            SizedBox(
              height: 4.h,
            ),
            //Email
            DefaultTextField(
              textController: _firstNameController,
              inputType: TextInputType.name,
              placeholder: "Prénoms",
              prefixIcon: Icons.person,
            ),
            SizedBox(
              height: 1.h,
            ),
            //LastName
            DefaultTextField(
              textController: _lastNameController,
              inputType: TextInputType.name,
              placeholder: "Nom",
              prefixIcon: Icons.person,
            ),
            //Email
            SizedBox(
              height: 1.h,
            ),
            //Email
            DefaultTextField(
              textController: _emailController,
              inputType: TextInputType.emailAddress,
              placeholder: "Email",
              prefixIcon: Icons.email,
            ),
            SizedBox(
              height: 1.h,
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
              height: 4.h,
            ),
            Row(
              children: [
                Checkbox(
                    value: _isTermsAccepted,
                    onChanged: (value) {
                      _isTermsAccepted = value!;
                      setState(() {});
                    }),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _isTermsAccepted = !_isTermsAccepted;
                      setState(() {});
                    },
                    child: const Text(
                      "J'accepte les conditions d'utilisations en cochant cette case. "
                      "Cette action est obligatoire pour votre inscription.",
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            //Bouton Connexion
            CustomButton(
                title: "S'inscrire",
                onTap: () {
                  setState(() {
                    print(
                        "User onTap _inscription ===>S'inscrire _inscription");

                    _inscription();
                  });
                }),
            SizedBox(
              height: 2.h,
            ),
            CustomButton(
                title: "Se connecter",
                color: AppColors.primary,
                onTap: () {
                  final route =
                      MaterialPageRoute(builder: (ctxt) => const LoginScreen());
                  Navigator.pushReplacement(context, route);
                }),
          ],
        ),
      ),
    );
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
