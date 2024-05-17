import 'package:energygym/widgets/customcontainer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TrainerTipsPage extends StatefulWidget {
  const TrainerTipsPage({super.key});

  @override
  State<TrainerTipsPage> createState() => _TrainerTipsPageState();
}

class _TrainerTipsPageState extends State<TrainerTipsPage> {
  Query tipsRef = FirebaseDatabase.instance.ref('tips');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.red[900],
        title: const Text('Tips'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: FirebaseAnimatedList(
                query: tipsRef,
                itemBuilder: (context, snapshot, animation, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding:
                          const EdgeInsets.only(top: 16, left: 16, bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.red[900],
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            child: ListTile(

                              title: CustomText(
                                  text: snapshot
                                      .child('TipTitle')
                                      .value
                                      .toString(),
                                  fontSize: 20),

                              subtitle: CustomText(
                                text: snapshot
                                    .child('TipDiscreption')
                                    .value
                                    .toString(),
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: CustomText(
                              text: snapshot.child('tipsDate').value.toString(),
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
