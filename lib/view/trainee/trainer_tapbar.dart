import 'package:energygym/model/models.dart';
import 'package:energygym/view/trainee/trainermainscreen.dart';
import 'package:energygym/view/trainee/trainerprofilescreen.dart';
import 'package:energygym/view/trainee/trainertips.dart';
import 'package:flutter/material.dart';

import 'coachs_pages.dart';

class TrainerTabbar extends StatefulWidget {
  const TrainerTabbar({super.key});

  @override
  State<TrainerTabbar> createState() => _TrainerTabbarState();
}

class _TrainerTabbarState extends State<TrainerTabbar>
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
          children: [
            TrainerMainScreen(),
            CoachList(coachName: coachdata.name),
            TrainerTipsPage(),
            TrainerProfileScreen(),
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
                  icon: Icon(Icons.track_changes_outlined),
                  label: 'main screen'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people_alt_outlined), label: 'coachs'),
              BottomNavigationBarItem(icon: Icon(Icons.message), label: 'tips'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ]),
      ),
    );
  }
}
