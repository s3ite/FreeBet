import 'package:flutter/material.dart';

import '../items/match_item.dart';
import '../sample_data.dart';
import './balance_screen.dart';
import './user_screen.dart';
import './live_screen.dart';
import './result_screen.dart';
import './selection_screen.dart';

import '../items/top_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: const Text(
          "Freebet",
        ),
        appBar: AppBar(),
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
    );
  }
}
