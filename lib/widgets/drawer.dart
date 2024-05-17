// ignore_for_file: must_be_immutable

import 'package:energygym/model/models.dart';
import 'package:energygym/view/screens/about.dart';
import 'package:energygym/view/trainee/trainerprofilescreen.dart';
import 'package:energygym/view/trainee/trainertips.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';

import '../exersizes/coachexercise/coach_exercises_page.dart';
import '../exersizes/trainerexercises/trainer_exercises_page.dart';

class MyDrwer extends StatefulWidget {
  String? name;
  String? email;
  MyDrwer({
    super.key,
    this.name,
    this.email,
  });

  @override
  State<MyDrwer> createState() => _MyDrwerState();
}

readCurrentTrainerInformation() async {
  currentFirebaseUser = fAuth.currentUser;
  await FirebaseDatabase.instance
      .ref("coach")
      .child(currentFirebaseUser!.uid)
      .child('trainer')
      .child(currentFirebaseUser!.uid)
      .once()
      .then((DatabaseEvent snap) {
    if (snap.snapshot.value != null) {
      trainerData!.name = (snap.snapshot.value as Map)["name"].toString();
      trainerData!.email = (snap.snapshot.value as Map)["email"].toString();
      trainerData!.phone = (snap.snapshot.value as Map)["phone"].toString();
    }
  });
}

@override
void initState() {
  // super.initState();

  readCurrentTrainerInformation();
}

class _MyDrwerState extends State<MyDrwer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          //drwer Header
          Container(
            height: 165,
            color: Colors.grey,
            child: DrawerHeader(
              decoration: const BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  const Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        trainerData!.name.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        trainerData!.email.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (c) => const ExercisePage()));
            },
            child: ListTile(
              leading: Icon(
                Icons.sports_martial_arts_rounded,
                color: Colors.red[900],
              ),
              title: Text(
                "Exercises",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.red[900]),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              /* Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (c) => const TrainerProfileScreen()));*/
            },
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.red[900],
              ),
              title: Text(
                "Visit Profile",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.red[900]),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (c) => const TrainerTipsPage()));
            },
            child: ListTile(
              leading: Icon(
                Icons.tips_and_updates,
                color: Colors.red[900],
              ),
              title: Text(
                "Tips",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.red[900]),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (c) => AbouApp()));
            },
            child: ListTile(
              leading: Icon(
                Icons.info,
                color: Colors.red[900],
              ),
              title: Text(
                "About",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.red[900]),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              fAuth.signOut();
              // Navigator.push(context, MaterialPageRoute(builder: (context) => mysplashscreen(),));
            },
            child: ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.red[800],
              ),
              title: Text(
                "Sign Out",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.red[800]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
