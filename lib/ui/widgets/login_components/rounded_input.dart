import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../business/constants/colors.dart';
import 'input_container.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput(
      {Key? key,
      required this.controller,
      required this.icon,
      required this.hint})
      : super(key: key);

  final IconData icon;
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
        child: TextField(
      controller: controller,
      //style: GoogleFonts.unifrakturCook(),
      cursorColor: Colors.white,
      decoration: InputDecoration(
          icon: Icon(icon, color: Colors.white),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white),
          border: InputBorder.none),
    ));
  }
}// bir sağdan vuruyorum bir soldan vuruyorum arada da haç çıkarıyorum
