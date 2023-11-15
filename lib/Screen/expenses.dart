import 'dart:convert';

import 'package:expencetracker/Widgets/expences_list.dart';
import 'package:expencetracker/Screen/new_item.dart';
import 'package:expencetracker/Screen/portfolio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Widgets/chart/chart.dart';
import '../Widgets/drawer.dart';
import '../Modals/expense.dart';
import 'package:http/http.dart' as http;
import '../categories.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {

   List<Expense> _registeredexpences = [
    // Expense(
    //   title: "ExpenseTracker app",
    //   amount: 99,
    //   date: DateTime.now(),
    //   category: _registeredexpences[],
    // ),
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

  void  _removeExpence(Expense expense) async {
    final expenseIndex = _registeredexpences.indexOf(expense);
    final url =
    Uri.https('expense-tracker-d64ee-default-rtdb.firebaseio.com', 'expense-tracker/${expense.id}.json');
    final response = await http.delete(url);
    setState(() {
      _registeredexpences.remove(expense);
    });
      if (response.statusCode >= 400) {
        setState(() {
          _registeredexpences.insert(expenseIndex, expense);
        });
      }
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
  void initState() {
    // TODO: implement initState
    super.initState();
    loadItem();
  }


  var isLoading = true;
  void loadItem() async {
    final url =
    Uri.https('expense-tracker-d64ee-default-rtdb.firebaseio.com', 'expense-tracker.json');
    final reponse = await http.get(url);
    if (reponse.body == 'null') {
      setState(() {
        isLoading = false;
      });
      return;
    }
    final Map<String, dynamic> listData = json.decode(reponse.body);
     List<Expense> loadedlist = [];
    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere(
              (catItem) => catItem.value.caption == item.value['category'])
          .value;
      final String dateString = item.value['date'];
      final DateFormat format = DateFormat('MM/dd/yyyy');
      DateTime date;
      try {
        date = format.parse(dateString);
      } catch (e) {
        // Handle the case where the date string is not in the expected format
        print('Invalid date format: $dateString');
        continue; // Skip this entry and move to the next one
      }
      loadedlist.add(Expense(
          id: item.key,
          title: item.value['title'],
          amount: item.value['amount'],
          category: category,
          date: date,
      comment: item.value['comment']));
    }
    setState(() {
      _registeredexpences = loadedlist;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget maincontent = const Center(
      child: Text('No expences found ,Try adding some!!'),
    );
    if (isLoading) {
      maincontent = const Center(
        child: CircularProgressIndicator(
            color: Colors.orangeAccent, backgroundColor: Colors.white),
      );
    }
    if (_registeredexpences.isNotEmpty){
      maincontent = ExpencesList(expenses: _registeredexpences, OnRemovedExpense: _removeExpence);
    }
    return Scaffold(backgroundColor: Colors.black,
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
