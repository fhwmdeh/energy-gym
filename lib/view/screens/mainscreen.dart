import 'package:energygym/view/auth/coachsignin.dart';
import 'package:energygym/view/auth/traineesignin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'images/gymlogo.png',
            width: double.infinity,
            height: 250,
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.red,
                  elevation: 10,
                  padding: const EdgeInsets.symmetric(horizontal: 70)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CoachSignin()));
              },
              child: Text('Sign in As Coach',
                  style: GoogleFonts.tajawal(fontWeight: FontWeight.bold))),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffF7F7F7),
                foregroundColor: Colors.red,
                elevation: 10,
                padding: const EdgeInsets.symmetric(horizontal: 70)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TraineeSignIn()));
            },
            child: Text('Sign in As Trainer',
                style: GoogleFonts.tajawal(fontWeight: FontWeight.bold)),
          ),
        ],
      )),
    );
  }
}
