import 'package:flutter/material.dart';

import '../model/card_Item_model.dart';

class CategoryList {
  static List<CardItemModel> getCardsList = [
    CardItemModel(
      "Add Category",
      Icons.add_box_outlined,
      7,
      0.32,
      "An open space for exploring new interests, ideas, and projects that don’t fit elsewhere.",
    ),
    CardItemModel(
      "Personal",
      Icons.account_circle,
      9,
      0.83,
      "A space for my interests, hobbies, and reflections on life’s adventures and inspirations...",
    ),
    CardItemModel(
      "Work",
      Icons.work,
      12,
      0.24,
      "A showcase of my professional journey, achievements, skills, and projects I've contributed to...",
    ),
    CardItemModel(
      "Education",
      Icons.home,
      7,
      0.32,
      "Documenting my learning experiences, courses taken, and significant academic milestones...",
    ),
  ];
}
