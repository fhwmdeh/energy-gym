import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../consts/AppInfo.dart';
import '../../widgets/customtextfield.dart';

class ChallengeExercises extends StatefulWidget {
  const ChallengeExercises({super.key, required this.workoutName});
  final String workoutName;

  @override
  State<ChallengeExercises> createState() => _ChallengeExercisesState();
}

TextEditingController exerciseNameController = TextEditingController();
TextEditingController weightController = TextEditingController();
TextEditingController repsController = TextEditingController();
TextEditingController setsController = TextEditingController();

class _ChallengeExercisesState extends State<ChallengeExercises> {
  //check Box Tapped
  void onCheckedBox(String workoutName, String exercisName) {
    Provider.of<AppInfo>(context, listen: false)
        .checkOffEcercises(workoutName, exercisName);
  }

//create a new Exercise
  void creatNewExercise() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.grey[200],
              actionsAlignment: MainAxisAlignment.center,
              alignment: Alignment.center,
              elevation: 5,
              title: Text(
                'Add New Exercise',
                style: GoogleFonts.abel(fontWeight: FontWeight.bold),
              ),
              titlePadding: const EdgeInsets.only(top: 15, left: 70),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //challenge name
                  CustomTextField(
                      controller: exerciseNameController,
                      hinttext: 'Exercise Name',
                      keyboardType: TextInputType.text),
                  const SizedBox(
                    height: 3,
                  ),
                  CustomTextField(
                      controller: weightController,
                      hinttext: 'Weigh',
                      keyboardType: TextInputType.text),
                  const SizedBox(
                    height: 3,
                  ),
                  CustomTextField(
                      controller: repsController,
                      hinttext: 'Reps',
                      keyboardType: TextInputType.text),
                  const SizedBox(
                    height: 3,
                  ),
                  CustomTextField(
                      controller: setsController,
                      hinttext: 'Sets',
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
  String exerciseName = exerciseNameController.text;
  String weight = weightController.text;
  String reps = repsController.text;
  String sets = setsController.text;
  void save(BuildContext context) {
    Provider.of<AppInfo>(context, listen: false).addExercisesToWorkout(
        widget.workoutName, exerciseName, weight, reps, sets);
    exerciseNameController.clear();
    weightController.clear();
    repsController.clear();
    setsController.clear();
    Navigator.pop(context);
  }

// Cancel SAving Challenge Name Method

  void cancel(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppInfo>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          foregroundColor: Colors.white,
          centerTitle: true,
          title: Text(widget.workoutName),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => creatNewExercise(),
          backgroundColor: Colors.red[900],
          child: const Icon(
            FontAwesomeIcons.plus,
            color: Colors.white,
            size: 20,
          ),
        ),
        body: ListView.builder(
          itemCount: value.numberOfExercisesInWorkout(widget.workoutName),
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.red[50],
            ),
            child: ListTile(
              title: Text(
                value
                    .getReleventWorkout(widget.workoutName)
                    .exercise[index]
                    .name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //weight
                  Chip(
                    label: Text(
                        '${value.getReleventWorkout(widget.workoutName).exercise[index].weight.toString()} Kg'),
                    backgroundColor: Colors.red[50],
                  ),
                  //reps
                  Chip(
                    label: Text(
                        '${value.getReleventWorkout(widget.workoutName).exercise[index].reps.toString()} Reps'),
                    backgroundColor: Colors.red[50],
                  ),
                  //sets
                  Chip(
                    label: Text(
                        '${value.getReleventWorkout(widget.workoutName).exercise[index].sets.toString()} Sets'),
                    backgroundColor: Colors.red[50],
                  ),
                ],
              ),
              trailing: Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.green[600],
                  value: value
                      .getReleventWorkout(widget.workoutName)
                      .exercise[index]
                      .isCompleted,
                  onChanged: (val) => onCheckedBox(
                      widget.workoutName,
                      value
                          .getReleventWorkout(widget.workoutName)
                          .exercise[index]
                          .name)),
            ),
          ),
        ),
      ),
    );
  }
}
