import 'package:energygym/widgets/customcontainer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.text, required this.dateText});
  final String? text;
  final String? dateText;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(7),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.red[900],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            CustomText(
                //text will come from database
                text: text,
                fontSize: 17),
            Text(
              dateText!,
              style: GoogleFonts.arapey(fontSize: 9),
            )
          ],
        ),
      ),
    );
  }
}

class ChatBubble2 extends StatelessWidget {
  const ChatBubble2({
    super.key,
    required this.text,
    required this.dateText,
  });
  final String? text;

  final String? dateText;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(7),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.red[500],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            CustomText(
                //text will come from database
                text: text,
                fontSize: 17),
            CustomText(
                //text will come from database
                text: dateText,
                fontSize: 9),
          ],
        ),
      ),
    );
  }
}

class ChatTextField extends StatelessWidget {
  const ChatTextField({super.key, required this.controller});
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField();
  }
}
