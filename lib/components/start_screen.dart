import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  StartScreen(this.onClick, {super.key});

  void Function() onClick;

  @override
  State<StatefulWidget> createState() {
    return _StartScreen();
  }
}

class _StartScreen extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image(image: AssetImage('assets/images/quiz-logo.png')),
          SizedBox(
            height: 30.0,
          ),
          OutlinedButton(
              onPressed: () {
                widget.onClick();
              },
              child: Text(
                'Start Quiz',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1.0, color: Colors.white)))
        ],
      ),
    );
  }
}
