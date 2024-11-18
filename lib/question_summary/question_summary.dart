import 'package:chapter3_quiz_app/models/result_answer.dart';
import 'package:flutter/material.dart';

/// Result screen 裡面可以滑動的欄位

class QuestionSummary extends StatelessWidget {
  final List<ResultAnswer> resultAnswers;

  const QuestionSummary({super.key, required this.resultAnswers});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: resultAnswers
              .map((resultAnswer) => resultAnswer.initSummaryItem())
              .toList(), // iterable to list
        ),
      ),
    );
  }
}
