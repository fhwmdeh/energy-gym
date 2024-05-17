import 'package:energygym/exersizes/allexersizes.dart';
import 'package:energygym/model/models.dart';
import 'package:energygym/view/auth/registnewtrainee.dart';
import 'package:energygym/view/screens/chatscreen.dart';
import 'package:energygym/widgets/customcontainer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../exersizes/trainerexercises/customexercise.dart';
import '../../exersizes/trainerexercises/trainer_challenges.dart';
import '../screens/add_trainer_challenges.dart';

class TrainerList extends StatefulWidget {
  const TrainerList({super.key});

  @override
  State<TrainerList> createState() => _TrainerListState();
}

class _TrainerListState extends State<TrainerList> {
  Query trainerRef = FirebaseDatabase.instance.ref('trainer');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(
          'Trainer Data',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red[900],
        foregroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewTrainee()));
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              )),
        ],
      ),
      body: SizedBox(
        //  height: double.infinity,
        child: FirebaseAnimatedList(
          query: trainerRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map trainerdata = snapshot.value as Map;
            trainerdata['key'] = snapshot.key;
            return listItem(trainerdata: trainerdata);
          },
        ),
      ),
    );
  }
}

removeFromList() {
  FirebaseDatabase.instance
      .ref('trainer')
      .child(currentFirebaseUser!.uid)
      .remove();
}

Widget listItem({required Map trainerdata}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.red[800],
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.ltr,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    const Text('  '),
                    CustomText(
                      text: trainerdata['name']?.toString() ?? ' not name ',
                      fontSize: 18,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(
                      Icons.male_sharp,
                      color: Colors.grey,
                    ),
                    const Text('  '),
                    CustomText(
                      text: trainerdata['gender']?.toString() ?? 'not gender',
                      fontSize: 18,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      FontAwesomeIcons.weightScale,
                      color: Colors.grey,
                    ),
                    const Text('  '),
                    CustomText(
                      text: trainerdata['aim']?.toString() ?? 'no aim',
                      fontSize: 18,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Start Date :   ',
                      fontSize: 12,
                    ),
                    CustomText(
                      text: trainerdata['startDate'].toString(),
                      fontSize: 12,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'End Date :   ',
                      fontSize: 12,
                    ),
                    CustomText(
                      text: trainerdata['endDate'].toString(),
                      fontSize: 12,
                    ),
                  ],
                ),
              ],
            ),
            PopupMenuButton(
              color: Colors.red[900],
              iconColor: Colors.white,
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: CustomText(text: 'Add Daily Exercises'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CustomExercises()));
                    },
                  ),
                  PopupMenuItem(
                    child: CustomText(text: 'Add Challenges'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AddTrainerChallenges()));
                    },
                  ),
                  PopupMenuItem(
                    child: CustomText(text: 'Start Conversation'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatScreen()));
                    },
                  ),
                  PopupMenuItem(
                    child: CustomText(text: 'Delete Trainer'),
                    onTap: () {
                      FirebaseDatabase.instance
                          .ref('trainer')
                          .child(trainerCurrentFirebaseUser!.uid)
                          .remove();
                    },
                  ),
                ];
              },
            )
          ],
        ),
      ),
    ),
  );
}
