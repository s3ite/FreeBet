import 'package:flutter/material.dart';

import '../items/match_item.dart';
import '../sample_data.dart';
import './balance_screen.dart';
import './user_screen.dart';
import './live_screen.dart';
import './result_screen.dart';
import './selection_screen.dart';

class LiveScreen extends StatefulWidget {
  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  void goToBalance(BuildContext context) {
    Navigator.of(context).pushNamed('./balance-screen');
  }

  void goToUser(BuildContext context) {
    Navigator.of(context).pushNamed('./user-screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 0, 0, 1),
        title: const Text(
          "Live",
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
    );
  }
}
