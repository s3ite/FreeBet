import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  //String text;

  Answer(this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: selectHandler,
        child: Text('Boutton 1'),
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFF44336),
          textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 38,
          ),
        ),
      ),
    );
  }
}
