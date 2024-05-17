import 'package:energygym/widgets/customcontainer.dart';
import 'package:energygym/widgets/customtextfield.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomExercises extends StatefulWidget {
  const CustomExercises({super.key});

  @override
  State<CustomExercises> createState() => _CustomExercisesState();
}

TextEditingController coachchallengController = TextEditingController();
TextEditingController trainerexerciseNameController = TextEditingController();
TextEditingController trainerweightController = TextEditingController();
TextEditingController trainerrepsController = TextEditingController();
TextEditingController trainersetsController = TextEditingController();

creatNewTrainerExercise() {
  DatabaseReference trainerexerciseRef =
      FirebaseDatabase.instance.ref('TrainerExercise');
  DatabaseReference newTrainerChallenge = trainerexerciseRef.push();
  newTrainerChallenge.set({
    'trainerexerciseName': trainerexerciseNameController.text,
    'trainersets': trainersetsController.text,
    'trainerreps': trainerrepsController.text,
    'trainerweight': trainerweightController.text
  });
}

cancelAdding(BuildContext context) {
  Navigator.pop(context);
}

deleteItem() {
  FirebaseDatabase.instance.ref('TrainerExercise').child('').remove();
}

Query trainerexercise = FirebaseDatabase.instance.ref('TrainerExercise');

class _CustomExercisesState extends State<CustomExercises> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        foregroundColor: Colors.white,
        title: CustomText(text: 'Add Exercise'),
        automaticallyImplyLeading: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[900],
        child: Icon(Icons.add),
        foregroundColor: Colors.white,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  'Add Challenge',
                  style: GoogleFonts.abel(fontWeight: FontWeight.bold),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //challenge name
                    CustomTextField(
                        controller: trainerexerciseNameController,
                        hinttext: 'Exercise Name',
                        keyboardType: TextInputType.text),
                    const SizedBox(
                      height: 3,
                    ),
                    CustomTextField(
                        controller: trainerweightController,
                        hinttext: 'Weigh',
                        keyboardType: TextInputType.number),
                    const SizedBox(
                      height: 3,
                    ),
                    CustomTextField(
                        controller: trainerrepsController,
                        hinttext: 'Reps',
                        keyboardType: TextInputType.number),
                    const SizedBox(
                      height: 3,
                    ),
                    CustomTextField(
                        controller: trainersetsController,
                        hinttext: 'Sets',
                        keyboardType: TextInputType.number),
                  ],
                ),
                actions: [
                  MaterialButton(
                      onPressed: () {
                        cancelAdding(context);
                        trainersetsController.clear();
                        trainerexerciseNameController.clear();
                        trainerrepsController.clear();
                        trainerweightController.clear();
                      },
                      child: const Text('cancel')),
                  MaterialButton(
                      onPressed: () {
                        creatNewTrainerExercise();
                        trainersetsController.clear();
                        trainerexerciseNameController.clear();
                        trainerrepsController.clear();
                        trainerweightController.clear();
                        Navigator.pop(context);
                      },
                      child: const Text('Save')),
                ],
              );
            },
          );
        },
      ),
      body: FirebaseAnimatedList(
        query: trainerexercise,
        itemBuilder: (context, snapshot, animation, index) {
          return Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.red[50], borderRadius: BorderRadius.circular(6)),
            child: ListTile(
                title: Text(
                  snapshot.child('trainerexerciseName').value.toString(),
                  style: GoogleFonts.arapey(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Chip(
                          label: Text(
                              '${snapshot.child('trainerweight').value.toString()} kg')),
                      Chip(
                          label: Text(
                              '${snapshot.child('trainerreps').value.toString()} Reps')),
                      Chip(
                          label: Text(
                              '${snapshot.child('trainersets').value.toString()} sets')),
                    ]),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      deleteItem();
                    });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                )),
          );
        },
      ),
    );
  }
}
