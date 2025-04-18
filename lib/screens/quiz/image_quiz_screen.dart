import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cy_road_signs/core/models/sign_model.dart';
// import 'package:cy_road_signs/widgets/common_widgets.dart';

class ImageQuizScreen extends StatefulWidget {
  final int numberOfQuestions;

  const ImageQuizScreen({super.key, required this.numberOfQuestions});

  @override
  State<ImageQuizScreen> createState() => _ImageQuizScreenState();
}

class _ImageQuizScreenState extends State<ImageQuizScreen> {
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

      List<String> imageOptions = [];
      imageOptions.add(correctSign.image);

      while (imageOptions.length < 4) {
        final randomSignIndex = random.nextInt(signs.length);
        final randomSign = signs[randomSignIndex];
        if (!imageOptions.contains(randomSign.image)) {
          imageOptions.add(randomSign.image);
        }
      }

      imageOptions.shuffle();

      generatedQuestions.add({
        'question': correctSign.name,
        'options': imageOptions,
        'correctAnswer': correctSign.image,
      });
    }

    return generatedQuestions;
  }

  void checkAnswer(String selectedImage) {
    if (!isAnswered) {
      setState(() {
        isAnswered = true;
        if (selectedImage == questions[currentQuestionIndex]['correctAnswer']) {
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
            Text(
              questions[currentQuestionIndex]['question'],
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: List.generate(
                  4,
                  (index) => GestureDetector(
                    onTap: () => checkAnswer(
                      questions[currentQuestionIndex]['options'][index],
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isAnswered
                              ? questions[currentQuestionIndex]['options']
                                          [index] ==
                                      questions[currentQuestionIndex]
                                          ['correctAnswer']
                                  ? Colors.green
                                  : Colors.red
                              : Colors.grey,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        questions[currentQuestionIndex]['options'][index],
                        fit: BoxFit.contain,
                      ),
                    ),
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
