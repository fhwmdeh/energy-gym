import 'package:energygym/model/models.dart';
import 'package:energygym/widgets/customcontainer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyNotes extends StatefulWidget {
  const MyNotes({super.key});

  @override
  State<MyNotes> createState() => _MyNotesState();
}

class _MyNotesState extends State<MyNotes> {
  Query noteRef = FirebaseDatabase.instance
      .ref('coach')
      .child(currentFirebaseUser!.uid)
      .child('notes');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        foregroundColor: Colors.red[900],
        backgroundColor: Colors.red[50],
        title: const Text('My Notes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Column(
          children: [
            Expanded(
              child: FirebaseAnimatedList(
                query: noteRef,
                itemBuilder: (context, snapshot, animation, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      padding:
                          const EdgeInsets.only(top: 16, left: 16, bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            child: ListTile(

                                // title: CustomText(text: 'First Note', fontSize: 25),
                                subtitle: CustomText(
                                  text: snapshot.child('note').value.toString(),
                                  fontSize: 15,
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    FirebaseDatabase.instance
                                        .ref('coach')
                                        .child(currentFirebaseUser!.uid)
                                        .child('notes')
                                        .child('')
                                        .remove();
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.trash,
                                    color: Colors.red[900],
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: CustomText(
                              text: snapshot.child('noteDate').value.toString(),
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
