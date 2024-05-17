import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
        thickness: 1, indent: 10, endIndent: 10, color: Colors.grey);
  }
}
