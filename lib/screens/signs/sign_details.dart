import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen(
      {Key? key, required this.tag, required this.image, required this.name})
      : super(key: key);
  final String tag;
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Warning Signs'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
              tag: tag,
              child: Image.asset(
                image!,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              name!,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
