import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizzler',
      theme: ThemeData(scaffoldBackgroundColor: Colors.black),
      home: Scaffold(
        body: QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizzPageStatus createState() => _QuizzPageStatus();
}

QuizBrain quizBrain = QuizBrain();

class _QuizzPageStatus extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(int userAnswer) {
    bool correctAnswer = quizBrain.getCorrectAwnser();
    bool maybe = (userAnswer == 2);
    bool userPickedAnswer = (!maybe && userAnswer == 1);

    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alerta = AlertDialog(
      title: Text("Boa Partida!"),
      content: Text(quizBrain.getPercetage()),
      actions: [
        okButton,
      ],
    );

    setState(() {
      if (userPickedAnswer == correctAnswer) {
        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      } else if (maybe) {
        scoreKeeper.add(Icon(
          Icons.beach_access,
          color: Colors.yellow,
        ));
      } else {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      quizBrain.nextQuestion(userPickedAnswer == correctAnswer);
      if (quizBrain.isFinished() == true) {
        scoreKeeper = [];
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alerta;
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          quizBrain.getPercetage(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10.0,
            color: Colors.white,
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text(
                "Verdadeiro",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () => {checkAnswer(1)},
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                "Falso",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () => {checkAnswer(0)},
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.yellow,
              ),
              child: Text(
                "Talvez",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () => {checkAnswer(2)},
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
