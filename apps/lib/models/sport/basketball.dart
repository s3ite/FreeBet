import 'package:flutter/material.dart';

import 'match.dart';

class Basketball extends MatchInfo {
  Basketball({
    required String nameHomeTeam,
    required String nameVisitorTeam,
    required double oddHomeTeam,
    required double oddVisitorTeam,
    required String leagueName,
    required String matchDate,
    required String matchID,
    required Color color,
  }) : super(
            nameHomeTeam: nameHomeTeam,
            nameVisitorTeam: nameVisitorTeam,
            oddHomeTeam: oddHomeTeam,
            oddVisitorTeam: oddVisitorTeam,
            leagueName: leagueName,
            matchDate: matchDate,
            matchID: matchID,
            color: color);
}
