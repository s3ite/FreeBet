import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  UserScreen();

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Info"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("In building"),
      ),
    );
  }
}
