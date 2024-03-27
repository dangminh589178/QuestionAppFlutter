import 'package:flutter/material.dart';
import 'package:question_app_flutter/components/summarycomponent/summary_identifier.dart';
import 'package:question_app_flutter/data/questions.dart';

class SummaryItem extends StatefulWidget {
  SummaryItem(this.content, {super.key});

  final Map<String, Object> content;

  @override
  State<StatefulWidget> createState() {
    return _SummaryItem();
  }
}

class _SummaryItem extends State<SummaryItem> {
  @override
  Widget build(BuildContext context) {
    var correctAnswer =
        widget.content['user_answer'] == widget.content['correct_answer'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SummaryIdentifier(widget.content, correctAnswer),
        SizedBox(
          width: 20,
          height: 30,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.content['question'] as String),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 2,
              ),
              Text(widget.content['user_answer'] as String),
              Text(widget.content['correct_answer'] as String),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ],
    );
  }
}
