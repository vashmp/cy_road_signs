import 'package:cy_road_signs/screens/quiz/image_quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:cy_road_signs/screens/quiz/text_quiz_screen.dart';
import 'package:cy_road_signs/widgets/common_widgets.dart';

class SignQuizSelector extends StatelessWidget {
  const SignQuizSelector({super.key});

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Text', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(width: 20),
                Text('Image', style: Theme.of(context).textTheme.titleLarge),
              ],
            ), // Row 1 Header text
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                actionButton('4 Questions', () {
                  navigateToScreen(
                      context, TextQuizScreen(numberOfQuestions: 4));
                }),
                const SizedBox(width: 20),
                actionButton('4 Questions', () {
                  navigateToScreen(
                      context, ImageQuizScreen(numberOfQuestions: 4));
                }),
              ],
            ), // Row
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                actionButton('10 Questions', () {
                  navigateToScreen(
                      context, TextQuizScreen(numberOfQuestions: 10));
                }),
                const SizedBox(width: 20),
                actionButton('10 Questions', () {
                  navigateToScreen(
                      context, ImageQuizScreen(numberOfQuestions: 10));
                }),
              ],
            ), // Row 2
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                actionButton('30 Questions', () {
                  navigateToScreen(
                      context, TextQuizScreen(numberOfQuestions: 30));
                }),
                const SizedBox(width: 20),
                actionButton('30 Questions', () {
                  navigateToScreen(
                      context, ImageQuizScreen(numberOfQuestions: 30));
                }),
              ],
            ), // Row 3
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                actionButton('50 Questions', () {
                  navigateToScreen(
                      context, TextQuizScreen(numberOfQuestions: 50));
                }),
                const SizedBox(width: 20),
                actionButton('50 Questions', () {
                  navigateToScreen(
                      context, ImageQuizScreen(numberOfQuestions: 50));
                }),
              ],
            ), // Row 4
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                actionButton('All Questions', () {
                  navigateToScreen(
                      context, TextQuizScreen(numberOfQuestions: -1));
                }),
                const SizedBox(width: 20),
                actionButton('All Questions', () {
                  navigateToScreen(
                      context, ImageQuizScreen(numberOfQuestions: -1));
                }),
              ],
            ), // Row 5
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
