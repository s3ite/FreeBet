import 'package:flutter/material.dart';

//screens
import 'screens/home_screen.dart';
import 'screens/basket_screen.dart';

//providers
import 'providers/matchitem_provider.dart';
import 'providers/basketselection_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: MatchItemProvider(),
        ),
        ChangeNotifierProvider.value(
          value: BasketSelectionProvider(),
        ),
      ],
      child: MaterialApp(
          routes: {
            './home-screen': (context) => HomeScreen(),
            './basket-screen': (context) => BasketScreen(),
          },
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
