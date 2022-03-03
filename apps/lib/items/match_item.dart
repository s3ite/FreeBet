import 'package:flutter/material.dart';

//Personnal import
import '../screens/match_detail_screen.dart';
import './match_item_selection.dart';
import '../screens/selection_screen.dart';

enum TeamSelection {
  homeSelection,
  drawSelection,
  awaySelection,
}

class MatchItem extends StatelessWidget {
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

  MatchItem({
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

  //Function to change page
  void goToMatch(BuildContext context) {
    Navigator.of(context).pushNamed('./details-match', arguments: {
      'sport': sport,
      'leagueName': leagueName,
      'id': id,
      'startDate': startDate,
      'isLive': isLive,
      'homeTeam': homeTeam,
      'awayTeam': awayTeam,
      'oddHome': oddHome,
      'oddAway': oddAway,
      'oddDraw': oddDraw
    });
  }

  addToBet(MatchItem matchItem, TeamSelection selected) {
    double oddTeamSelected = 0;
    if (selected == TeamSelection.homeSelection)
      oddTeamSelected = oddHome;
    else if (selected == TeamSelection.drawSelection)
      oddTeamSelected = oddDraw;
    else if (selected == TeamSelection.awaySelection) oddTeamSelected = oddAway;

    SelectionScreen.addMatch(MatchItemSelection(
        sport: sport,
        leagueName: leagueName,
        id: id,
        startDate: startDate,
        homeTeam: homeTeam,
        awayTeam: awayTeam,
        oddTeamSelected: oddTeamSelected));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 250, 250, 250),
        borderRadius: BorderRadius.circular(5),
      ),

      //Vue du match
      child: Container(
        height: 100,
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () => goToMatch(context),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blue,
                      ),
                      child: Text(
                        homeTeam,
                        textAlign: TextAlign.center,
                        textScaleFactor: 2,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red,
                      ),
                      child: Text(
                        awayTeam,
                        textAlign: TextAlign.center,
                        textScaleFactor: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () => addToBet(this, TeamSelection.homeSelection),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey,
                      ),
                      child: Text(
                        oddHome.toString(),
                        textAlign: TextAlign.center,
                        textScaleFactor: 0.8,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () => addToBet(this, TeamSelection.drawSelection),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey,
                      ),
                      child: Text(
                        oddDraw.toString(),
                        textAlign: TextAlign.center,
                        textScaleFactor: 0.8,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () => addToBet(this, TeamSelection.awaySelection),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey,
                      ),
                      child: Text(
                        oddAway.toString(),
                        textAlign: TextAlign.center,
                        textScaleFactor: 0.8,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
