import 'package:flutter/material.dart';
import 'expense.dart';

class NewExpence extends StatefulWidget {
  const NewExpence({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpence> createState() => _NewExpenceState();
}

class _NewExpenceState extends State<NewExpence> {
  final _expencecontroller = TextEditingController();
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
  void _submitexpensedata() {
    final enteredAmount = double.tryParse(_amountcontroller.text);
    final amountisInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_expencecontroller.text.trim().isEmpty ||
        amountisInvalid ||
        _selecteddate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Invalid Input'),
                content:
                    const Text('Please enter valid date ,amount,title and category'),
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _expencecontroller,
            maxLength: 20,
            decoration: const InputDecoration(label: Text('Expence Name')),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                    controller: _amountcontroller,
                    keyboardType: TextInputType.number,
                    maxLength: 20,
                    decoration: const InputDecoration(
                        label: Text('Amount'), prefixText: '\₹')),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_selecteddate == null
                      ? 'Select Date'
                      : formatter.format(_selecteddate!)),
                  IconButton(
                      onPressed: _DatePicker,
                      icon: const Icon(Icons.date_range_outlined))
                ],
              )),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedcategory,
                  items: Category.values
                      .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toUpperCase())))
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
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              ElevatedButton(onPressed: _submitexpensedata, child: const Text('Save'))
            ],
          )
        ],
      ),
    );
  }
}
