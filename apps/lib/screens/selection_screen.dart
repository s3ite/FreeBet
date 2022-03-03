import 'dart:ffi';

import 'package:apps/sample_data.dart';
import 'package:flutter/material.dart';

import '../models/matchdetail.dart';
import '../items/match_item_selection.dart';
import '../items/match_item.dart';

import '../items/top_bar.dart';
import '../custom_form.dart';

double _gainsPotentiels = 0;

class SelectionScreen extends StatefulWidget {
  static List<Widget> matchSelected = [];

  static addMatch(MatchItemSelection matchItem) {
    if (matchSelected.contains(matchItem) == false) {
      print("Not Present, so added");
      matchSelected.add(matchItem);
    } else {
      print("Already Present");
    }
  }

  static deleteMatch(MatchItemSelection matchItem) {
    matchSelected.remove(matchItem);
  }

  static deleteAllMatch() {
    matchSelected = [];
  }

  static getAmountBet(double value) {
    _gainsPotentiels = value;
  }

  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  double _totalOdds = 0;

  double getOdds() {
    int len = SelectionScreen.matchSelected.length;
    _totalOdds = 1;
    for (int i = 0; i < len; i++) {
      _totalOdds *= (SelectionScreen.matchSelected[i] as MatchItemSelection)
          .oddTeamSelected;
    }
    return _totalOdds;
  }

  double computePotentialEarn() {
    return _totalOdds * 5;
  }

  void refreshPage() {
    setState(() {
      _totalOdds = getOdds();
      _gainsPotentiels = computePotentialEarn();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: const Text("Selection"),
        appBar: AppBar(),
      ),
      body: ListView(
        children: <Widget>[
          Column(children: SelectionScreen.matchSelected),
          MyCustomForm(),
          Column(
            children: [
              Text("Total odd = $_totalOdds", textAlign: TextAlign.center),
              Text("Potential earn = $_gainsPotentiels",
                  textAlign: TextAlign.center),
              ElevatedButton(
                onPressed: refreshPage,
                child: Text("Confirm"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
