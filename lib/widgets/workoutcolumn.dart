import 'package:flutter/material.dart';

class WorkoutColumn extends StatelessWidget {
  WorkoutColumn({
    super.key,
    this.text1,
    this.text2,
  });

  String? text1;
  String? text2;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          '',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          '',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
