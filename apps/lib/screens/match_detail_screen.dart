import 'package:flutter/material.dart';

class MatchDetailScreen extends StatelessWidget {
  final String nameHomeTeam;
  final String nameVisitorTeam;
  final double oddHomeTeam;
  final double oddVisitorTeam;
  final String leagueName;
  final String matchDate;
  final String matchID;

  MatchDetailScreen(
    this.nameHomeTeam,
    this.nameVisitorTeam,
    this.oddHomeTeam,
    this.oddVisitorTeam,
    this.leagueName,
    this.matchDate,
    this.matchID,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail du match")),
      body: Center(
        child: const Text("Coming soon"),
      ),
    );
  }
}
