import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

class MyGame extends StatefulWidget {
  @override
  _MyGameState createState() => _MyGameState();
}

class _MyGameState extends State<MyGame> {
  final _questions = const [
    {
      'questionText': 'Q1. Who created Flutter?',
      'answers': [
        {'text': 'Cigarettes After Sex', 'score': -2},
        {'text': 'Clairo', 'score': -2},
        {'text': 'The California Dreamers', 'score': 10},
        {'text': 'Current Joys', 'score': -2},
      ],
    },
    {
      'questionText': 'Q2. What is Flutter?',
      'answers': [
        {'text': 'Summer Walker', 'score': -2},
        {'text': 'Aaliyah', 'score': -2},
        {'text': 'Sza', 'score': -2},
        {'text': 'Alina Baraz', 'score': 10},
      ],
    },
    {
      'questionText': ' Q3. Which programing language is used by Flutter',
      'answers': [
        {'text': 'Mac Demarco', 'score': -2},
        // so, if the text in the option matches the name of the artist associated with the song object on prompt, it will be added to your library and you will be notified about the results right away. An animation to represent the success would be nice, but let's start with a simple green and red covering of the choices.
        {'text': 'Far Caspian', 'score': 10},
        {'text': 'Summer Salt', 'score': -2},
        {'text': 'Jacob Ogawa', 'score': -2},
      ],
    },
    {
      'questionText': 'Q4. Who created Dart programing language?',
      'answers': [
        {'text': 'New Order', 'score': 10},
        {'text': 'Joy division', 'score': -2},
        {'text': 'Orange Juice', 'score': -2},
        {'text': 'Depeche Mode', 'score': -2},
      ],
    },
    {
      'questionText': 'Q4. Who created Dart programing language?',
      'answers': [
        {'text': 'Frank Ocean', 'score': 10},
        {'text': 'Giveon', 'score': -2},
        {'text': 'Daniel Ceasar', 'score': -2},
        {'text': 'Leon Bridges', 'score': -2},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/spotify-icon-32.png",
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
          title: Text('You know your Music?'),
          backgroundColor: Color(0xFF00E676),
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.orange[300], Colors.orange[100]])),
          child: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                ) //Quiz
              : Result(_totalScore, _resetQuiz),
        ), //Padding
      ), //Scaffold
      debugShowCheckedModeBanner: false,
    ); //MaterialApp
  }
}
