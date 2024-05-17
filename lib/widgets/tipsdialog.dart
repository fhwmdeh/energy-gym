import 'package:energygym/widgets/custombutton.dart';
import 'package:energygym/widgets/customtextfield.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../view/auth/coachupdateprofile.dart';

class TipsDialog extends StatefulWidget {
  const TipsDialog({super.key});

  @override
  State<TipsDialog> createState() => _TipsDialogState();
}

TextEditingController tipsTitle = TextEditingController();
TextEditingController tipsdiscription = TextEditingController();
saveTips() {
  DatabaseReference tipslistRef = FirebaseDatabase.instance.ref('tips');

  DatabaseReference newTipRef = tipslistRef.push();

  newTipRef.set({
    'TipTitle': tipsTitle.text,
    'TipDiscreption': tipsdiscription.text,
    'tipsDate': DateTime.now().toString()
  });
}

class _TipsDialogState extends State<TipsDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey[300],
      child: Container(
        height: 400,
        width: double.infinity,
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Add Tips To Trainers',
                  style:
                      GoogleFonts.aDLaMDisplay(color: Colors.red, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: tipsTitle,
                    hinttext: 'Tips Name',
                    keyboardType: TextInputType.text,
                    obscureText: false),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: tipsdiscription,
                  decoration: InputDecoration(
                      hintMaxLines: 5,
                      fillColor: Colors.amber[50],
                      label: Text(
                        'Tips Description',
                        style: GoogleFonts.aBeeZee(color: Colors.red),
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  onPressed: () {
                    setState(() {
                      saveTips();
                      tipsTitle.clear();
                      tipsdiscription.clear();
                      Navigator.pop(context, 'Tips Added');
                    });
                  },
                  text: 'Add Tips',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
