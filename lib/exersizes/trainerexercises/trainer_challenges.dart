import 'package:energygym/widgets/customcontainer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrainerChallenges extends StatefulWidget {
  const TrainerChallenges({super.key});

  @override
  State<TrainerChallenges> createState() => _TrainerChallengesState();
}

Query trainerChalleng = FirebaseDatabase.instance.ref('trainerChallenge');
void Function(bool?)? onChanged;
bool? value = false;

class _TrainerChallengesState extends State<TrainerChallenges> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'Challenge Page'),
        backgroundColor: Colors.red[900],
        foregroundColor: Colors.white,
        centerTitle: true,
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
            ),
          );
        },
      ),
    );
  }
}
