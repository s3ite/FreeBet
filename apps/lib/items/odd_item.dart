import 'package:flutter/material.dart';

class OddItem extends StatelessWidget {
  @override
  final double odd;

  OddItem(this.odd);

  void addToBasket() {}

  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: addToBasket,
      child: Text(odd.toString(), style: const TextStyle(color: Colors.green)),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.red),
      ),
    );
  }
}
