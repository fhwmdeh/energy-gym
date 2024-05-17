import 'package:energygym/model/models.dart';
import 'package:energygym/view/auth/coachsignin.dart';

import 'package:energygym/view/coach/coachhomepage.dart';
import 'package:energygym/view/coach/coachmainscreen.dart';

import 'package:energygym/widgets/customtextfield.dart';
import 'package:energygym/widgets/progresDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class CouchRegister extends StatefulWidget {
  const CouchRegister({super.key});

  @override
  State<CouchRegister> createState() => _CouchRegisterState();
}

TextEditingController nameTextEditingController = TextEditingController();
TextEditingController emailTextEditingController = TextEditingController();
TextEditingController phoneTextEditingController = TextEditingController();
TextEditingController passwordTextEditingController = TextEditingController();

validateForm(BuildContext context) {
  if (nameTextEditingController.text.length < 2) {
    Fluttertoast.showToast(msg: "Name must be at least 2 characters");
  } else if (!emailTextEditingController.text.contains("@")) {
    Fluttertoast.showToast(msg: "Email is invalid");
  } else if (phoneTextEditingController.text.isEmpty) {
    Fluttertoast.showToast(msg: "phone number is required");
  } else if (passwordTextEditingController.text.length < 6) {
    Fluttertoast.showToast(msg: "password must be at least 4 characters");
  } else {
    saveCoachInfoNow(context);
  }
}

saveCoachInfoNow(context) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext c) {
      return progressDialog(
        message: "signing up , please wait...",
      );
    },
  );
  final User? firebaseUser = (await fAuth
          .createUserWithEmailAndPassword(
    email: emailTextEditingController.text.trim(),
    password: passwordTextEditingController.text.trim(),
  )
          .catchError((msg) {
    Navigator.pop(context);
    Fluttertoast.showToast(msg: "Error" + msg.toString());
  }))
      .user;

  if (firebaseUser != null) {
    Map coachMap = {
      "id": firebaseUser.uid,
      "name": nameTextEditingController.text.trim(),
      "email": emailTextEditingController.text.trim(),
      "password": passwordTextEditingController.text.trim(),
      "phone": phoneTextEditingController.text.trim(),
    };

    DatabaseReference coachRef = FirebaseDatabase.instance.ref("coach");
    coachRef.child(firebaseUser.uid).set(coachMap);
    currentFirebaseUser = firebaseUser;
    Fluttertoast.showToast(msg: "Registeration Successfuly ");
    Navigator.push(
        context, MaterialPageRoute(builder: (c) => const CoachMainScreen()));
  } else {
    Navigator.pop(context);
    Fluttertoast.showToast(msg: "Can Not Register ");
  }
}

class _CouchRegisterState extends State<CouchRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text('Welcom To Our App Coach  ',
                    style: GoogleFonts.arapey(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
                Text('Please Sign You Information',
                    style: GoogleFonts.arapey(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 70,
                    // maxRadius: 70,
                    child: Image.asset(
                      'images/coach.png',
                      width: 200,
                      height: 200,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  obscureText: false,
                  controller: nameTextEditingController,
                  hinttext: 'Full Name',
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 7,
                ),
                CustomTextField(
                    obscureText: false,
                    controller: emailTextEditingController,
                    hinttext: 'Email Address',
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(
                  height: 7,
                ),
                CustomTextField(
                  obscureText: false,
                  controller: phoneTextEditingController,
                  hinttext: 'phone number',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 7,
                ),
                CustomTextField(
                  obscureText: true,
                  controller: passwordTextEditingController,
                  hinttext: 'Password',
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.grey,
                      ),
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                      backgroundColor: Colors.red[900],
                      elevation: 10,
                      padding: const EdgeInsets.symmetric(horizontal: 150)),
                  onPressed: () {
                    validateForm(context);
                  },
                  child: Text('Register',
                      style: GoogleFonts.tajawal(fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('You Already Have Account?',
                        style: GoogleFonts.tajawal(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CoachSignin()));
                        },
                        child: Text(
                          'Sign in',
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
      ),
    );
  }
}
