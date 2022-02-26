import 'package:flutter/material.dart';

class MatchDetailScreen extends StatelessWidget {
  final String sport;
  final String leagueName;
  final String id;
  final String startDate;
  final bool isLive;

  final String homeTeam;
  final String awayTeam;

  final double oddHome;
  final double oddDraw;
  final double oddAway;

  MatchDetailScreen({
    required this.sport,
    required this.leagueName,
    required this.id,
    required this.startDate,
    required this.isLive,
    required this.homeTeam,
    required this.awayTeam,
    required this.oddHome,
    required this.oddDraw,
    required this.oddAway,
  });

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
