import 'package:cy_road_signs/screens/quiz/quiz_selector.dart';
import 'package:flutter/material.dart';
import '../signs/all_signs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cyprus Road Signs'),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              // Add your language change logic here
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Cyprus Road Signs',
                style: TextStyle(fontSize: 24),
              ),
              Image(image: AssetImage('images/cyprrus2.jpeg')),
              SizedBox(height: 20),
              actionButton('All road signs', () {
                navigateToScreen(context, AllSignsScreen());
              }),
              SizedBox(height: 10),
              actionButton('Test your knowledge', () {
                navigateToScreen(context, SignQuizSelector());
              }),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton actionButton(String text, VoidCallback onPressed) {
    String buttonText = text;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(250, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 0,
        backgroundColor: Colors.grey,
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }

  void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}
