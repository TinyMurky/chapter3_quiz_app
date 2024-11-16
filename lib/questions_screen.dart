import 'package:chapter3_quiz_app/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:chapter3_quiz_app/data/questions.dart';
// import 'package:chapter3_quiz_app/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionId = 0;

  void onTab() {
    setState(() {
      if ((questions.length - 1) > currentQuestionId) {
        currentQuestionId += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(answer: answer, onTap: onTab);
            })
          ],
        ),
      ),
    );
  }
}
