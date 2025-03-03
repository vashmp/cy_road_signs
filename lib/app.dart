import 'package:flutter/material.dart';
import 'screens/home/home_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cyprus Road Signs',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
    //   );
  }
}
