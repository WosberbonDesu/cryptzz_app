import 'package:cryptzz_app/ui/widgets/globalWidgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_components/rounded_button.dart';
import 'login_components/rounded_input.dart';
import 'login_components/rounded_password_input.dart';

class LoginForm extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  LoginForm({
    Key? key,
    required this.isLogin,
    required this.animationDuration,
    required this.size,
    required this.defaultLoginSize,
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isLogin ? 1.0 : 0.0,
      duration: animationDuration * 4,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: size.width,
          height: defaultLoginSize,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                GradientText("Cryptzzz",
                    gradient: LinearGradient(colors: [
                      Color(0xFF000000),
                      Color(0xFF0f005b),
                      Color(0xFF2e0059),
                      Color(0xFF5b0000),
                      Color(0xFF000000)
                    ]),
                    style: GoogleFonts.unifrakturCook(
                        fontStyle: FontStyle.normal, fontSize: 48)),
                const SizedBox(height: 40),
                Image.asset(
                  'assets/nft-modified-1.png',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 40),
                RoundedInput(
                  icon: Icons.mail,
                  hint: 'Username',
                  controller: emailController,
                ),
                RoundedPasswordInput(
                  hint: 'Password',
                  controllerPas: passwordController,
                ),
                const SizedBox(height: 10),
                const RoundedButton(title: 'LOGIN'),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
