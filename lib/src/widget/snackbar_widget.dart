import 'package:flutter/material.dart';

class SnackBarHelper {
  static void showSnackBarWidget(
      BuildContext context, String content, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          content,
          style: TextStyle(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.fixed,
      ),
    );
  }
}
