import 'package:flutter/material.dart';

import '../items/match_item.dart';
import '../sample_data.dart';
import './balance_screen.dart';
import './user_screen.dart';
import './live_screen.dart';
import './result_screen.dart';
import './selection_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final screens = [];

  void goToBalance(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return BalanceScreen();
        },
      ),
    );
  }

  void goToUser(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return UserScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 0, 0, 1),
        centerTitle: true,
        title: const Text(
          "Freebet",
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
          ),
          onPressed: () {
            /*DropdownButton*/
          },
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () => goToBalance(context),
              child: Icon(
                Icons.attach_money,
                size: 26.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () => goToUser(context),
              child: Icon(Icons.account_circle_outlined),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: TestData.map(
            (matchData) => MatchItem(
              awayTeam: matchData.awayTeam,
              homeTeam: matchData.homeTeam,
              id: matchData.id,
              isLive: matchData.isLive,
              leagueName: matchData.leagueName,
              oddAway: matchData.oddAway,
              oddDraw: matchData.oddDraw,
              oddHome: matchData.oddHome,
              sport: matchData.sport,
              startDate: matchData.startDate,
            ),
          ).toList(),
        ),
      ),
      backgroundColor: Colors.black,
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
