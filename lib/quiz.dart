import 'package:flutter/material.dart';

import 'package:chapter3_quiz_app/start_screen.dart';
import 'package:chapter3_quiz_app/questions_screen.dart';
import 'package:chapter3_quiz_app/common/enum.dart';

/// This class will be the entry point of app
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  AppScreen activeScreen = AppScreen.start;

  /// 不一定要用到Widget
  // @override
  // void initState() {
  //   super.initState();
  //   activeScreen = StartScreen(switchScreen: switchScreen);
  // }

  void switchScreen() {
    setState(() {
      activeScreen = AppScreen.quiz;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Widget screenWidget = activeScreen == AppScreen.start
        ? StartScreen(switchScreen: switchScreen)
        : const QuestionsScreen();

    final theme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorSchemeSeed: const Color.fromARGB(255, 142, 155, 251),
    );

    return MaterialApp(
      theme: theme,
      home: Scaffold(
        // backgroundColor: theme.colorScheme.primaryContainer,
        // appBar: AppBar(
        //   backgroundColor: theme.colorScheme.primaryContainer,
        // ),
        body: Container(
            // center 不能const
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primaryContainer,
                  const Color.fromARGB(255, 142, 155, 251)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: screenWidget),
      ),
    );
  }
}
