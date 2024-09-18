import 'package:flutter/material.dart';

Widget buildButton(String buttonName, void Function() func, {Color? background}) {
  return TextButton(
    onPressed: func,
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(background ?? Colors.transparent), // Fixed
      side: WidgetStateProperty.all(const BorderSide(
        width: 0.8,
      )), // Fixed
      shape: WidgetStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      )), // Fixed
      foregroundColor: WidgetStateProperty.all(Colors.black), // Fixed
    ),
    child: Center(
      child: Text(
        buttonName,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,

        ),
      ),
    ),
  );
}


