import 'package:flutter/material.dart';

import 'package:expencetracker/Modals/expense.dart';

final categories = {
  Category.Food:  Categories(
   title: Category.Food,icon :const Icon(Icons.lunch_dining_sharp,color: Colors.white),caption: 'Food'
  ),
  Category.Leisure:  Categories(
   title: Category.Leisure,icon:const Icon(Icons.movie_filter_outlined,color: Colors.white),caption: 'leisure'
  ),
  Category.Travel:  Categories(
   title: Category.Travel,icon: const Icon(Icons.flight,color: Colors.white),caption: 'Travel'
  ),
  Category.Work: Categories(
    title: Category.Work,icon: const Icon(Icons.work_history,color: Colors.white),caption: 'Work'
  ),
  Category.Transfer:  Categories(
      title: Category.Transfer,icon :const Icon(Icons.compare_arrows,color: Colors.white),caption: 'Transfer'
  ),

};
