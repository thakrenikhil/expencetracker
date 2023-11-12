import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Modals/expense.dart';
import 'package:http/http.dart' as http;
class NewExpence extends StatefulWidget {
  const NewExpence({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpence> createState() => _NewExpenceState();
}

class _NewExpenceState extends State<NewExpence> {
  final _formKey = GlobalKey<FormState>();
  get formattedDate{
    return formatter.format(_selecteddate!);
  }
  final _expencecontroller = TextEditingController();
  final _commentcontroller = TextEditingController();
  final _amountcontroller = TextEditingController();
  DateTime? _selecteddate;
  _DatePicker() async {
    final now = DateTime.now();
    final firstdate = DateTime(now.year - 1, now.month, now.day);
    // final lastday = DateTime(now.year+1,now.month,now.day);
    final pickeddate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstdate,
        lastDate: now);
    setState(() {
      _selecteddate = pickeddate;
    });
  }

  Category _selectedcategory = Category.leisure;
  void _submitexpensedata() async {
    final enteredAmount = double.tryParse(_amountcontroller.text);
    final amountisInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_expencecontroller.text.trim().isEmpty ||
        amountisInvalid ||
        _selecteddate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(backgroundColor: Colors.grey,
                title: const Text('Invalid input',style: TextStyle(fontFamily: 'outfit'),),
                content: const Text(
                    'Please enter valid date ,amount,title and category'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text('OK'))
                ],
              ));
      return;
    }
    final url = Uri.https(
        'expense-tracker-d64ee-default-rtdb.firebaseio.com', 'expense-tracker.json');
    final response = await http.post(url,
        headers: {'content-type': 'application/json'},
        body: json.encode({
          'title': _expencecontroller.text,
          'amount': enteredAmount,
          'category': _selectedcategory.toString(),
          'date': formattedDate,
        }));
    final Map<String, dynamic> resData = json.decode(response.body);
    if (!context.mounted) {
      return;
    }
    widget.onAddExpense(Expense(
        amount: enteredAmount,
        date: _selecteddate!,
        title: _expencecontroller.text,
        category: _selectedcategory));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _expencecontroller.dispose();
    _amountcontroller.dispose();
    _commentcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form( key: _formKey,
        child: Column(
          children: [
            TextFormField(
              style: const TextStyle(color: Colors.white, fontFamily: 'outfit'),
              controller: _expencecontroller,
              maxLength: 20,
              decoration: const InputDecoration(label: Text('Expence Name')),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                      style: const TextStyle(
                          color: Colors.white, fontFamily: 'outfit'),
                      controller: _amountcontroller,
                      keyboardType: TextInputType.number,
                      maxLength: 20,
                      decoration: const InputDecoration(
                          label: Text('Amount'),
                          prefixText: '\₹',
                          prefixStyle: TextStyle(
                              color: Colors.white, fontFamily: 'outfit')),
                  // onSaved: (value){
                  //       _enteredAmount = value!;
                  // }
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: InkWell(
                  onTap: _DatePicker,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(_selecteddate == null
                          ? 'Select Date'
                          : formatter.format(_selecteddate!)),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.date_range_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                DropdownButton(
                    style: const TextStyle(
                        color: Colors.white, fontFamily: 'outfit'),
                    value: _selectedcategory,
                    items: Category.values
                        .map((category) => DropdownMenuItem(
                            value: category,
                            child: Text(
                              category.name.toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  backgroundColor: Colors.black45,
                                  fontFamily: 'outfit'),
                            )))
                        .toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        _selectedcategory = value;
                      });
                    }),
                const Spacer(),
                OutlinedButton(
                    onPressed: _submitexpensedata, child: const Text('Save'))
              ],
            ),const Divider(color: Colors.cyan,height: 20),
            TextFormField(
              style: const TextStyle(color: Colors.white, fontFamily: 'outfit'),
              controller: _commentcontroller,
              maxLength: 20,
              decoration: const InputDecoration(label: Text('Add Comment')),
            ),
            const Spacer(),
            OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const FaIcon(
                  FontAwesomeIcons.xmark,
                  color: Colors.redAccent,
                )),
          ],
        ),
      ),
    );
  }
}
