import 'package:cy_road_signs/screens/quiz/quiz_selector.dart';
import 'package:flutter/material.dart';
import '../signs/all_signs.dart';
import 'package:cy_road_signs/widgets/donation.dart';
import 'package:cy_road_signs/widgets/common_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: Row(
                          children: [
                            const Text('Under construction'),
                            const Icon(Icons.construction),
                          ],
                        ),
                      ));
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
              ClipOval(child: Image(image: AssetImage('images/cyprus.jpg'))),
              SizedBox(height: 20),
              actionButton('All road signs', () {
                navigateToScreen(context, AllSignsScreen());
              }),
              SizedBox(height: 20),
              actionButton('Test your knowledge', () {
                navigateToScreen(context, SignQuizSelector());
              }),
              SizedBox(height: 20),
              DonationButton(),
            ],
          ),
        ),
      ),
    );
  }
}
