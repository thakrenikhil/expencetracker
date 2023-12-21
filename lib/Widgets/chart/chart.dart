// ignore_for_file: prefer_const_constructors

import 'package:expencetracker/Modals/expense.dart';
import 'package:expencetracker/categories.dart';
import 'package:flutter/material.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, categories[Category.Food]!),
      ExpenseBucket.forCategory(expenses, categories[Category.Work]!),
      ExpenseBucket.forCategory(expenses, categories[Category.Travel]!),
      ExpenseBucket.forCategory(expenses, categories[Category.Leisure]!),
      ExpenseBucket.forCategory(expenses, categories[Category.Transfer]!),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (final bucket in buckets) {
      if (bucket.totalExpenses > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpenses;
      }
    }
    return maxTotalExpense;
  }

  double get TotalExpense {
    double TotalExpense = 0;

    for (final expense in expenses) {
      TotalExpense += expense.amount!;
    }
    return TotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 8,
      ),
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.cyan, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Colors.orangeAccent.withOpacity(1),
            Colors.cyanAccent.withOpacity(1)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Container(
              child: Text(
            "Total:  ₹$TotalExpense",
            style: const TextStyle(
              fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                 ),
            textAlign: TextAlign.center,
            softWrap: true,
          ),),SizedBox(height: 4,),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets) // alternative to map()
                  ChartBar(
                    fill: bucket.totalExpenses == 0
                        ? 0
                        : bucket.totalExpenses / maxTotalExpense,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: buckets
                .map(
                  (bucket) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child:categories[bucket.category.title]!.icon,
                      // Icon(_groceryItem[index].category.color
                      //   CategoryIcon[bucket.category.icon.icon],
                      //   color: isDarkMode
                      //       ? Colors.black
                      //       : Theme.of(context)
                      //           .colorScheme
                      //           .primary
                      //           .withOpacity(0.7),
                      // ),
                    ),
                  ),
                )
                .toList(),
          ),
          //Container(child: Text("$maxTotalExpense",style: TextStyle(color: Colors.white),)),
        ],
      ),
    );
  }
}
