import 'package:apps/items/odd_item.dart';
import 'package:flutter/material.dart';

//Personnal import
import '../screens/match_detail_screen.dart';

class MatchItem extends StatelessWidget {
  final String nameHomeTeam;
  final String nameVisitorTeam;
  final double oddHomeTeam;
  final double oddVisitorTeam;
  final String leagueName;
  final String matchDate;
  final String matchID;
  final Color color;

  MatchItem(
      this.nameHomeTeam,
      this.nameVisitorTeam,
      this.oddHomeTeam,
      this.oddVisitorTeam,
      this.leagueName,
      this.matchDate,
      this.matchID,
      this.color);

  //Function to change page
  void goToMatch(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return MatchDetailScreen(nameHomeTeam, nameVisitorTeam, oddHomeTeam,
              oddVisitorTeam, leagueName, matchDate, matchID);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goToMatch(context),
      splashColor: Colors.yellow,
      borderRadius: BorderRadius.circular(15),
      child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(nameHomeTeam + " \t\t\t\t\t" + nameVisitorTeam),
              OddItem(oddHomeTeam),
              OddItem(oddVisitorTeam)
            ],
          )),
    );
  }
}
