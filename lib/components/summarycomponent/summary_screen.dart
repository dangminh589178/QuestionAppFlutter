import 'package:flutter/material.dart';
import 'package:question_app_flutter/components/summarycomponent/summary_identifier.dart';
import 'package:question_app_flutter/components/summarycomponent/summary_item.dart';

class SummaryScreen extends StatelessWidget {
  SummaryScreen(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return SummaryItem(data);
          }).toList(),
        ),
      ),
    );
  }
}
