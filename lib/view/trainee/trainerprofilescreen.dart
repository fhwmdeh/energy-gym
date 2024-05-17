import 'package:energygym/model/models.dart';
import 'package:energygym/view/screens/mysplashscreen.dart';
import 'package:energygym/widgets/custombutton.dart';
import 'package:energygym/widgets/customdivider.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class TrainerProfileScreen extends StatefulWidget {
  const TrainerProfileScreen({super.key});

  @override
  State<TrainerProfileScreen> createState() => _TrainerProfileScreenState();
}

class TrainerData {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? aim;

  TrainerData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.password,
  });
}

class _TrainerProfileScreenState extends State<TrainerProfileScreen> {
  TrainerData trainer = TrainerData();

  readCurrentcoachInformation() async {
    await FirebaseDatabase.instance
        .ref("trainer")
        .child(currentFirebaseUser!.uid)
        .once()
        .then((DatabaseEvent snap) {
      if (snap.snapshot.value != null) {
        // coachdata.id = (snap.snapshot.value as Map)["id"];
        trainer.name = (snap.snapshot.value as Map)["name"];
        trainer.email = (snap.snapshot.value as Map)["email"];
        trainer.phone = (snap.snapshot.value as Map)["phone"];
      }
    });
  }

  @override
  void initState() {
    super.initState();

    readCurrentcoachInformation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.person,
                  size: 150,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  '${trainer.name}',
                  style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomDivider(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.email,
                            size: 25,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            trainer.email.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          )
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.phone_android,
                            size: 25,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            trainer.phone.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          )
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  onPressed: () {
                    fAuth.signOut();
                    //  Navigator.pop(context);
                    SystemNavigator.pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MySplashScreen()));
                  },
                  text: 'Sign Out',
                )
              ],
            ),
          ),
        ));
  }
}
