import 'package:quizzler/question.dart';

class QuizBrain {
  int _questionNumber = 0;

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

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getText() {
    return _questionBank[_questionNumber].text;
  }

  bool getCorrectAwnser() {
    return _questionBank[_questionNumber].answer;
  }

  bool isFinished() {
    if (_questionNumber == _questionBank.length - 1) {
      return true;
    }
    return false;
  }

  void reset() {
    _questionNumber = 0;
  }
}
