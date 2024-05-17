import 'package:energygym/widgets/customcontainer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomExerciseView extends StatefulWidget {
  const CustomExerciseView({super.key});

  @override
  State<CustomExerciseView> createState() => _CustomExerciseViewState();
}

Query trainerexercise = FirebaseDatabase.instance.ref('TrainerExercise');

class _CustomExerciseViewState extends State<CustomExerciseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        foregroundColor: Colors.white,
        centerTitle: true,
        title: CustomText(text: 'My Exercises'),
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
                      FirebaseDatabase.instance.ref('TrainerExercise').remove();
                    });
                  },
                  icon: const Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                )),
          );
        },
      ),
    );
  }
}
