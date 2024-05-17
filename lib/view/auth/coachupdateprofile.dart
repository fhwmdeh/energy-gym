import 'package:energygym/model/models.dart';
import 'package:energygym/widgets/custombutton.dart';
import 'package:energygym/widgets/customcontainer.dart';
import 'package:energygym/widgets/customtextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoachUpdateData extends StatefulWidget {
  const CoachUpdateData({super.key});

  @override
  State<CoachUpdateData> createState() => _CoachUpdateDataState();
}

TextEditingController nameTextEditingController = TextEditingController();
TextEditingController emailTextEditingController = TextEditingController();
TextEditingController phoneTextEditingController = TextEditingController();
TextEditingController passwordTextEditingController = TextEditingController();

updateCoachProfile() async {
  final User? firebaseUser = (await fAuth.createUserWithEmailAndPassword(
    email: emailTextEditingController.text.trim(),
    password: passwordTextEditingController.text.trim(),
  ))
      .user;
  DatabaseReference coachRef =
      FirebaseDatabase.instance.ref('coach').child(currentFirebaseUser!.uid);
  coachRef.update({
    'name': nameTextEditingController.text,
    'email': emailTextEditingController.text,
    'phone': phoneTextEditingController.text,
    'password': passwordTextEditingController.text,
  });
}

class _CoachUpdateDataState extends State<CoachUpdateData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        foregroundColor: Colors.white,
        title: CustomText(
          text: 'Update Profile',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Icon(
                  Icons.update_rounded,
                  color: Colors.red[800],
                  size: 200,
                )),
                Text(
                  'Update Your Data',
                  style: GoogleFonts.aBeeZee(),
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
                  hinttext: 'Phone Number ',
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
                CustomButton(
                  onPressed: () {
                    updateCoachProfile();
                  },
                  text: 'Update',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
