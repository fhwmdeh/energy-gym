import 'package:energygym/model/models.dart';
import 'package:energygym/widgets/chatbubbles.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key, this.coachName});
  String? coachName;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController sendMessagebutton = TextEditingController();

  sendMessage() {
    DatabaseReference msgRef = FirebaseDatabase.instance.ref('messages');

    DatabaseReference msgList = msgRef.push();

    msgList.set({
      // 'name': coachdata.name.toString(),
      'message': sendMessagebutton.text,
      'createdAt': DateTime.now().toString(),
      // 'trainerName': trainerData.name.toString()
    });
  }

  Query messageQuery = FirebaseDatabase.instance.ref('messages');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red[900],
          foregroundColor: Colors.white,
          centerTitle: true,
          title: Text('Messages')),
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
                query: messageQuery,
                itemBuilder: (context, snapshot, animation, index) {
                  return ChatBubble2(
                    //  nameText: snapshot.child('name').value.toString(),
                    text: snapshot.child('message').value.toString(),
                    dateText:
                        '      ' + snapshot.child('createdAt').value.toString(),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (value) {
                sendMessage();
                sendMessagebutton.clear();
              },
              controller: sendMessagebutton,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    sendMessage();
                    sendMessagebutton.clear();
                  },
                  icon: Icon(
                    Icons.send,
                    color: Colors.red[900],
                  ),
                ),
                hintText: 'Send Message',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
