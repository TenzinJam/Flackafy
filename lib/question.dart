import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    // I need to make the container more visually appealing than just a rectangular box. Make it circular or even have an image as background
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.red[200]),
        margin: EdgeInsets.all(10),
        child: IconButton(
            icon: Icon(Icons.play_circle_outline, size: 40.0),
            onPressed: () {})); //Contaier
  }
}
