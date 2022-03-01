import 'package:flutter/material.dart';

import '../items/match_item.dart';
import '../sample_data.dart';
import './balance_screen.dart';
import './user_screen.dart';
import './live_screen.dart';
import './result_screen.dart';
import './selection_screen.dart';
import './home_screen.dart';

class ScreenManager extends StatefulWidget {
  @override
  State<ScreenManager> createState() => _ScreenManagerState();
}

class _ScreenManagerState extends State<ScreenManager> {
  int currentIndex = 0;
  final screens = [
    HomeScreen(),
    LiveScreen(),
    ResultScreen(),
    SelectionScreen()
  ];

  void goToBalance(BuildContext context) {
    Navigator.of(context).pushNamed('./balance-screen');
  }

  void goToUser(BuildContext context) {
    Navigator.of(context).pushNamed('./user-screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer),
              label: 'Home',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.live_tv),
              label: 'Live',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_sharp),
              label: 'Result',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.checklist_rtl_sharp),
              label: 'Selection',
              backgroundColor: Colors.black)
        ],
      ),
    );
  }
}
