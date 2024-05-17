import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
  CustomContainer(
      {super.key,
      this.wedgets,
      this.height,
      required this.color,
      this.width,
      this.image,
      this.gradient});

  Widget? wedgets;
  double? height;
  Color? color;
  double? width;
  DecorationImage? image;
  Gradient? gradient;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
        image: image,
        gradient: gradient,
      ),
      child: wedgets,
    );
  }
}

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  CustomText({super.key, required this.text, this.fontSize});
  String? text;
  double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: fontSize),
    );
  }
}
