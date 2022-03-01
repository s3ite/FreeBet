import 'package:flutter/material.dart';

import './screens/home_screen.dart';
import 'screens/match_detail_screen.dart';
import 'screens/balance_screen.dart';
import 'screens/live_screen.dart';
import 'screens/result_screen.dart';
import 'screens/selection_screen.dart';
import 'screens/user_screen.dart';
import 'screens/screen_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Freebet2',
      home: ScreenManager(),
      routes: {
        './home-screen': (context) => HomeScreen(),
        './details-match': (context) => MatchDetailScreen(),
        './result-screen': (context) => ResultScreen(),
        './balance-screen': (context) => BalanceScreen(),
        './live-screen': (context) => LiveScreen(),
        './selection-screen': (context) => SelectionScreen(),
        './user-screen': (context) => UserScreen()
      },
    );
  }
}
