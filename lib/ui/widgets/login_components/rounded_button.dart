import 'package:cryptzz_app/providers/AppState.dart';
import 'package:cryptzz_app/ui/widgets/currencies_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../business/constants/colors.dart';
import '../../../business/constants/global_context.dart';
import '../../../main.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {Key? key,
      required this.title,
      required this.email,
      this.name,
      required this.password})
      : super(key: key);

  final String title;
  final String email;
  final String password;
  final String? name;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        title == "LOGIN"
            ? signIn(email, password).then((value) => Navigator.push(context,
                MaterialPageRoute(builder: (context) => CurrenciesWidget())))
            : signUp(email, password, name!);
        // MaterialPageRoute(builder: (context) => CurrenciesWidget()));
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kPrimaryColor,
        ),
        padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        child: Text(
          title,
          style: GoogleFonts.unifrakturCook(fontSize: 10, color: Colors.white),
        ),
      ),
    );
  }

  Future signIn(String email, String password) async {
    showDialog(
        context: NavigationService.navigatorKey.currentContext!,
        builder: (context) => Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ));

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on Exception catch (E) {
      print(E);
      print("bir hata çıkageldi");
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  Future signUp(String email, String password, String name) async {
    showDialog(
      builder: (context) => Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
      context: NavigationService.navigatorKey.currentContext!,
    );
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on Exception catch (e) {
      showDialog(
        context: NavigationService.navigatorKey.currentContext!,
        builder: (context) => Center(
            child: CircularProgressIndicator(
          color: Colors.white,
        )),
      );
    }
  }
}
