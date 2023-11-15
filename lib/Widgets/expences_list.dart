import 'package:flutter/material.dart';
import '../Modals/expense.dart';
import 'package:expencetracker/Widgets/expences-items.dart';

class ExpencesList extends StatelessWidget {
  const ExpencesList(
      {super.key, required this.expenses, required this.OnRemovedExpense});
  final List<Expense> expenses;
  final void Function(Expense expense) OnRemovedExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}
