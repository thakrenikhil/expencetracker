// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

import 'expense.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category {
  Food,
  Travel,
  Work,
  Leisure,
  Transfer
}

class Categories {
  Categories({
    required this.title,
    required this.icon,
    required this.caption,
  });
  final Category title;
  final Icon? icon;
  final String caption;
}

final CategoryIcon = {
  Category.Food: Icons.lunch_dining_sharp,
  Category.Work: Icons.work_history,
  Category.Leisure: Icons.movie_filter_outlined,
  Category.Travel: Icons.flight,
  Category.Transfer: Icons.compare_arrows,

};

class Expense {
  Expense({
    required this.amount,
    required this.date,
    required this.title,
    required this.category,
    required this.id,
    required this.comment,
  });
  // : id = uuid.v4();
  final String comment;
  final String? id;
  final double? amount;
  final DateTime? date;
  final String? title;
  final Categories? category;
  get formatteddate {
    return formatter.format(date!);
  }
}

class ExpenseBucket {
  ExpenseBucket({required this.category, required this.expenses});
  final Categories category;

  final List<Expense> expenses;
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount!;
    }
    return sum;
  }
}
