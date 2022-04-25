import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../business/constants/colors.dart';
import 'input_container.dart';

class RoundedPasswordInput extends StatelessWidget {
  const RoundedPasswordInput({Key? key, required this.hint}) : super(key: key);

  final String hint;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
        child: TextField(
      style: GoogleFonts.unifrakturCook(),
      cursorColor: kPrimaryColor,
      obscureText: true,
      decoration: InputDecoration(
          icon: Icon(Icons.lock, color: kPrimaryColor),
          hintText: hint,
          border: InputBorder.none),
    ));
  }
}
