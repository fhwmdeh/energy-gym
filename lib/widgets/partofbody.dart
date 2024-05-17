import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PartOfBody extends StatelessWidget {
  PartOfBody({
    super.key,
    required this.onPressed,
    required this.image,
    required this.bodpart,
    required this.bdiscript,
  });
  void Function()? onPressed;
  ImageProvider<Object> image;
  String? bodpart;
  String? bdiscript;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // image
        Image(
          image: image,
          height: 70,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: 5,
        ),

        Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //name of type exersises with bold text
            Text(
              bodpart!,
              style:
                  GoogleFonts.abel(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 3,
            ),
            //display image by text
            Text(
              bdiscript!,
              style: GoogleFonts.abel(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.navigate_next_outlined,
            color: Colors.red,
            size: 40,
          ),
        ),
        //nav icon button
      ],
    );
  }
}
