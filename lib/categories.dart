import 'package:flutter/material.dart';

import 'package:expencetracker/Modals/expense.dart';

final categories = {
  Category.food:  Categories(
   title: Category.food,icon :const Icon(Icons.lunch_dining_sharp),caption: 'Food'
  ),
  Category.leisure:  Categories(
   title: Category.leisure,icon:const Icon(Icons.movie_filter_outlined),caption: 'leisure'
  ),
  Category.travel:  Categories(
   title: Category.travel,icon: const Icon(Icons.flight),caption: 'Travel'
  ),
  Category.work: Categories(
    title: Category.work,icon: const Icon(Icons.work_history),caption: 'Work'
  ),

};
