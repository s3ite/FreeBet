import 'package:flutter/material.dart';

class MatchInfo {
  final String nameHomeTeam;
  final String nameVisitorTeam;

  final double oddHomeTeam;
  final double oddVisitorTeam;

  final String leagueName;
  final String matchDate;
  final String matchID;

  final Color color;

  const MatchInfo({
    required this.nameHomeTeam,
    required this.nameVisitorTeam,
    required this.oddHomeTeam,
    required this.oddVisitorTeam,
    required this.leagueName,
    required this.matchDate,
    required this.matchID,
    this.color = Colors.white,
  });
}
