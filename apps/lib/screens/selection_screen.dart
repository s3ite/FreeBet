import 'package:flutter/material.dart';

import '../models/matchdetail.dart';
import '../items/match_item_selection.dart';

class SelectionScreen extends StatefulWidget {
  static List<String> _idMatch = [];

  static addMatch(String id, String TeamSelected) {
    if (_idMatch.contains(id)) {
      print("Not added"); //////================================
      return;
    }
    _idMatch.add(id);
    print("Added"); //////================================
  }

  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  void goToBalance(BuildContext context) {
    Navigator.of(context).pushNamed('./balance-screen');
  }

  void goToUser(BuildContext context) {
    Navigator.of(context).pushNamed('./user-screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 0, 0, 1),
        title: const Text(
          "Selection",
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
      body: Container(
        child: Center(
          child: Text("Coming soon"),
        ),
      ),
    );
  }
}
