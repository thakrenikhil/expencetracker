import 'package:expencetracker/chart/chart.dart';
import 'package:expencetracker/expences_list.dart';
import 'package:expencetracker/new_item.dart';
import 'package:flutter/material.dart';
import 'expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredexpences = [
    Expense(
      title: "ExpenseTracker app",
      amount: 99,
      date: DateTime.now(),
      category: Category.work,
    ),
  ];
  void _openAddExpenceOverlay() {
    showModalBottomSheet(
        context: context,
        builder: (context) => NewExpence(
              onAddExpense: _addExpence,
            ));
  }

  void _addExpence(Expense expense) {
    setState(() {
      _registeredexpences.add(expense);
    });
  }

  void _removeExpence(Expense expense) {
    final expenseIndex = _registeredexpences.indexOf(expense);
    setState(() {
      _registeredexpences.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Expense Deleted'),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          setState(() {
            _registeredexpences.insert(expenseIndex, expense);
          });
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget maincontent = const Center(
      child: Text('No expences found ,Try adding some!!'),
    );
    if (_registeredexpences.isNotEmpty) {
      maincontent = ExpencesList(
          expenses: _registeredexpences, OnRemovedExpense: _removeExpence);
    }
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Expense Track',
          ),
          actions: [
            IconButton.outlined(
                onPressed: _openAddExpenceOverlay, icon: const Icon(Icons.add))
          ]),
      body: Column(children: [
        Chart(expenses: _registeredexpences),
        Expanded(child: maincontent)
      ]),
    );
  }
}
