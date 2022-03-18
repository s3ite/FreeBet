import 'package:flutter/material.dart';
import 'package:freebet/models/match.dart';

enum TeamSelection {
  homeSelection,
  drawSelection,
  awaySelection,
}

class MatchItem extends StatelessWidget {
  final MatchInfo match;

  MatchItem({required this.match});

  //Function to change page
  void goToMatch(BuildContext context) {
    Navigator.of(context).pushNamed('./details-match', arguments: {});
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
                        match.homeTeam,
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
                        match.awayTeam,
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
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey,
                      ),
                      child: Text(
                        match.oddHome.toString(),
                        textAlign: TextAlign.center,
                        textScaleFactor: 0.8,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey,
                      ),
                      child: Text(
                        match.oddDraw.toString(),
                        textAlign: TextAlign.center,
                        textScaleFactor: 0.8,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () => {},
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey,
                      ),
                      child: Text(
                        match.oddAway.toString(),
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
