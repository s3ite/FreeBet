import 'package:flutter/material.dart';

abstract class MatchDetail {
  final String nameHomeTeam;
  final String nameVisitorTeam;
  final double oddHomeTeam;
  final double oddVisitorTeam;
  final String leagueName;
  final String matchDate;
  final String matchID;
  final Color color;

  MatchDetail(
      this.nameHomeTeam,
      this.nameVisitorTeam,
      this.oddHomeTeam,
      this.oddVisitorTeam,
      this.leagueName,
      this.matchDate,
      this.matchID,
      this.color);
}
