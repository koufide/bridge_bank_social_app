import 'package:bridgebank_social_app/configuration/colors.dart';
import 'package:bridgebank_social_app/configuration/constants.dart';
import 'package:bridgebank_social_app/ui/screens/auth/login_screen.dart';
import 'package:bridgebank_social_app/ui/widgets/customer_button.dart';
import 'package:bridgebank_social_app/ui/widgets/customer_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text(""),       ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(
              height: Adaptive.h(7),
            ),

            _buildLogoUi(),

            Center(
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                color: const Color.fromARGB(255, 255, 0, 0),
                //decoration: BoxDecoration(color: Color(Colors.blue)),
                child: Text(
                  "Inscription",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              )
            ),

            Center(
              child: Text(
                "Rejoignez nous maintenant!!! ouvrez un compte pour acceder à la communaute BRIDGE",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),

            SizedBox(
              height: 2.h,
            ),


            DefaultTextField(
              textController: _lastNameController,
              placeholder: "Nom",
              prefixIcon: Icons.person,
              obscureText: false,
            ),
            SizedBox(
              height: 2.h,
            ),

            DefaultTextField(
              textController: _firstNameController,
              placeholder: "PreNoms",
              prefixIcon: Icons.person_2,
              obscureText: false,
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

            Row(
              children: [
                Checkbox(
                    value: _isTermsAccepted,
                    onChanged: (value){
                      _isTermsAccepted = value!;
                      setState(() {

                      });
                    }
                ),
                const Expanded(
                  child: Text("En cochant .....j'accepte les conditions d'utilisation"),
                )

              ],
            ),

            SizedBox(
              height: 2.h,
            ),


            // lien de mot de passe oublie
            InkWell(
              onTap: () {
                print("==> Inscriptionn");
              },
              child: const Text(
                "Mot de passe oublié",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),

            SizedBox(
              height: 2.h,
            ),


            CustomerButton(
                title: "S'inscrire"
                , onTap: (){}
              //,color: AppColors.appBarTitleColor,
            ),

            CustomerButton(
                title: "Connexion"
                , onTap: (){
                  final route = MaterialPageRoute(builder: (ctxt) => const LoginScreen() );
                  Navigator.pushReplacement(context, route);
            }
              //,color: AppColors.appBarTitleColor,
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
