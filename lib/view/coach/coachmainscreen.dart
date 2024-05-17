import 'package:energygym/view/coach/coachhomepage.dart';
import 'package:energygym/view/coach/coachnotescreen.dart';
import 'package:energygym/view/coach/coachprofile.dart';
import 'package:energygym/view/coach/traineepage.dart';
import 'package:flutter/material.dart';

//nav bar screen

class CoachMainScreen extends StatefulWidget {
  const CoachMainScreen({super.key});

  @override
  State<CoachMainScreen> createState() => _CoachMainScreenState();
}

class _CoachMainScreenState extends State<CoachMainScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int selectedIndex = 0;

  onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      _tabController!.index = selectedIndex;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: const [
            CoachHomePage(),
            TrainerList(),
            MyNotes(),
            CoachProfile(),
          ]),
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.red[900],
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: BottomNavigationBar(
            backgroundColor: Colors.grey[400],
            selectedItemColor: Colors.red[900],
            unselectedItemColor: Colors.black,
            elevation: 30,
            showSelectedLabels: false,
            iconSize: 25,
            currentIndex: selectedIndex,
            onTap: onItemClicked,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.track_changes_outlined), label: 'Training'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people_alt_outlined), label: 'trainers'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), label: 'Notes'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ]),
      ),
    );
  }
}
