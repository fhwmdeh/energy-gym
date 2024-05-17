import 'package:energygym/model/models.dart';
import 'package:energygym/view/coach/coachmainscreen.dart';
import 'package:energygym/view/coach/traineepage.dart';
import 'package:energygym/widgets/custombutton.dart';
import 'package:energygym/widgets/customdivider.dart';
import 'package:energygym/widgets/customtextfield.dart';
import 'package:energygym/widgets/progresDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class NewTrainee extends StatefulWidget {
  const NewTrainee({
    super.key,
  });

  @override
  State<NewTrainee> createState() => _NewTraineeState();
}

var selectgender = 'Male';

TextEditingController trainerEmailTextEditingController =
    TextEditingController();
TextEditingController trainerPassTextEditingController =
    TextEditingController();
TextEditingController trainerNameTextEditingController =
    TextEditingController();
TextEditingController trainerPhoneTextEditingController =
    TextEditingController();
TextEditingController trainerAgeTextEditingController = TextEditingController();
TextEditingController trainerTallTextEditingController =
    TextEditingController();
TextEditingController trainerWeightTextEditingController =
    TextEditingController();
TextEditingController trainerAimTextEditingController = TextEditingController();

validateForm(BuildContext context) {
  if (trainerNameTextEditingController.text.length < 2) {
    Fluttertoast.showToast(msg: "Name must be at least 2 characters");
  } else if (!trainerEmailTextEditingController.text
      .contains("@" + 'gmail.' + 'com')) {
    Fluttertoast.showToast(msg: "Email is invalid");
  } else if (trainerPhoneTextEditingController.text.isEmpty) {
    Fluttertoast.showToast(msg: "phone number is required");
  } else if (trainerPassTextEditingController.text.length < 6) {
    Fluttertoast.showToast(msg: "password must be at least 4 characters");
  } else {
    savetrainerInfoNow(context);
  }
}

savetrainerInfoNow(context) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext c) {
      return progressDialog(
        message: "Registering  ...",
      );
    },
  );
  final User? firebaseUser = (await fAuth
          .createUserWithEmailAndPassword(
    email: trainerEmailTextEditingController.text.trim(),
    password: trainerPassTextEditingController.text.trim(),
  )
          .catchError((msg) {
    Navigator.pop(context);
    Fluttertoast.showToast(msg: "Error" + msg.toString());
  }))
      .user;

  if (firebaseUser != null) {
    Map trainerMap = {
      "id": firebaseUser.uid,
      "name": trainerNameTextEditingController.text.trim(),
      "email": trainerEmailTextEditingController.text.trim(),
      "password": trainerPassTextEditingController.text.trim(),
      "phone": trainerPhoneTextEditingController.text.trim(),
      'age': trainerAgeTextEditingController.text.trim(),
      'weight': trainerWeightTextEditingController.text.trim(),
      'tall': trainerTallTextEditingController.text.trim(),
      'gender': selectgender,
      'aim': trainerAimTextEditingController.text.trim(),
      'startDate': DateTime.now().toString(),
      'endDate': DateTime.now().add(const Duration(days: 30)).toString(),
    };

    DatabaseReference trainerRef = FirebaseDatabase.instance.ref('trainer');
    trainerRef.child(firebaseUser.uid).set(trainerMap);
    currentFirebaseUser = firebaseUser;
    Fluttertoast.showToast(msg: 'Registed Successfully');
    Navigator.push(
        context, MaterialPageRoute(builder: (c) => const CoachMainScreen()));
  } else {
    Navigator.pop(context);
    Fluttertoast.showToast(msg: "Error With Registering");
  }
}

class _NewTraineeState extends State<NewTrainee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'New Trainer ',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[900],
        foregroundColor: Colors.white,
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.app_registration_rounded,
                  size: 150,
                  color: Colors.red,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Regist New Trainer ',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    obscureText: false,
                    controller: trainerNameTextEditingController,
                    hinttext: 'Full Name',
                    keyboardType: TextInputType.name),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    obscureText: false,
                    controller: trainerPhoneTextEditingController,
                    hinttext: 'Phone Number ',
                    keyboardType: TextInputType.phone),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    obscureText: false,
                    controller: trainerAgeTextEditingController,
                    hinttext: 'Age',
                    keyboardType: TextInputType.number),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    obscureText: false,
                    controller: trainerTallTextEditingController,
                    hinttext: 'Tall',
                    keyboardType: TextInputType.number),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    obscureText: false,
                    controller: trainerWeightTextEditingController,
                    hinttext: 'Weight',
                    keyboardType: TextInputType.number),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    obscureText: false,
                    controller: trainerAimTextEditingController,
                    hinttext: 'Aim ',
                    keyboardType: TextInputType.text),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Gender :',
                        style: GoogleFonts.aBeeZee(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      DropdownButton(
                        hint: Text(
                          'Gender',
                          style: GoogleFonts.aBeeZee(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        focusColor: Colors.red,
                        elevation: 10,
                        style: GoogleFonts.aBeeZee(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        items: ['Male', 'Female']
                            .map((e) => DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            selectgender = val!;
                          });
                        },
                        value: selectgender,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                const SizedBox(
                  height: 7,
                ),
                const CustomDivider(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Trainer Sign in Data',
                  style: GoogleFonts.aBeeZee(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
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
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onPressed: () {
                    validateForm(context);
                  },
                  text: 'Regist New Trainer',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
