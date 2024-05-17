import 'package:energygym/exersizes/allexersizes.dart';
import 'package:energygym/exersizes/challenge1.dart';
import 'package:energygym/exersizes/trainerexercises/customexercisesview.dart';
import 'package:energygym/exersizes/trainerexercises/trainer_exercises_page.dart';
import 'package:energygym/model/models.dart';
import 'package:energygym/widgets/customcontainer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../exersizes/trainerexercises/trainer_challenges.dart';

class TrainerMainScreen extends StatefulWidget {
  const TrainerMainScreen({super.key});

  @override
  State<TrainerMainScreen> createState() => _TrainerMainScreenState();
}

class _TrainerMainScreenState extends State<TrainerMainScreen> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomContainer(
                color: Colors.white,
                image: const DecorationImage(
                  image: AssetImage('images/trainerdashboard.png'),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  colorFilter: ColorFilter.linearToSrgbGamma(),
                  opacity: 0.5,
                ),
                height: 300,
                width: double.infinity,
                wedgets: Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello ',
                          style: GoogleFonts.arapey(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'I Hope You Enjoy Your Day',
                          style: GoogleFonts.arapey(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Please Check Your Exercises Page',
                          style: GoogleFonts.arapey(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        /*    Text(
                          '{$date}',
                          style: GoogleFonts.arapey(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 15),
                        ),*/
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'App Exercises',
                          style: GoogleFonts.arapey(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ExerciseItem()));
                          },
                          child: CustomContainer(
                              color: Colors.red[50],
                              height: 100,
                              image: const DecorationImage(
                                  image: AssetImage('images/fullbodyhome.png'),
                                  fit: BoxFit.fitHeight,
                                  alignment: Alignment.centerRight),
                              wedgets: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'App Exercises ',
                                        style: GoogleFonts.arapey(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        ' You Can Choose Your Exercises ',
                                        style: GoogleFonts.arapey(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Exercises',
                          style: GoogleFonts.arapey(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((BuildContext context) =>
                                        const CustomExerciseView())));
                          },
                          child: CustomContainer(
                            color: const Color(0xffDFD1D9),
                            width: double.infinity,
                            height: 120,
                            image: const DecorationImage(
                                image: AssetImage('images/home.png'),
                                fit: BoxFit.fitHeight,
                                alignment: Alignment.centerRight),
                            wedgets: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'My Exercises',
                                      style: GoogleFonts.arapey(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      ' Start Your Exercises with your Coach',
                                      style: GoogleFonts.arapey(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Icon(
                                  Icons.navigate_next_rounded,
                                  color: Colors.white,
                                  size: 45,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Challenges',
                          style: GoogleFonts.arapey(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((BuildContext context) =>
                                      const TrainerChallenges()))),
                          child: CustomContainer(
                            color: const Color(0xffFFEBEE),
                            width: double.infinity,
                            height: 120,
                            image: const DecorationImage(
                                image: AssetImage('images/fullbodyhome.png'),
                                fit: BoxFit.fitHeight,
                                alignment: Alignment.centerRight),
                            wedgets: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'My Challenges',
                                      style: GoogleFonts.arapey(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      '  By This Challenges You Will Improve Your Strenght',
                                      style: GoogleFonts.arapey(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Icon(
                                  Icons.navigate_next_rounded,
                                  color: Colors.white,
                                  size: 45,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'App Challenges',
                          style: GoogleFonts.arapey(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((BuildContext context) =>
                                        const ChallengeOne())));
                          },
                          child: CustomContainer(
                            color: const Color(0xFFFFFFFF),
                            height: 150,
                            width: double.infinity,
                            wedgets: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  ' Challenges 14*3',
                                  style: GoogleFonts.arapey(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                CustomText(
                                  text:
                                      '  By This Challenges You Will Improve Your Strenght',
                                  fontSize: 12,
                                ),
                              ],
                            ),
                            image: const DecorationImage(
                                image: AssetImage('images/challenge1.jpg'),
                                fit: BoxFit.cover,
                                opacity: 1.5,
                                colorFilter: ColorFilter.srgbToLinearGamma()),
                          ),
                        )
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
