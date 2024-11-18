import 'package:chapter3_quiz_app/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:chapter3_quiz_app/start_screen.dart';
import 'package:chapter3_quiz_app/questions_screen.dart';
import 'package:chapter3_quiz_app/common/enum.dart';
import 'package:chapter3_quiz_app/results_screen.dart';

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

  // 不一定要用到Widget
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

  /// 這個List用來存放 用戶選擇的答案
  final List<String> selectedAnswers = [];

  void chooseAnswer(String chosenAnswer) {
    selectedAnswers.add(chosenAnswer);
    print(selectedAnswers);
    if (selectedAnswers.length >= questions.length) {
      setState(() {
        activeScreen = AppScreen.result;
      });
    }
  }

  void restart() {
    selectedAnswers.clear();
    setState(() {
      activeScreen = AppScreen.start;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 只要在使用之前確定值就好
    final Widget screenWidget = switch (activeScreen) {
      AppScreen.quiz => QuestionsScreen(onSelectAnswer: chooseAnswer),
      AppScreen.result =>
        ResultsScreen(selectedAnswers: selectedAnswers, restart: restart),
      // 可以用 _ 當作default
      _ => StartScreen(switchScreen: switchScreen)
    };

    final theme = ThemeData(
      textTheme: GoogleFonts.notoSansTcTextTheme(),
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
