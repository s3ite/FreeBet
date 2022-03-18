import 'package:flutter/material.dart';

//screens
import 'package:freebet/screens/home_screen.dart';

//providers
import './providers/match_item_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MatchItemProvider(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.red,
            colorScheme: const ColorScheme.dark(),
            fontFamily: 'Lato',
          ),
          home: HomeScreen()),
    );
  }
}
