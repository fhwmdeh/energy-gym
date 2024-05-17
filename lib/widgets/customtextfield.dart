import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  CustomTextField(
      {super.key,
      required this.controller,
      required this.hinttext,
      required this.keyboardType,
      this.obscureText});
  bool? obscureText;
  final TextEditingController? controller;
  String? hinttext;
  TextInputType? keyboardType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obscureText ?? false,
      controller: widget.controller,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        fillColor: Colors.grey[100],
        hintText: widget.hinttext,
        hintStyle: GoogleFonts.tajawal(fontSize: 15),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: const Color.fromARGB(255, 0, 0, 0))),
        focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 156, 14, 4)),
            borderRadius: BorderRadius.circular(30)),
      ),
      keyboardType: widget.keyboardType,
    );
  }
}
