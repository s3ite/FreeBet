import 'package:flutter/material.dart';
import '../widgets/match_list_view.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Freebet"),
      ),
      body: MatchListView(),
    );
  }
}
