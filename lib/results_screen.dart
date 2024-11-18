import 'package:chapter3_quiz_app/data/questions.dart';
import 'package:chapter3_quiz_app/models/result_answer.dart';
import 'package:chapter3_quiz_app/question_summary/question_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  /// all user input in here, and will be used to match Questions
  final List<String> selectedAnswers;

  /// restart Quiz app from "start point", and reset selectedAnswer
  final void Function() restart;

  final List<ResultAnswer> resultAnswers = [];

  ResultsScreen({
    super.key,
    required this.selectedAnswers,
    required this.restart,
  }) {
    for (int i = 0; i < selectedAnswers.length; i++) {
      final resultAnswer = ResultAnswer(
        questionIndex: i + 1,
        questionText: questions[i].question,
        userAnswer: selectedAnswers[i],
        correctAnswer: questions[i].answers[0],
      );
      resultAnswers.add(resultAnswer);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Theme Related
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    // How many Question has been answered
    final int totalQuestionsAmount = resultAnswers.length;
    final int correctAnswerAmount =
        resultAnswers.where((x) => x.isAnswerCorrect()).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnswerAmount  out of $totalQuestionsAmount questions correctly!',
              style: GoogleFonts.lato(
                  color: colorScheme.onPrimaryContainer,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(resultAnswers: resultAnswers),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              // onPressed: () {
              //   switchScreen();
              // },
              onPressed: restart,
              style: OutlinedButton.styleFrom(
                backgroundColor: colorScheme.onPrimaryContainer,
                foregroundColor: colorScheme
                    .onPrimary, // 這個是Button 和 Icon的顏色，所以不用在chile => Text設定
              ),
              icon: const Icon(Icons.restart_alt),
              label: const Text('Restart'),
            )
          ],
        ),
      ),
    );
  }
}
