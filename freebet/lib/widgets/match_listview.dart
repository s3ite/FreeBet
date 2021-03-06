import 'package:flutter/material.dart';

//providers
import 'package:provider/provider.dart';
import '../providers/matchitem_provider.dart';

import '../models/match.dart';
import 'matchitem.dart';

class MatchListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final matchData = Provider.of<MatchItemProvider>(context);
    final matchs = matchData.items;

    return ListView.builder(
      itemBuilder: ((context, index) => MatchItem(
            match: matchs[index],
          )),
      padding: const EdgeInsets.all(10),
      itemCount: matchs.length,
    );
  }
}
