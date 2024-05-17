import 'package:energygym/model/models.dart';
import 'package:energygym/view/auth/couchregisterScreen.dart';
import 'package:energygym/view/auth/forgetpass.dart';
import 'package:energygym/view/coach/coachhomepage.dart';
import 'package:energygym/view/coach/coachmainscreen.dart';
import 'package:energygym/widgets/custombutton.dart';
import 'package:energygym/widgets/customtextfield.dart';
import 'package:energygym/widgets/progresDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class CoachSignin extends StatefulWidget {
  const CoachSignin({super.key});

  static const String idScreen = "coachSignin";

  @override
  State<CoachSignin> createState() => _CoachSigninState();
}

validateForm(BuildContext context) {
  if (!emailTextEditingController.text.contains("@")) {
    Fluttertoast.showToast(msg: "Email is invalid");
  } else if (passwordTextEditingController.text.isEmpty) {
    Fluttertoast.showToast(msg: "Password is not correct");
  } else {
    loginDriverNow(context);
  }
}

loginDriverNow(context) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext c) {
      return progressDialog(
        message: "Signing in ",
      );
    },
  );
  final User? firebaseUser = (await fAuth
          .signInWithEmailAndPassword(
    email: emailTextEditingController.text.trim(),
    password: passwordTextEditingController.text.trim(),
  )
          .catchError((msg) {
    Navigator.pop(context);
    Fluttertoast.showToast(msg: "Error" + msg.toString());
  }))
      .user;

  if (firebaseUser != null) {
    DatabaseReference coachRef = FirebaseDatabase.instance.ref("coach");
    coachRef.child(firebaseUser.uid).once().then((coachKey) {
      final snap = coachKey.snapshot;
      if (snap.value != null) {}
    });

    currentFirebaseUser = firebaseUser;
    Fluttertoast.showToast(msg: "Log in successfully");
    Navigator.push(
        context, MaterialPageRoute(builder: (c) => CoachMainScreen()));
  } else {
    Navigator.pop(context);
    Fluttertoast.showToast(msg: "Can Not Login  ");
  }
}

class _CoachSigninState extends State<CoachSignin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              Text('Welcome Back Coach',
                  style: GoogleFonts.tajawal(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
              Text(' Please Sign In To Your Account',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.tajawal(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              Image.asset('images/coach.png', height: 200),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                  obscureText: false,
                  controller: emailTextEditingController,
                  hinttext: "Email Address",
                  keyboardType: TextInputType.emailAddress),
              const SizedBox(
                height: 7,
              ),
              CustomTextField(
                  obscureText: true,
                  controller: passwordTextEditingController,
                  hinttext: "Password",
                  keyboardType: TextInputType.text),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgetPass(),
                            ));
                      },
                      child: Text('Forget Password ? ',
                          style: GoogleFonts.tajawal(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ))),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  text: 'Sign in',
                  onPressed: () {
                    validateForm(context);
                  }),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                        flex: 1,
                        child: Divider(
                          color: Colors.grey,
                        )),
                    Text(
                      '  OR ',
                      style: GoogleFonts.tajawal(
                        fontSize: 17,
                      ),
                    ),
                    const Expanded(
                        flex: 1,
                        child: Divider(
                          color: Colors.grey,
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('You Don\'t Have Account?',
                      style: GoogleFonts.tajawal(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CouchRegister()));
                      },
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.tajawal(
                            color: Colors.red[900],
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
