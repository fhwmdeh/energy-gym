import 'package:energygym/model/models.dart';

import 'package:energygym/view/auth/coachupdateprofile.dart';
import 'package:energygym/view/coach/coachnotescreen.dart';

import 'package:energygym/view/screens/mysplashscreen.dart';

import 'package:energygym/widgets/custombutton.dart';
import 'package:energygym/widgets/customcontainer.dart';
import 'package:energygym/widgets/customdivider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CoachProfile extends StatefulWidget {
  const CoachProfile({super.key});

  @override
  State<CoachProfile> createState() => _CoachProfileState();
}

class _CoachProfileState extends State<CoachProfile> {
  readCurrentcoachInformation() async {
    await FirebaseDatabase.instance
        .ref("coach")
        .child(currentFirebaseUser!.uid)
        .once()
        .then((DatabaseEvent snap) {
      if (snap.snapshot.value != null) {
        // coachdata.id = (snap.snapshot.value as Map)["id"];
        coachdata.name = (snap.snapshot.value as Map)["name"];
        coachdata.email = (snap.snapshot.value as Map)["email"];
        coachdata.phone = (snap.snapshot.value as Map)["phone"];
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
        /*  appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
          backgroundColor: Colors.red[900],
          foregroundColor: Colors.white,
          automaticallyImplyLeading: false,
          bottomOpacity: 5,
          elevation: ,
        ),*/
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  //    color: const Color.fromARGB(255, 216, 212, 211),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[500],
                        child: Icon(
                          Icons.person,
                          size: 70,
                        ),
                        minRadius: 70,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //
                    Text(
                      coachdata.name ?? '',
                      style: GoogleFonts.arapey(
                          fontWeight: FontWeight.bold, fontSize: 35),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    CustomButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((BuildContext context) =>
                                    const CoachUpdateData())));
                      },
                      text: 'Edit Profile',
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    const CustomDivider(),
                    GestureDetector(
                      onTap: () {},
                      child: CustomContainer(
                        color: Colors.red[700],
                        height: 50,
                        width: double.infinity,
                        wedgets: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.mail_outlined,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CustomText(
                              text: coachdata.email.toString() ?? '',
                              fontSize: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: CustomContainer(
                        color: Colors.red[700],
                        height: 50,
                        width: double.infinity,
                        wedgets: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.phone_android_outlined,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              CustomText(
                                text: coachdata.phone.toString() ?? '',
                                fontSize: 15,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      onPressed: () {
                        fAuth.signOut();
                        //  Navigator.pop(context);
                        SystemNavigator.pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MySplashScreen()));
                      },
                      text: 'Logout',
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
