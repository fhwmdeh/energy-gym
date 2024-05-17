import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import '../../widgets/customcontainer.dart';
import '../screens/chatScreen.dart';

class CoachList extends StatefulWidget {
  CoachList({super.key, required this.coachName});
  String? coachName;
  @override
  State<CoachList> createState() => _CoachListState();
}

class _CoachListState extends State<CoachList> {
  Query coachsRef = FirebaseDatabase.instance.ref("coach");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(
          'Coachs',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red[900],
        foregroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SizedBox(
        //  height: double.infinity,
        child: FirebaseAnimatedList(
          query: coachsRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map coachdata = snapshot.value as Map;
            coachdata['key'] = snapshot.key;
            return listItem(coachdata: coachdata);
          },
        ),
      ),
    );
  }
}

Widget listItem({required Map coachdata}) {
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
                      color: Colors.white,
                    ),
                    const Text('  '),
                    CustomText(
                      text: coachdata['name']?.toString() ?? ' not name ',
                      fontSize: 18,
                    ),
                  ],
                ),
              ],
            ),
            PopupMenuButton(
              color: Colors.white,
              iconColor: Colors.white,
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: const Text(
                      'Start Conversation',
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ChatScreen(coachName: coachdata['name']),
                        ),
                      );
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
