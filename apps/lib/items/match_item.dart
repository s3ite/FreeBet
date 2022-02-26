import 'package:apps/items/odd_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//Personnal import
import '../screens/match_detail_screen.dart';

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
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return MatchDetailScreen(
            sport: sport,
            startDate: startDate,
            homeTeam: homeTeam,
            awayTeam: awayTeam,
            id: id,
            isLive: isLive,
            leagueName: leagueName,
            oddHome: oddHome,
            oddDraw: oddDraw,
            oddAway: oddAway,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goToMatch(context),
      splashColor: Colors.pink,
      borderRadius: BorderRadius.circular(5),
      child: Container(
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
                        sport,
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
                        oddHome.toString(),
                        textAlign: TextAlign.center,
                        textScaleFactor: 0.8,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
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
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red,
                      ),
                      child: Text(
                        oddAway.toString(),
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
      ),
    );
  }
}
