import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cy_road_signs/core/models/sign_model.dart';
import 'package:cy_road_signs/widgets/common_widgets.dart';

class QuizScreen extends StatefulWidget {
  final int numberOfQuestions;

  const QuizScreen({Key? key, required this.numberOfQuestions})
      : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Map<String, dynamic>> questions;
  int currentQuestionIndex = 0;
  int score = 0;
  bool isAnswered = false;

  @override
  void initState() {
    super.initState();
    questions = generateQuestions();
  }

  List<Map<String, dynamic>> generateQuestions() {
    final random = Random();
    final List<Map<String, dynamic>> generatedQuestions = [];
    final List<RoadSign> signs = getAllSigns();
    int numberOfQuestions = widget.numberOfQuestions;
    if (numberOfQuestions == -1) {
      numberOfQuestions = signs.length;
    }

    for (int i = 0; i < numberOfQuestions; i++) {
      final correctSignIndex = random.nextInt(signs.length);
      final correctSign = signs[correctSignIndex];

      List<String> options = [];
      options.add(correctSign.name);

      while (options.length < 4) {
        final randomSignIndex = random.nextInt(signs.length);
        final randomSign = signs[randomSignIndex];
        if (!options.contains(randomSign.name)) {
          options.add(randomSign.name);
        }
      }

      options.shuffle();

      generatedQuestions.add({
        'question': 'What is the name of this road sign?',
        'signImage': correctSign.image,
        'options': options,
        'correctAnswer': correctSign.name,
      });
    }

    return generatedQuestions;
  }

  void checkAnswer(String selectedAnswer) {
    if (!isAnswered) {
      setState(() {
        isAnswered = true;
        if (selectedAnswer ==
            questions[currentQuestionIndex]['correctAnswer']) {
          score++;
        }
      });

      Future.delayed(const Duration(seconds: 2), () {
        if (currentQuestionIndex < questions.length - 1) {
          setState(() {
            currentQuestionIndex++;
            isAnswered = false;
          });
        } else {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              title: const Text('Quiz Completed!'),
              content: Text('Your score: $score/${questions.length}'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Road Sign Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Question ${currentQuestionIndex + 1}/${questions.length}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Image.asset(
              questions[currentQuestionIndex]['signImage'],
              height: 200,
            ),
            const SizedBox(height: 20),
            Text(
              questions[currentQuestionIndex]['question'],
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            ...List.generate(
              4,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () => checkAnswer(
                    questions[currentQuestionIndex]['options'][index],
                  ),
                  style: buttonStyle(
                    (isAnswered
                        ? questions[currentQuestionIndex]['options'][index] ==
                                questions[currentQuestionIndex]['correctAnswer']
                            ? Colors.green
                            : Colors.red
                        : Colors.white),
                  ),
                  child: Text(
                    questions[currentQuestionIndex]['options'][index],
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
