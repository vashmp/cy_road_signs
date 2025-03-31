import 'package:cy_road_signs/screens/leaderboard/leaderboard.dart';
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
      backgroundColor:
          Color(int.parse('#F5AADC'.substring(1, 7), radix: 16) + 0xFF000000),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: OvalBackgroundPainter(),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  SizedBox(
                    height: 234.0,
                    width: 293.0,
                    child: Image(image: AssetImage('images/car.png')),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 164.0,
                    child: Image(image: AssetImage('images/roadsignstext.png')),
                  ),
                  SizedBox(height: 20),
                  actionButton('All road signs', () {
                    navigateToScreen(context, AllSignsScreen());
                  }),
                  SizedBox(height: 20),
                  actionButton('Test your knowledge', () {
                    navigateToScreen(context, SignQuizSelector());
                  }),
                  SizedBox(height: 20),
                  actionButton('Leaderboard', () {
                    navigateToScreen(context, Leaderboard());
                  }),
                  SizedBox(height: 20),
                  DonationButton(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OvalBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(int.parse('#50AF75'.substring(1, 7), radix: 16) +
          0xFF000000) // Цвет овала
      ..style = PaintingStyle.fill;

    // Определяем прямоугольник для овала
    double ovalWidth = size.width * 1.4; // Шире экрана (20% запас)
    double ovalHeight = size.height; // Делаем его низким
    double left = (size.width - ovalWidth) / 2; // Центрируем по горизонтали
    double top = size.height * 0.3; // Опускаем вниз

    RRect rect = RRect.fromRectAndRadius(
      Rect.fromLTRB(left, top, left + ovalWidth, top + ovalHeight),
      Radius.circular(ovalHeight / 1.5), // Радиус для овала
    );
    canvas.drawRRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
