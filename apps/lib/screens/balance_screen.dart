import 'package:flutter/material.dart';

import '../items/top_bar.dart';

class BalanceScreen extends StatefulWidget {
  //double amountAvaible;

  //BalanceScreen(this.amountAvaible);

  @override
  _BalanceScreenState createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  void goToBalance(BuildContext context) {
    Navigator.of(context).pushNamed('./balance-screen');
  }

  void goToUser(BuildContext context) {
    Navigator.of(context).pushNamed('./user-screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: Text(
          "Balance",
        ),
        appBar: AppBar(),
      ),
      body: Container(
        child: Center(
          child: Text("Coming soon"),
        ),
      ),
    );
  }
}
