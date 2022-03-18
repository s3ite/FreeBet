import 'package:flutter/material.dart';
import 'package:freebet/models/match.dart';

class MatchItemProvider with ChangeNotifier {
  List<MatchInfo> _match = [
    MatchInfo(
      id: "16341-13602-2022-01-23",
      awayTeam: "France",
      homeTeam: "Portufal",
      isLive: false,
      leagueName: "UEFA",
      oddAway: 1.7,
      oddDraw: 1.5,
      oddHome: 2.0,
      sport: "Soccer",
      startDate: "01-23 21:00-23:00",
    ),
    MatchInfo(
      id: "16341-13602-2de022-01-23",
      awayTeam: "Laker",
      homeTeam: "Denver",
      isLive: true,
      leagueName: "NBA",
      oddAway: 1.7,
      oddDraw: 1.5,
      oddHome: 2.0,
      sport: "Basketball",
      startDate: "01-23 21:00-23:00",
    ),
    MatchInfo(
      id: "16341-13602-2defd022-01-23",
      awayTeam: "Benoit Paire",
      homeTeam: "Monfils",
      isLive: false,
      leagueName: "Rolland Garros",
      oddAway: 1.7,
      oddDraw: 1.5,
      oddHome: 2.0,
      sport: "Tennis",
      startDate: "01-23 21:00-23:00",
    ),
    MatchInfo(
      id: "16341-13602-2da022-01-23",
      awayTeam: "Psg",
      homeTeam: "Marseille",
      isLive: true,
      leagueName: "Ligue 1",
      oddAway: 1.7,
      oddDraw: 1.5,
      oddHome: 2.0,
      sport: "Soccer",
      startDate: "01-23 21:00-23:00",
    ),
    MatchInfo(
      id: "16341-13602-2022-01-23",
      awayTeam: "Benoit Paire",
      homeTeam: "Monfils",
      isLive: false,
      leagueName: "Rolland Garros",
      oddAway: 1.7,
      oddDraw: 1.5,
      oddHome: 2.0,
      sport: "Tennis",
      startDate: "2022-01-23T18:30:00-05:00",
    ),
    MatchInfo(
      id: "16341-13602-2022-01-23",
      awayTeam: "Psg",
      homeTeam: "Marseille",
      isLive: true,
      leagueName: "Ligue 1",
      oddAway: 1.7,
      oddDraw: 1.5,
      oddHome: 2.0,
      sport: "Soccer",
      startDate: "2022-01-23T18:30:00-05:00",
    ),
    MatchInfo(
      id: "16341-13602-2022-01-23",
      awayTeam: "Benoit Paire",
      homeTeam: "Monfils",
      isLive: false,
      leagueName: "Rolland Garros",
      oddAway: 1.7,
      oddDraw: 1.5,
      oddHome: 2.0,
      sport: "Tennis",
      startDate: "2022-01-23T18:30:00-05:00",
    ),
    MatchInfo(
      id: "16341-13602-2022-01-23",
      awayTeam: "Psg",
      homeTeam: "Marseille",
      isLive: true,
      leagueName: "Ligue 1",
      oddAway: 1.7,
      oddDraw: 1.5,
      oddHome: 2.0,
      sport: "Soccer",
      startDate: "01-23 21:00-23:00",
    ),
  ];

  List<MatchInfo> get items {
    return [..._match];
  }

  void addProducts() {
    //
    notifyListeners();
  }
}
