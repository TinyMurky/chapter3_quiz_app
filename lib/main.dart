import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorSchemeSeed: Color.fromRGBO(94, 110, 227, 1),
    );

    return MaterialApp(
      theme: theme,
      home: Scaffold(
        backgroundColor: theme.colorScheme.primaryContainer,
        appBar: AppBar(
          backgroundColor: theme.colorScheme.primaryContainer,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Image(
                image: AssetImage('assets/images/quiz-logo.png'),
                width: 250,
              ),
              const SizedBox(
                height: 48,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 12.0, 0, 48.0),
                child: Text(
                  'Learn Flutter the fun way!',
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Start Quiz'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
