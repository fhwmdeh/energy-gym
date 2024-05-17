import 'package:flutter/material.dart';

class CustomChips extends StatelessWidget {
  CustomChips({super.key, required this.label, required this.backgroundColor});
  Widget? label;
  Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text('S'),
      autofocus: true,
      backgroundColor: Colors.blue[100],
      elevation: 0.5,
      shape: CircleBorder(side: BorderSide(color: Colors.grey)),
    );
  }
}
