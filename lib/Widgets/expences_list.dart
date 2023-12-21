// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Modals/expense.dart';
import 'package:expencetracker/Widgets/expences-items.dart';

import '../main.dart';

class ExpencesList extends ConsumerWidget {
  const ExpencesList(
      {super.key, required this.expenses, required this.OnRemovedExpense});
  final List<Expense> expenses;
  final void Function(Expense expense) OnRemovedExpense;
  // emailGet(Str? value, WidgetRef ref){
  //   ref.read(expensesProvider.notifier).update((state) => expenses[index].id);
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
          direction: DismissDirection.startToEnd,
          behavior: HitTestBehavior.translucent,
          background: Container(
              color: Colors.redAccent,
              alignment: Alignment.centerLeft,
              child: const Icon(Icons.delete)),
          onDismissed: (direction) {
            OnRemovedExpense(expenses[index]);
          },
          key: ValueKey(expenses[index].id),
          child: ExpenceItem(expense: expenses[index])),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
          crossAxisSpacing: 0),
    );
  }
}
