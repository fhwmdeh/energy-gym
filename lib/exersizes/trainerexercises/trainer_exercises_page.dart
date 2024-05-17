import 'package:energygym/model/exercise_page_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Exercise Page'),
        backgroundColor: Colors.red[900],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: const Column(
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(8),
              child: _execisesPageList(),
            )),
          ],
        ),
      ),
    );
  }
}

class _execisesPageList extends StatelessWidget {
  const _execisesPageList({super.key});

  @override
  Widget build(BuildContext context) {
    var exercisePage = context.watch<ExercisesPageModel>();
    return ListView.builder(
      itemCount: exercisePage.exercisesItems.length,
      itemBuilder: (context, index) => ListTile(
        leading: Image.asset(exercisePage.exercisesItems[index].image,
            height: 70, width: 70),
        title: Text(
          exercisePage.exercisesItems[index].name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        subtitle: Text(
          exercisePage.exercisesItems[index].subTitle,
          style: TextStyle(color: Colors.grey[800], fontSize: 13),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.green,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
