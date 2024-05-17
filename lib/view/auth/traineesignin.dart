import 'package:energygym/model/models.dart';
import 'package:energygym/view/auth/registnewtrainee.dart';
import 'package:energygym/view/trainee/trainer_tapbar.dart';
import 'package:energygym/widgets/custombutton.dart';
import 'package:energygym/widgets/customtextfield.dart';
import 'package:energygym/widgets/progresDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class TraineeSignIn extends StatefulWidget {
  const TraineeSignIn({super.key});

  @override
  State<TraineeSignIn> createState() => _TraineeSignInState();
}

validateForm(BuildContext context) {
  if (!trainerEmailTextEditingController.text.contains("@")) {
    Fluttertoast.showToast(msg: "Email is invalid");
  } else if (trainerPassTextEditingController.text.isEmpty) {
    Fluttertoast.showToast(msg: "Password is not correct");
  } else {
    loginTrainerNow(context);
  }
}

loginTrainerNow(context) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext c) {
      return progressDialog(
        message: "Signing in ... ",
      );
    },
  );
  final User? firebaseUser = (await fAuth
          .signInWithEmailAndPassword(
    email: trainerEmailTextEditingController.text.trim(),
    password: trainerPassTextEditingController.text.trim(),
  )
          .catchError((msg) {
    Navigator.pop(context);
    Fluttertoast.showToast(msg: "Error" + msg.toString());
  }))
      .user;

  if (firebaseUser != null) {
    DatabaseReference coachRef = FirebaseDatabase.instance.ref("trainer");
    coachRef.child(firebaseUser.uid).once().then((coachKey) {
      final snap = coachKey.snapshot;
      if (snap.value != null) {}
    });

    currentFirebaseUser = firebaseUser;
    Fluttertoast.showToast(msg: "Log in successfully");
    Navigator.push(
        context, MaterialPageRoute(builder: (c) => const TrainerTabbar()));
  } else {
    Navigator.pop(context);
    Fluttertoast.showToast(msg: "Can Not Login  ");
  }
}

class _TraineeSignInState extends State<TraineeSignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                ),
                Text(
                  'Hello Trainer  ',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.aBeeZee(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'I Hope You Enjoy Our Gym App',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.aBeeZee(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'images/coach.png',
                  height: 150,
                  width: 150,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    obscureText: false,
                    controller: trainerEmailTextEditingController,
                    hinttext: 'Email Address',
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    obscureText: true,
                    controller: trainerPassTextEditingController,
                    hinttext: 'Password',
                    keyboardType: TextInputType.visiblePassword),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.sendPasswordResetEmail(
                            email: trainerEmailTextEditingController.text);
                      },
                      child: Text(
                        'Forgot Password? ',
                        style: GoogleFonts.tajawal(
                            color: Colors.red[900],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onPressed: () {
                    validateForm(context);
                  },
                  text: 'Sign In',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
