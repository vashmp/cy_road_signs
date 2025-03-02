import 'package:flutter/material.dart';
import 'package:cy_road_signs/screens/quiz/quiz_screen.dart';

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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(numberOfQuestions: 20),
                  ),
                );
              },
              child: const Text('20 Questions'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(numberOfQuestions: 50),
                  ),
                );
              },
              child: const Text('50 Questions'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        QuizScreen(numberOfQuestions: -1), // -1 for all questions
                  ),
                );
              },
              child: const Text('All Signs'),
            ),
          ],
        ),
      ),
    );
  }
}
