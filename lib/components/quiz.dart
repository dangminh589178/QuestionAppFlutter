import 'package:flutter/material.dart';
import 'package:question_app_flutter/components/answer_quest.dart';
import 'package:question_app_flutter/components/result_screen.dart';
import 'package:question_app_flutter/components/start_screen.dart';
import 'package:question_app_flutter/data/questions.dart';

class Quiz extends StatefulWidget {
  Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  List<String> listAnswers = [];

  void onAnswer(String answer) {
    listAnswers.add(answer);
    if (listAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'ResulrScreen';
      });
    }
  }

  void restare() {
    listAnswers = [];
    setState(() {
      activeScreen = 'AnswerQuestionScreen';
    });
  }

  void startAnswerScreen() {
    setState(() {
      activeScreen = 'AnswerQuestionScreen';
    });
  }

  var activeScreen = 'StartScreen';

  @override
  Widget build(BuildContext context) {
    Widget screenVisible = (activeScreen == 'StartScreen')
        ? StartScreen(startAnswerScreen)
        : AnswerQuestionScreen(onAnswer);

    if (activeScreen == 'ResulrScreen') {
      screenVisible = ResultScreen(chosenAnswer: listAnswers, restare);
    }

    if (activeScreen == 'AnswerQuestionScreen') {
      screenVisible = AnswerQuestionScreen(onAnswer);
    }

    return MaterialApp(
        home: Scaffold(backgroundColor: Colors.orange, body: screenVisible));
  }
}
