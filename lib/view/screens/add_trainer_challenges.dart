import 'dart:ffi';

import 'package:energygym/widgets/customtextfield.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTrainerChallenges extends StatefulWidget {
  const AddTrainerChallenges({super.key});

  @override
  State<AddTrainerChallenges> createState() => _AddTrainerChallengesState();
}

TextEditingController trainerchallengController = TextEditingController();
TextEditingController trainerexerciseNameController = TextEditingController();
TextEditingController trainerweightController = TextEditingController();
TextEditingController trainerrepsController = TextEditingController();
TextEditingController trainersetsController = TextEditingController();
addTrainerChallenge() {
  DatabaseReference challengRef =
      FirebaseDatabase.instance.ref('trainerChallenge');
  DatabaseReference newTrainerChallenge = challengRef.push();
  newTrainerChallenge.set({
    'exerciseName': trainerexerciseNameController.text,
    'sets': trainersetsController.text,
    'reps': trainerrepsController.text,
    'weight': trainerweightController.text
  });
}

cancelAdding(BuildContext context) {
  Navigator.pop(context);
}

Query trainerChalleng = FirebaseDatabase.instance.ref('trainerChallenge');
deleteItem() {
  FirebaseDatabase.instance.ref('trainerChallenge').remove();
}

class _AddTrainerChallengesState extends State<AddTrainerChallenges> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Trainer Challenge'),
        centerTitle: true,
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
                        addTrainerChallenge();
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
        query: trainerChalleng,
        itemBuilder: (context, snapshot, animation, index) {
          return Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.red[50], borderRadius: BorderRadius.circular(6)),
            child: ListTile(
                title: Text(
                  snapshot.child('exerciseName').value.toString(),
                  style: GoogleFonts.arapey(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Chip(
                          label: Text(
                              '${snapshot.child('weight').value.toString()} kg')),
                      Chip(
                          label: Text(
                              '${snapshot.child('reps').value.toString()} Reps')),
                      Chip(
                          label: Text(
                              '${snapshot.child('sets').value.toString()} sets')),
                    ]),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      deleteItem();
                    });
                  },
                  icon: Icon(
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
