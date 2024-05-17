import 'package:flutter/material.dart';
import 'exercises_list_model.dart';

class ExercisesPageModel extends ChangeNotifier {
  // the private field backing exersiselist
  late ExercisesListModel _exercisesList;
// internal , private state of the exercisePAge  store the id of each exerciseItems
  List<int> _exercisesItemIDs = [];
  ExercisesListModel get exercisesList => _exercisesList;

  set exercisesList(ExercisesListModel newList) {
    _exercisesList = newList;
    //notify listener in case a new exercise provides information different from the previouse one
    notifyListeners();
  }

// list og exercises items in exercises page
  List<ExercisesItem> get exercisesItems =>
      _exercisesItemIDs.map((id) => exercisesList.getById(id)).toList();

//  add exercises items to exercises  this is the only way to modify the exercises page from outside
  void add(ExercisesItem exercisesItem) {
    _exercisesItemIDs.add(exercisesItem.id);
    //this line tell model that it should rebuild the widget that depends on it
    notifyListeners();
  }

// remove exercis
  void remove(ExercisesItem exercisesItem) {
    _exercisesItemIDs.remove(exercisesItem.id);
    notifyListeners();
  }
}
