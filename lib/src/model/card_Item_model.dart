import 'package:flutter/material.dart';

class CardItemModel {
  String cardTitle;
  IconData icon;
  int tasksRemaining;
  double taskCompletion;
  String runningText;

  CardItemModel(this.cardTitle, this.icon, this.tasksRemaining,
      this.taskCompletion, this.runningText);
}

// var cardsList = [
//   CardItemModel("Personal", Icons.account_circle, 9, 0.83),
//   CardItemModel("Work", Icons.work, 12, 0.24),
//   CardItemModel("Home", Icons.home, 7, 0.32)
// ];
