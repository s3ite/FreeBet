import 'package:flutter/material.dart';
import '../widgets/match_listview.dart';

class HomeScreen extends StatelessWidget {
  void goToBasket(BuildContext context) {
    Navigator.of(context).pushNamed('./basket-screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Freebet"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () => goToBasket(context),
              child: Icon(
                Icons.attach_money,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      body: MatchListView(),
    );
  }
}
