import 'package:firebase_auth/firebase_auth.dart';

class NewCoach {
  String? name;
  String? email;
  String? phone;
  String? password;

  NewCoach({
    this.name,
    this.email,
    this.phone,
    this.password,
  });
}

class TrainerData {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? aim;

  TrainerData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.password,
  });

  TrainerData.fromJsom(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
  }
}

NewCoach coachdata = NewCoach();
TrainerData trainerData = TrainerData();

final FirebaseAuth fAuth = FirebaseAuth.instance;
User? currentFirebaseUser;
User? trainerCurrentFirebaseUser;
