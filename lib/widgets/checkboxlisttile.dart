import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChekBoxListTile extends StatelessWidget {
  ChekBoxListTile({super.key, required this.onChanged, required this.value});

  void Function(bool?)? onChanged;
  bool? value;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        checkColor: Colors.white,
        activeColor: Colors.red[900],
        title: Text(
          'High Stepping',
          textAlign: TextAlign.center,
          style: GoogleFonts.abel(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        secondary: const Image(
          image: AssetImage(
            'images/exersizes/home/crunchyfrog.gif',
          ),
          height: 90,
          width: 90,
        ),
        subtitle: Text(
          '00: 30',
          textAlign: TextAlign.center,
          style: GoogleFonts.aBeeZee(fontSize: 17),
        ),
        tristate: false,
        value: value,
        onChanged: onChanged);
  }
}
