import 'package:energygym/model/models.dart';
import 'package:energygym/widgets/custombutton.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteDialog extends StatefulWidget {
  NoteDialog({super.key});

  @override
  State<NoteDialog> createState() => _NoteDialogState();
}

TextEditingController noteTextEditingController = TextEditingController();

saveNote() {
  DatabaseReference notelistRef = FirebaseDatabase.instance
      .ref('coach')
      .child(currentFirebaseUser!.uid)
      .child('notes');
  DatabaseReference newNoteRef = notelistRef.push();

  newNoteRef.set({
    'note': noteTextEditingController.text,
    'noteDate': DateTime.now().toString()
  });
}

class _NoteDialogState extends State<NoteDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey[300],
      child: Container(
        height: 300,
        width: double.infinity,
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Add Note',
                  style: GoogleFonts.aDLaMDisplay(color: Colors.red),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: noteTextEditingController,

                  // minLines: 2,
                  decoration: InputDecoration(
                      // hintMaxLines: 5,
                      fillColor: Colors.amber[50],
                      label: Text(
                        'Note Discription',
                        style: GoogleFonts.aBeeZee(color: Colors.red),
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  onPressed: () {
                    setState(() {
                      saveNote();
                      noteTextEditingController.clear();
                      Navigator.pop(context, 'Note Added');
                    });
                  },
                  text: 'Add Note',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
