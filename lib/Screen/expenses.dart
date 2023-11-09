import 'package:expencetracker/Widgets/expences_list.dart';
import 'package:expencetracker/Screen/new_item.dart';
import 'package:expencetracker/Screen/portfolio.dart';
import 'package:flutter/material.dart';
import '../Widgets/chart/chart.dart';
import '../Widgets/drawer.dart';
import '../Modals/expense.dart';

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
    showModalBottomSheet(useSafeArea: true,
        enableDrag: false,
        showDragHandle: true,
        isScrollControlled: true,
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

  void _portfolio() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Portfolio(),
        ));
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
      appBar: AppBar(backgroundColor: Colors.black,
          elevation:20,
          shape: const LinearBorder(),
          // leading: IconButton(
          //     onPressed: MainDrawer(), icon: const Icon(Icons.person_sharp)),
          title: const Text(
            'Expense Track',
          ),
          centerTitle: true,
          actions: [
            IconButton(onPressed: _portfolio, icon: const Icon(Icons.more_vert))
          ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        onPressed: _openAddExpenceOverlay,
        enableFeedback: true,
        child: const Icon(Icons.add_outlined),
      ),
      drawer: const MainDrawer(),
      body: Column(children: [
        Chart(expenses: _registeredexpences),
        Expanded(child: maincontent),
      ]),
    );
  }
}
