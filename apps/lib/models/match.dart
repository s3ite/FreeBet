import 'package:flutter/material.dart';

class MatchInfo {
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

  MatchInfo({
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
}
