import 'package:energygym/consts/AppInfo.dart';
import 'package:energygym/widgets/customcontainer.dart';
import 'package:energygym/widgets/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'chellenge_exercises.dart';

class ChallengesPage extends StatefulWidget {
  const ChallengesPage({super.key});

  @override
  State<ChallengesPage> createState() => _ChallengesPageState();
}

TextEditingController challengeTextEditingController = TextEditingController();

class _ChallengesPageState extends State<ChallengesPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppInfo>(
        builder: (context, value, child) => Scaffold(
              backgroundColor: Colors.grey[300],
              appBar: AppBar(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red[900],
                centerTitle: true,
                title: CustomText(text: 'Challenges'),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  addChallenge(context);
                },
                backgroundColor: Colors.red[900],
                child: const Icon(
                  FontAwesomeIcons.plus,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              body: ListView.builder(
                itemCount: value.getWorkoutList().length,
                itemBuilder: ((context, index) => ListTile(
                      title: Text(value.getWorkoutList()[index].workoutName),
                      trailing: IconButton(
                          onPressed: () {
                            goToChallengeExercise(context,
                                value.getWorkoutList()[index].workoutName);
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.red[900],
                          )),
                    )),
              ),
            ));
  }
}

// method to go to new page

void goToChallengeExercise(BuildContext context, String workoutName) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ChallengeExercises(
                workoutName: workoutName,
              )));
}

// method to  add challenge name

void addChallenge(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: Colors.grey[200],
            actionsAlignment: MainAxisAlignment.center,
            alignment: Alignment.center,
            elevation: 5,
            title: Text(
              'Add Challenge',
              style: GoogleFonts.abel(),
            ),
            titlePadding: EdgeInsets.only(top: 15, left: 70),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //challenge name
                CustomTextField(
                    controller: challengeTextEditingController,
                    hinttext: 'Muscle Name',
                    keyboardType: TextInputType.text),
              ],
            ),
            actions: [
              MaterialButton(
                onPressed: () {
                  save(context);
                },
                child: const Text('Save'),
              ),
              MaterialButton(
                onPressed: () {
                  cancel(context);
                },
                child: const Text('Cancel'),
              )
            ],
          ));
}

//Save Challeng /name Method

void save(BuildContext context) {
  Provider.of<AppInfo>(context, listen: false)
      .addWorkout(challengeTextEditingController.text);
  challengeTextEditingController.clear();
  Navigator.pop(context);
}

// Cancel SAving Challenge Name Method

void cancel(BuildContext context) {
  Navigator.pop(context);
}
