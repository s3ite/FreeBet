import 'package:flutter/material.dart';
import '../widgets/basketselection_listview.dart';

class BasketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basket"),
      ),
      body: BasketSelectionListView(),
    );
  }
}
