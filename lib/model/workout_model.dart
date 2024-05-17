import 'package:energygym/model/exercises_model.dart';

class Workout {
  final String workoutName;
  final List<Exercises> exercise;

  Workout({required this.workoutName, required this.exercise});
}
