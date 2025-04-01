import 'package:flutter/material.dart';

// button witch clickable action and text
Flexible actionButton(String text, VoidCallback onPressed) {
  return Flexible(
    //  padding: const EdgeInsets.symmetric(horizontal: 20),
    child: SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: buttonStyle(Color(
            int.parse('#54C07E'.substring(1, 7), radix: 16) + 0xFF000000)),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    ),
  );
}

void navigateToScreen(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}

ButtonStyle buttonStyle(Color color) {
  return ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    elevation: 0,
    backgroundColor: color,
  );
}
