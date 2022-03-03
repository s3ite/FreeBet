import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class User {
  final String userName;
  final String pseudo;
  String mailAdress;
  String mobileNumber;
  int age;
  double freebet;
  final String accountCreationDate;

  User(
      {required this.userName,
      required this.pseudo,
      required this.mailAdress,
      required this.mobileNumber,
      required this.age,
      required this.freebet,
      required this.accountCreationDate});
}
