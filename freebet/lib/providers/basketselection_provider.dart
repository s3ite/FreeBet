import 'package:flutter/material.dart';
import 'package:freebet/models/match.dart';

class BasketSelectionProvider with ChangeNotifier {
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
  ];

  List<MatchInfo> get items {
    return [..._match];
  }

  MatchInfo findElementById(String id) {
    return _match.firstWhere((mtch) => mtch.id == id);
  }

  void addMatch() {
    //
    notifyListeners();
  }

  void deleteMatch() {
    //
    notifyListeners();
  }

  void markHomeOdd(String id) {
    findElementById(id).colorOddHome = Colors.yellow;
    notifyListeners();
  }

  void markDrawOdd(String id) {
    findElementById(id).colorOddDraw = Colors.yellow;
    notifyListeners();
  }

  void markHomeAway(String id) {
    findElementById(id).colorOddAway = Colors.yellow;
    notifyListeners();
  }
}
