import 'package:flutter/material.dart';

import 'package:expencetracker/Modals/expense.dart';

final categories = {
  Category.food: const Categories(
    'Food',Icon(Icons.lunch_dining_sharp)
  ),
  Category.leisure: const Categories(
    'leisure',Icon(Icons.movie_filter_outlined)
  ),
  Category.travel: const Categories(
    'Travel',Icon(Icons.flight)
  ),
  Category.work: const Categories(
    'Work',Icon(Icons.work_history)
  ),

};
