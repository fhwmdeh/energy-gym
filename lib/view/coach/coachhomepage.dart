//import 'package:energygym/exersizes/fullbodyexersize.dart';
import 'package:energygym/exersizes/allexersizes.dart';
import 'package:energygym/exersizes/challenges/coachchallenges.dart';
import 'package:energygym/model/models.dart';
import 'package:energygym/view/screens/add_coach_challenges.dart';
import 'package:energygym/widgets/custombutton.dart';
import 'package:energygym/widgets/customcontainer.dart';
import 'package:energygym/widgets/notesdialog.dart';
import 'package:energygym/widgets/tipsdialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'package:google_fonts/google_fonts.dart';

//training page
class CoachHomePage extends StatefulWidget {
  const CoachHomePage({super.key});

  @override
  State<CoachHomePage> createState() => _CoachHomePageState();
}

class _CoachHomePageState extends State<CoachHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      //floating action button to add note and tips
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        backgroundColor: Colors.red[900],
        foregroundColor: Colors.white,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        closeDialOnPop: true,
        children: [
          SpeedDialChild(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (val) {
                    return NoteDialog();
                  },
                );
                setState(() {});
              },
              elevation: 5,
              labelBackgroundColor: Colors.blue[700],
              backgroundColor: Colors.blue[700],
              foregroundColor: Colors.white,
              labelStyle: GoogleFonts.aBeeZee(
                fontSize: 17,
                color: Colors.white,
              ),
              child: const Icon(Icons.add_to_photos_rounded),
              label: 'Add Note'),
          // Tips Dialog
          SpeedDialChild(
              elevation: 5,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (val) {
                    return TipsDialog();
                  },
                );

                setState(() {});
              },
              labelBackgroundColor: Colors.green,
              child: const Icon(
                Icons.tips_and_updates,
              ),
              label: 'Add Tips',
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              labelStyle: GoogleFonts.aBeeZee(
                fontSize: 17,
                color: Colors.white,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomContainer(
              color: Colors.red[900],
              width: double.infinity,
              height: 300,
              image: const DecorationImage(
                alignment: Alignment.centerRight,
                fit: BoxFit.contain,
                image: AssetImage(
                  'images/dumble.png',
                ),
              ),
              wedgets: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: 'Hello Coach ',
                    fontSize: 20,
                  ),
                  CustomText(
                    text: 'I Hope You Are Doing Well!',
                    fontSize: 15,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Challenges',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.aBeeZee(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AddCoachChallenges()));
                      },
                      child: CustomContainer(
                          color: Colors.orange[900],
                          width: double.infinity,
                          height: 200,
                          image: const DecorationImage(
                            alignment: Alignment.centerRight,
                            fit: BoxFit.contain,
                            image: AssetImage(
                              'images/coachchallenge.png',
                            ),
                          ),
                          wedgets: Padding(
                            padding: const EdgeInsets.only(top: 50, left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                    text: 'Create a new challenge',
                                    fontSize: 20),
                                CustomText(
                                  text:
                                      'Challenge Yourself To Improve Your power!',
                                  fontSize: 15,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                CustomButton(
                                  onPressed: () {
                                    //nav to exercises page
                                  },
                                  text: 'Create  Challenge Map ',
                                )
                              ],
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Daily Exersizes',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.aBeeZee(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ExerciseItem(),
                            ));
                      },
                      child: CustomContainer(
                        color: Colors.teal[900],
                        gradient: LinearGradient(colors: [
                          Colors.red,
                          Colors.orange,
                        ]),
                        width: double.infinity,
                        height: 200,
                        wedgets: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomText(
                                    text: 'Daily Exersizes', fontSize: 20),
                                const Icon(
                                  Icons.workspace_premium_outlined,
                                  size: 30,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomText(
                              text:
                                  'Add Your Daily Exercises To Improve Your power!',
                              fontSize: 15,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                              onPressed: () {},
                              text: 'Create A Daily Exercises',
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
