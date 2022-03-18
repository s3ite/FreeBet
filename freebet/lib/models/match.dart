import 'package:flutter/foundation.dart';

class MatchInfo {
  final String sport;
  final String leagueName;
  final String id;
  final String startDate;

  final String homeTeam;
  final String awayTeam;

  double oddHome;
  double oddDraw;
  double oddAway;
  bool isLive;

  MatchInfo(
      {required this.sport,
      required this.leagueName,
      required this.id,
      required this.startDate,
      required this.homeTeam,
      required this.awayTeam,
      required this.oddHome,
      this.oddDraw = 0,
      required this.oddAway,
      this.isLive = false});
}
