import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:question_app_flutter/components/summarycomponent/summary_screen.dart';
import 'package:question_app_flutter/data/questions.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(this.onRestare, {super.key, required this.chosenAnswer});

  final void Function() onRestare;
  final List<String> chosenAnswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswer.length; i++) {
      // loop
      summary.add({
        'question_index': i,
        'question': questions[i].title,
        'correct_answer': questions[i].anwers[0],
        'user_answer': chosenAnswer[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestion = 0;
    final numCorrectQuestion = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'You answer ${numCorrectQuestion} out of ${chosenAnswer.length} question correctly'),
            SizedBox(height: 30),
            SummaryScreen(getSummaryData()),
            SizedBox(height: 30),
            TextButton(
                onPressed: () {
                  onRestare();
                },
                child: Text('Restare quiz')),
          ],
        ),
      ),
    );
  }
}
