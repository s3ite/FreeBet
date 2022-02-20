import 'package:flutter/material.dart';

class User {
  final String userName;
  final String mailAdress;
  final String mobileNumber;
  final int age;
  final double freebet;
  final String accountCreationDate;

  User(
      {required this.userName,
      required this.mailAdress,
      required this.mobileNumber,
      required this.age,
      required this.freebet,
      required this.accountCreationDate});
}
