import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget {
  final int questionIndex;
  final String questionText;
  final String userAnswer;
  final String correctAnswer;
  final bool isAnswerCorrect;

  static const correctColor = Color.fromARGB(152, 17, 255, 17);
  static const wrongColor = Color.fromARGB(126, 255, 28, 28);
  const SummaryItem(
      {super.key,
      required this.questionIndex,
      required this.questionText,
      required this.userAnswer,
      required this.correctAnswer,
      required this.isAnswerCorrect});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    return ListTile(
      leading: CircleAvatar(
        maxRadius: 15,
        minRadius: 10,
        backgroundColor: isAnswerCorrect
            ? const Color.fromARGB(151, 15, 209, 15)
            : wrongColor,
        child: Text(
          questionIndex.toString(),
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
      title: Text(
        questionText,
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            correctAnswer,
            style: const TextStyle(
              color: Color.fromARGB(216, 188, 196, 247),
              fontSize: 10,
            ),
          ),
          Text(
            userAnswer,
            style: const TextStyle(
              color: Color.fromARGB(157, 232, 193, 252),
              fontSize: 10,
            ),
          ),
        ],
      ),
      // trailing: Icon(Icons.favorite_rounded),
    );
  }
}
