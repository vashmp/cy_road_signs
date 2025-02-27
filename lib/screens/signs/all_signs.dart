import 'package:flutter/material.dart';

class AllSignsScreen extends StatelessWidget {
  AllSignsScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> signs = [
    {'name': 'Zebra crossing', 'image': 'images/Zebra_crossing.png'},
    {'name': 'Give priority', 'image': 'images/Give_priority.png'},
    {'name': 'Roundabout', 'image': 'images/Roundabout.png'},
    // Add more signs here
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Signs'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: signs.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    signs[index]['image']!,
                    height: 80,
                    width: 80,
                  ),
                  SizedBox(height: 8.0),
                  Text(signs[index]['name']!),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
