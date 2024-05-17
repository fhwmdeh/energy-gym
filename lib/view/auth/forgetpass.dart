import 'package:energygym/model/models.dart';
import 'package:energygym/view/auth/coachupdateprofile.dart';
import 'package:energygym/widgets/custombutton.dart';
import 'package:energygym/widgets/customtextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.password,
                color: Colors.red[900],
                size: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Reset Password',
                style: GoogleFonts.aBeeZee(
                    fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                  controller: emailTextEditingController,
                  hinttext: 'Email Address',
                  keyboardType: TextInputType.emailAddress),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                onPressed: () async {
                  await FirebaseAuth.instance.sendPasswordResetEmail(
                      email: emailTextEditingController.text);
                  emailTextEditingController.clear();
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      titlePadding: EdgeInsets.all(30),
                      title: Text(
                        'Please Check Your Email... ',
                        style: GoogleFonts.aBeeZee(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
                text: 'Send Message',
              )
            ],
          ),
        ),
      ),
    );
  }
}
