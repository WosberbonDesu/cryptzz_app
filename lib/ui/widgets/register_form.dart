import 'package:flutter/material.dart';

import 'login_components/rounded_button.dart';
import 'login_components/rounded_input.dart';
import 'login_components/rounded_password_input.dart';

class RegisterForm extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final nameController = TextEditingController();

  RegisterForm({
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
      opacity: isLogin ? 0.0 : 1.0,
      duration: animationDuration * 5,
      child: Visibility(
        visible: !isLogin,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: size.width,
            height: defaultLoginSize,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),

                  const Text(
                    'Welcome',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),

                  const SizedBox(height: 40),

                  //SvgPicture.asset('assets/images/register.svg'),

                  const SizedBox(height: 40),

                  RoundedInput(
                    icon: Icons.mail,
                    hint: 'Username',
                    controller: usernameController,
                  ),

                  RoundedInput(
                    icon: Icons.face_rounded,
                    hint: 'Name',
                    controller: nameController,
                  ),

                  RoundedPasswordInput(
                      controllerPas: passwordController, hint: 'Password'),

                  const SizedBox(height: 10),

                  RoundedButton(title: 'SIGN UP'),

                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
