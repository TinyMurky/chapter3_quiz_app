import 'package:flutter/material.dart';

import 'package:chapter3_quiz_app/quiz.dart';

void main() {
  runApp(const Quiz());
}

/// move to quiz dart and be statefull widget
// class QuizApp extends StatelessWidget {
//   const QuizApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final theme = ThemeData(
//       useMaterial3: true,
//       brightness: Brightness.dark,
//       colorSchemeSeed: const Color.fromARGB(255, 142, 155, 251),
//     );

//     return MaterialApp(
//       theme: theme,
//       home: Scaffold(
//         // backgroundColor: theme.colorScheme.primaryContainer,
//         // appBar: AppBar(
//         //   backgroundColor: theme.colorScheme.primaryContainer,
//         // ),
//         body: Container(
//           // center 不能const
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 theme.colorScheme.primaryContainer,
//                 const Color.fromARGB(255, 142, 155, 251)
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           child: const StartScreen(),
//         ),
//       ),
//     );
//   }
// }
