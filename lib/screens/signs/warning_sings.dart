import 'package:flutter/material.dart';

class WarningSings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Warning Signs'),
      ),
      body: Column(
        children: [
          Text('Warning Signs'),
          Image.asset('images/Roundabout.png'),
        ],
      ),
    );
  }
}
