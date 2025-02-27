import 'package:cy_road_signs/screens/signs/warning_sings.dart';
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
            children: [
              Text(
                'Welcome to Cyprus Road Signs',
                style: TextStyle(fontSize: 24),
              ),
              actionButton('Go to Second Screen', () {
                navigateToScreen(context, AllSignsScreen());
              }),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 0,
                  backgroundColor: Colors.lightBlue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 70,
                    vertical: 10,
                  ),
                ),
                child: const Text('Next'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WarningSings()),
                  );
                },
              )
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        padding: const EdgeInsets.symmetric(
          horizontal: 70,
          vertical: 10,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}

void navigateToScreen(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}
