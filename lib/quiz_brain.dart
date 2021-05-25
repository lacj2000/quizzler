import 'package:quizzler/question.dart';

class QuizBrain {
  int _questionNumber = 0;
  int questionNumber = 0;
  int hit = 0;
  double hitPercentage = 0;
  bool end = false;

  List<Question> _questionBank = [
    Question(
      text: "Alguns gatos são alergicos a humanos.",
      answer: true,
    ),
    Question(
      text: "Aproximadamente 1/4 dos osdos humanos estão no pé.",
      answer: true,
    ),
    Question(
      text: "Você pode conduzir uma vaca escada abaixo, mas não escada acima.",
      answer: false,
    ),
  ];

  void nextQuestion(bool h) {
    if (h) {
      hit++;
    }
    questionNumber++;
    calculatePercentage();

    if (questionNumber == _questionBank.length) {
      end = true;
    } else if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  void calculatePercentage() {
    hitPercentage = (hit / questionNumber) * 100;
  }

  String getText() {
    return _questionBank[_questionNumber].text;
  }

  String getPercetage() {
    return (hitPercentage).toString() + "% de acerto.";
  }

  bool getCorrectAwnser() {
    return _questionBank[_questionNumber].answer;
  }

  bool isFinished() {
    return end;
  }

  void reset() {
    _questionNumber = 0;
    questionNumber = 0;
    hit = 0;
    hitPercentage = 0.0;
    end = false;
  }
}
