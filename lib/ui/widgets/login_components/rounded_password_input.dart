import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../business/constants/colors.dart';
import 'input_container.dart';

class RoundedPasswordInput extends StatelessWidget {
  const RoundedPasswordInput(
      {Key? key, required this.controllerPas, required this.hint})
      : super(key: key);

  final String hint;
  final TextEditingController controllerPas;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
        child: TextField(
      controller: controllerPas,
      //style: GoogleFonts.unifrakturCook(),
      cursorColor: kPrimaryColor,
      obscureText: true,
      decoration: InputDecoration(
          icon: Icon(Icons.lock, color: Colors.white),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white),
          border: InputBorder.none),
    ));
  }
}
