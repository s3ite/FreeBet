import 'package:flutter/material.dart';

class MatchDetailScreen extends StatelessWidget {
  void goToBalance(BuildContext context) {
    Navigator.of(context).pushNamed('./balance-screen');
  }

  void goToUser(BuildContext context) {
    Navigator.of(context).pushNamed('./user-screen');
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map;

    final sport = routeArgs['sport'];
    final leagueName = routeArgs['leagueName'];
    final id = routeArgs['id'];
    final startDate = routeArgs['startDate'];
    final isLive = routeArgs['isLive'];

    final homeTeam = routeArgs['homeTeam'];
    final awayTeam = routeArgs['awayTeam'];

    final oddHome = routeArgs['oddHome'];
    final oddDraw = routeArgs['oddDraw'];
    final oddAway = routeArgs['oddAway'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 0, 0, 1),
        title: const Text(
          "LiveScreen",
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
          ),
          onPressed: () {
            /*DropdownButton*/
          },
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () => goToBalance(context),
              child: Icon(
                Icons.attach_money,
                size: 26.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () => goToUser(context),
              child: Icon(Icons.account_circle_outlined),
            ),
          ),
        ],
      ),
      body: Center(
        child: const Text("Coming soon"),
      ),
    );
  }
}
