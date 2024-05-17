import 'package:energygym/widgets/customtextfield.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCoachChallenges extends StatefulWidget {
  const AddCoachChallenges({super.key});

  @override
  State<AddCoachChallenges> createState() => _AddCoachChallengesState();
}

class _AddCoachChallengesState extends State<AddCoachChallenges> {
  TextEditingController coachchallengController = TextEditingController();
  TextEditingController coachexerciseNameController = TextEditingController();
  TextEditingController coachweightController = TextEditingController();
  TextEditingController coachrepsController = TextEditingController();
  TextEditingController coachsetsController = TextEditingController();
  addTrainerChallenge() {
    DatabaseReference coachchallengRef =
        FirebaseDatabase.instance.ref('coachChallenge');
    DatabaseReference newTrainerChallenge = coachchallengRef.push();
    newTrainerChallenge.set({
      'coachexerciseName': coachexerciseNameController.text,
      'coachsets': coachsetsController.text,
      'coachreps': coachrepsController.text,
      'coachweight': coachweightController.text
    });
  }

  cancelAdding(BuildContext context) {
    Navigator.pop(context);
  }

  deleteItem() {
    FirebaseDatabase.instance.ref('coachChallenge').child('').remove();
  }

  Query trainerChalleng = FirebaseDatabase.instance.ref('coachChallenge');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Challenge'),
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
                        controller: coachexerciseNameController,
                        hinttext: 'Exercise Name',
                        keyboardType: TextInputType.text),
                    const SizedBox(
                      height: 3,
                    ),
                    CustomTextField(
                        controller: coachweightController,
                        hinttext: 'Weigh',
                        keyboardType: TextInputType.number),
                    const SizedBox(
                      height: 3,
                    ),
                    CustomTextField(
                        controller: coachrepsController,
                        hinttext: 'Reps',
                        keyboardType: TextInputType.number),
                    const SizedBox(
                      height: 3,
                    ),
                    CustomTextField(
                        controller: coachsetsController,
                        hinttext: 'Sets',
                        keyboardType: TextInputType.number),
                  ],
                ),
                actions: [
                  MaterialButton(
                      onPressed: () {
                        cancelAdding(context);
                        coachsetsController.clear();
                        coachexerciseNameController.clear();
                        coachrepsController.clear();
                        coachweightController.clear();
                      },
                      child: const Text('cancel')),
                  MaterialButton(
                      onPressed: () {
                        addTrainerChallenge();
                        coachsetsController.clear();
                        coachexerciseNameController.clear();
                        coachrepsController.clear();
                        coachweightController.clear();
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
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.red[50], borderRadius: BorderRadius.circular(6)),
            child: ListTile(
                title: Text(
                  snapshot.child('coachexerciseName').value.toString(),
                  style: GoogleFonts.arapey(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Chip(
                          label: Text(
                              '${snapshot.child('coachweight').value.toString()} kg')),
                      Chip(
                          label: Text(
                              '${snapshot.child('coachreps').value.toString()} Reps')),
                      Chip(
                          label: Text(
                              '${snapshot.child('coachsets').value.toString()} sets')),
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
