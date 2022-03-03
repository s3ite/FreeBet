import 'package:flutter/material.dart';

import '../items/top_bar.dart';

class MatchDetailScreen extends StatelessWidget {
  void goToBalance(BuildContext context) {
    Navigator.of(context).pushNamed('./balance-screen');
  }

  void goToUser(BuildContext context) {
    Navigator.of(context).pushNamed('./user-screen');
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map;

    final sport = routeArgs['sport'];
    final leagueName = routeArgs['leagueName'];
    final id = routeArgs['id'];
    final startDate = routeArgs['startDate'];
    final isLive = routeArgs['isLive'];

    final homeTeam = routeArgs['homeTeam'];
    final awayTeam = routeArgs['awayTeam'];

    final oddHome = routeArgs['oddHome'];
    final oddDraw = routeArgs['oddDraw'];
    final oddAway = routeArgs['oddAway'];

    return Scaffold(
      appBar: TopBar(
        title: Text(
          "Match",
        ),
        appBar: AppBar(),
      ),
      body: Center(
        child: const Text("Coming soon"),
      ),
    );
  }
}
