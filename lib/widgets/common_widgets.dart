import 'package:flutter/material.dart';

// button witch clickable action and text
ElevatedButton actionButton(String text, VoidCallback onPressed) {
  String buttonText = text;
  return ElevatedButton(
    style: buttonStyle(Colors.white),
    onPressed: onPressed,
    child: Text(
      buttonText,
      style: TextStyle(fontSize: 20, color: Colors.black),
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
      side: BorderSide(color: Colors.black, width: 2),
    ),
    elevation: 0,
    backgroundColor: color,
  );
}
