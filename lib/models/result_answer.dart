import 'package:chapter3_quiz_app/question_summary/summary_item.dart';

class ResultAnswer {
  final int questionIndex;
  final String questionText;
  final String userAnswer;
  final String correctAnswer;

  ResultAnswer(
      {required this.questionIndex,
      required this.questionText,
      required this.userAnswer,
      required this.correctAnswer});

  bool isAnswerCorrect() {
    return userAnswer == correctAnswer;
  }

  SummaryItem initSummaryItem() {
    return SummaryItem(
      questionIndex: questionIndex,
      questionText: questionText,
      userAnswer: userAnswer,
      correctAnswer: correctAnswer,
      isAnswerCorrect: isAnswerCorrect(),
    );
  }
}
