import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:intl/intl.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  Widget _buildEmptyState() {
    return const Center(
      child: Text(
        'No results yet! Maybe everyone is still studying? 📚',
        style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
      ),
      body: FutureBuilder(
        future: Hive.openBox('quiz_results'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Box is now open
            var box = Hive.box('quiz_results');

            // Check if box is empty
            if (box.isEmpty) {
              return _buildEmptyState();
            }

            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                var result = box.getAt(index);
                String isoDate = result['date'].toString();
                DateTime parsedDate = DateTime.parse(isoDate);
                return ListTile(
                  title: Text(
                      '${result['type']} quiz ${DateFormat('dd-MM-yyyy').format(parsedDate)}'),
                  subtitle: Text(
                      'Your score: ${result['score']} / Total questions: ${result['totalQuestions']}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
