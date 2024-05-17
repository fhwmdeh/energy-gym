import 'package:energygym/model/exercises_model.dart';

import 'package:flutter/material.dart';

import '../model/workout_model.dart';

// we defined it out of the class to reach the data

class AppInfo extends ChangeNotifier {
  /* WORKOUT DATA STRUCTURE

   THIS OVERALL LIST CONTAINS THE DIFFRENTS WORKOUT 
   EACH WORKOUT HAS A NAME AND EXERCISES LIST 

   */
  List<Workout> workoutList = [
    Workout(
      workoutName: 'Abs',
      exercise: [Exercises(name: 'chest', weight: '10', reps: '7', sets: '4')],
    )
  ];
//get the list of workout
  List<Workout> getWorkoutList() {
    return workoutList;
  }

  int numberOfExercisesInWorkout(String workoutName) {
    Workout releventWorkout = getReleventWorkout(workoutName);
    return releventWorkout.exercise.length;
  }
  // add workout name

  void addWorkout(String workoutname) {
    //add new workout with blank exercises of list
    workoutList.add(Workout(workoutName: workoutname, exercise: []));
    notifyListeners();
  }

  //add exercises to workout

  void addExercisesToWorkout(String workoutName, String exerciseName,
      String weight, String reps, String sets) {
    Workout releventWorkout =
        workoutList.firstWhere((workout) => workout.workoutName == workoutName);
    releventWorkout.exercise.add(
      Exercises(name: exerciseName, weight: weight, reps: reps, sets: sets),
    );
    notifyListeners();
  }
  //check off exercises

  void checkOffEcercises(String workoutName, String exercisName) {
    // find the relevent workout and relevent exercise in the workout
    Exercises releventExercises =
        getReleventExercises(workoutName, exercisName);

    // check off boolean to show if user completed the exercise
    releventExercises.isCompleted = !releventExercises.isCompleted;
    notifyListeners();
  }

//get lenght of given workout

//return relevent workout object , given workout name

// return relevent exercises object , given a workout name + exercise name
  Exercises getReleventExercises(String workoutName, String exercisesName) {
    //find relevent workout first
    Workout releventWorkout = getReleventWorkout(workoutName);

    //find the relevent exercise in that workout
    Exercises releventExercises = releventWorkout.exercise
        .firstWhere((exercises) => exercises.name == exercisesName);

    return releventExercises;
  }

  Workout getReleventWorkout(String workoutName) {
    Workout releventWorkout =
        workoutList.firstWhere((workout) => workout.workoutName == workoutName);
    return releventWorkout;
  }
}
