import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:question_app_flutter/data/questions.dart';

class AnswerQuestionScreen extends StatefulWidget {
  AnswerQuestionScreen(this.onAnswer, {super.key});

  void Function(String answer) onAnswer;

  @override
  State<StatefulWidget> createState() {
    return _AnswerQuestionScreen();
  }
}

class _AnswerQuestionScreen extends State<AnswerQuestionScreen> {
  var nextIndex = 0;
  void onSelectAnser(String answer) {
    widget.onAnswer(answer);
    setState(() {
      nextIndex++;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final answers = questions[nextIndex];

    return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              answers.title,
              style: TextStyle(fontSize: 28),
            ),
            SizedBox(
              height: 20,
            ),
            ...answers.anwers.map((e) => ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.lime),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(width: 1, color: Colors.black)))),
                  child: Text(
                    e,
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    onSelectAnser(e);
                  },
                ))
          ],
        ));
  }
}
