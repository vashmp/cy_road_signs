import 'package:flutter/material.dart';
import 'package:cy_road_signs/screens/quiz/quiz_screen.dart';
import 'package:cy_road_signs/widgets/common_widgets.dart';

class SignQuizSelector extends StatelessWidget {
  const SignQuizSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Quiz'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            actionButton('10 Questions', () {
              navigateToScreen(context, QuizScreen(numberOfQuestions: 10));
            }),
            const SizedBox(height: 20),
            actionButton('20 Questions', () {
              navigateToScreen(context, QuizScreen(numberOfQuestions: 20));
            }),
            const SizedBox(height: 20),
            actionButton('50 Questions', () {
              navigateToScreen(context, QuizScreen(numberOfQuestions: 50));
            }),
            const SizedBox(height: 20),
            actionButton('All Questions', () {
              navigateToScreen(context, QuizScreen(numberOfQuestions: -1));
            }),
          ],
        ),
      ),
    );
  }
}
