import 'package:energygym/exersizes/trainerexercises/trainer_exercises_page.dart';
import 'package:energygym/model/exercise_page_model.dart';
import 'package:energygym/model/exercises_list_model.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class ExerciseItem extends StatelessWidget {
  const ExerciseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Exercises'),
            centerTitle: true,
            foregroundColor: Colors.white,
            backgroundColor: Colors.red[900],
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ExercisePage()));
                  },
                  icon: Icon(Icons.add))
            ],
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 12,
            ),
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return _exersiseList(
              index: index,
            );
          }, childCount: 30))
        ],
      ),
    );
  }
}

class _exersiseList extends StatelessWidget {
  const _exersiseList({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    var exerciseItem = context.select<ExercisesListModel, ExercisesItem>(
      (exerciseList) => exerciseList.getPsition(index),
    );
    return Padding(
      padding: EdgeInsets.all(8),
      child: LimitedBox(
        maxHeight: 60,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 3,
              child: Image(
                image: AssetImage(exerciseItem.image),
                height: 70,
                width: 50,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exerciseItem.name,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  exerciseItem.subTitle,
                  style: TextStyle(fontSize: 12, color: Colors.grey[300]),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            )),
            _AddButton(
              exercisesItems: exerciseItem,
            ),
          ],
        ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton({super.key, required this.exercisesItems});
  final ExercisesItem exercisesItems;
  @override
  Widget build(BuildContext context) {
    var isInExercisePage = context.select<ExercisesPageModel, bool>(
      (exercisePage) => exercisePage.exercisesItems.contains(exercisesItems),
    );
    return IconButton(
        onPressed: isInExercisePage
            ? () {
                var exercisePage = context.read<ExercisesPageModel>();
                exercisePage.remove(exercisesItems);
              }
            : () {
                var exercisePage = context.read<ExercisesPageModel>();
                exercisePage.add(exercisesItems);
              },
        icon: isInExercisePage
            ? Icon(
                Icons.add,
                color: Colors.red,
              )
            : Icon(
                Icons.add,
                color: Colors.green,
              ));
  }
}
