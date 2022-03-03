import 'package:flutter/material.dart';

import '../items/top_bar.dart';

class ResultScreen extends StatefulWidget {
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
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
          "Result",
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
