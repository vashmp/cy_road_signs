import 'package:flutter/material.dart';

class WarningSings extends StatelessWidget {
  const WarningSings({Key? key}) : super(key: key);
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
