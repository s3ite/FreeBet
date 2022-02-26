import 'package:flutter/material.dart';

class LiveScreen extends StatefulWidget {
  @override
  _LiveScreenState createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Live"),
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
