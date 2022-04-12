import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

  Color colorOddHome;
  Color colorOddAway;
  Color colorOddDraw;

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
      this.isLive = false,
      this.colorOddHome = Colors.grey,
      this.colorOddAway = Colors.grey,
      this.colorOddDraw = Colors.grey});
}
