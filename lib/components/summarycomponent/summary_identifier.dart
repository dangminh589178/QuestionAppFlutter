import 'package:flutter/material.dart';

class SummaryIdentifier extends StatefulWidget {
  SummaryIdentifier(this.question_identifier, this.correctAnswer, {super.key});

  final Map<String, Object> question_identifier;
  final bool correctAnswer;
  @override
  State<StatefulWidget> createState() {
    return _SummaryIdentifier();
  }
}

class _SummaryIdentifier extends State<SummaryIdentifier> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red, width: 2),
          shape: BoxShape.circle,
          color: widget.correctAnswer ? Colors.blue : Colors.black45,
        ),
        child: Text(
            (((widget.question_identifier['question_index']) as int) + 1)
                .toString()),
        alignment: Alignment.center,
      ),
    );
  }
}
// question_index