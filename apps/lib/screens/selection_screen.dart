import 'package:flutter/material.dart';

class SelectionScreen extends StatefulWidget {
  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selection"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Text("Coming soon"),
        ),
      ),
    );
  }
}
