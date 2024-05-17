import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.onPressed,
    this.text,
  });
  String? text;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red[900],
          foregroundColor: Colors.white,
          elevation: 10,
          padding: EdgeInsets.symmetric(horizontal: 70)),
      onPressed: onPressed,
      child: Text('$text',
          style: GoogleFonts.tajawal(fontWeight: FontWeight.bold)),
    );
  }
}
