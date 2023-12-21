import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Modals/expense.dart';
import 'package:http/http.dart' as http;

import '../categories.dart';
class NewExpence extends StatefulWidget {
  const NewExpence({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpence> createState() => _NewExpenceState();
}

class _NewExpenceState extends State<NewExpence> {
  var _isSending = false;
  final _formKey = GlobalKey<FormState>();
  get formattedDate{
    return formatter.format(_selecteddate!);
  }
  final _expencecontroller = TextEditingController();
  final _commentcontroller = TextEditingController(text: '');
  final _amountcontroller = TextEditingController();
  DateTime? _selecteddate = DateTime.now();
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

  Categories _selectedcategory = categories[Category.Work]!;
  void _submitexpensedata() async {
    setState(() {
      _isSending = true;
    });
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
          'category': _selectedcategory.caption,
          'date': formattedDate,
          'comment': _commentcontroller.text,
        }));
    final Map<String, dynamic> resData = json.decode(response.body);
    if (!context.mounted) {
      return;
    }
    widget.onAddExpense(Expense(
        id: resData['title'],
        amount: enteredAmount,
        date: _selecteddate!,
        title: _expencecontroller.text,
        category: _selectedcategory ,
    comment: _commentcontroller.text ));
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
              textCapitalization: TextCapitalization.characters,
              maxLength: 20,
              decoration: const InputDecoration(label: Text('Expence Name')),
              // onSaved: (value){
              //   _enteredName = value!;
              //
              // },
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
                InkWell(
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
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField(dropdownColor: Colors.black,
                      style: const TextStyle(
                          color: Colors.white, fontFamily: 'outfit'),
                      value: _selectedcategory,
                      items:
                      [
                        for (final category in categories.entries)
                          DropdownMenuItem(
                            value: category.value,
                            child: Row(
                              children: [
                                Container(
                                  height: 16,
                                  width: 16,
                                  //color: category.value.icon,
                                  child: category.value.icon,
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Text(category.value.caption,
                                  style: const TextStyle(color: Colors.white),)
                              ],
                            ),
                          ),
                      ],
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          _selectedcategory = value;
                        });
                      }),
                ),
                const Spacer(),
                OutlinedButton(
                    onPressed:_isSending ? null: _submitexpensedata, child: _isSending
                    ? const SizedBox(
                  height: 16,
                  width: 16,
                  child: CircularProgressIndicator(
                      color: Colors.orangeAccent,
                      backgroundColor: Colors.white),
                )
                    : const Text('Save'))
              ],
            ),const Divider(color: Colors.cyan,height: 20),
            TextFormField(
              style: const TextStyle(color: Colors.white, fontFamily: 'outfit'),
              controller: _commentcontroller,
              maxLength: 60,
             // initialValue: '',
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
