import 'package:flutter/material.dart';

//providers
import 'package:provider/provider.dart';
import '../providers/basketselection_provider.dart';

import 'basketselection_matchitem.dart';

class BasketSelectionListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final matchData = Provider.of<BasketSelectionProvider>(context);
    final matchs = matchData.items;

    return ListView.builder(
      itemBuilder: ((context, index) => BasketSelectionMatchItem(
            match: matchs[index],
          )),
      padding: const EdgeInsets.all(10),
      itemCount: matchs.length,
    );
  }
}
