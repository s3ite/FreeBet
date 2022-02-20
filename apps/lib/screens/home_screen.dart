import 'package:flutter/material.dart';

import '../items/match_item.dart';
import '../sample_data.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome in Freebet"),
      ),
      body: Column(
        children: TestData.map(
          (matchData) => MatchItem(
              matchData.nameHomeTeam,
              matchData.nameVisitorTeam,
              matchData.oddHomeTeam,
              matchData.oddVisitorTeam,
              matchData.leagueName,
              matchData.matchDate,
              matchData.matchID,
              matchData.color),
        ).toList(),
      ),
    );
  }
}
