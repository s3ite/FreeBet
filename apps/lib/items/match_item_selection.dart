import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//Personnal import
import '../screens/match_detail_screen.dart';
import './match_item.dart';

class MatchItemSelection extends StatelessWidget {
  final String sport;
  final String leagueName;
  final String id;
  String startDate;
  final String homeTeam;
  final String awayTeam;
  double oddTeamSelected;

  MatchItemSelection({
    required this.sport,
    required this.leagueName,
    required this.id,
    required this.startDate,
    required this.homeTeam,
    required this.awayTeam,
    required this.oddTeamSelected,
  });

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
            Row(
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
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue,
                    ),
                    child: Text(
                      oddTeamSelected.toString(),
                      textAlign: TextAlign.center,
                      textScaleFactor: 0.8,
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
