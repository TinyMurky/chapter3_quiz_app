import 'package:chapter3_quiz_app/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:chapter3_quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:chapter3_quiz_app/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  // 從外圍傳遞過來的function
  final void Function(String chosenAnswer) onSelectAnswer;

  const QuestionsScreen({super.key, required this.onSelectAnswer});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionId = 0;

  void answerQuestion(String chosenAnswer) {
    if ((questions.length) > currentQuestionId) {
      /// State<T> 提供widget 上我們可以向上拿到放在 QuestionsScreen裡面的東西，這裡拿onSelectAnswer裡的東西
      widget.onSelectAnswer(chosenAnswer);
      setState(() {
        currentQuestionId += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    final currentQuestion = questions[currentQuestionId];

    return SizedBox(
      width: double.infinity, // 撐到最寬
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // 這邊可以用SpaceBetween, SpaceAround之類的
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              textAlign: TextAlign.center, // 文字放中間
              style: GoogleFonts.lato(
                  color: colorScheme.onPrimaryContainer,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                  answer: answer,
                  onTap: () {
                    answerQuestion(answer);
                  });
            })
          ],
        ),
      ),
    );
  }
}
