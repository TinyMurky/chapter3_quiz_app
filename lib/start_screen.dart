import "package:flutter/material.dart";

class StartScreen extends StatelessWidget {
  /// 下面的void 代表 switchScreen的回傳, Function() 代表 switchScreen 是function且沒有 argument
  final void Function() switchScreen;

  const StartScreen({super.key, required this.switchScreen});

  // const StartScreen(this.switchScreen, {super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize
            .min, // 想要 Column的內容在正中間用Size.min 就好，不一定要用MainAxisAlignment
        children: [
          const Image(
            image: AssetImage('assets/images/quiz-logo.png'),
            width: 300,
            color: Color.fromRGBO(255, 255, 255, 0.6),
          ),
          const SizedBox(
            height: 80,
          ),
          Text(
            'Learn Flutter the fun way!',
            style: TextStyle(
              fontSize: 14,
              color: colorScheme.secondary,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            // onPressed: () {
            //   switchScreen();
            // },
            onPressed: switchScreen,
            style: OutlinedButton.styleFrom(
              backgroundColor: colorScheme.onPrimaryContainer,
              foregroundColor: colorScheme
                  .onPrimary, // 這個是Button 和 Icon的顏色，所以不用在chile => Text設定
            ),
            icon: const Icon(Icons.arrow_forward),
            label: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}
