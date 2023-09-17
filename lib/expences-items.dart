import 'package:flutter/material.dart';
import 'expense.dart';

class ExpenceItem extends StatelessWidget {
  const ExpenceItem({super.key, required this.expense});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(expense.title, style: Theme.of(context).textTheme.titleLarge,),
                  const Spacer(),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.linear_scale_sharp,color: Colors.white,))
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Text('Rs.${expense.amount.toStringAsFixed(1)}',style: Theme.of(context).textTheme.bodyMedium,),
                  const Spacer(),
                  Row(
                    children: [Icon(CategoryIcon[expense.category]),
                    const SizedBox(width: 16,),
                    Text(expense.formatteddate)],
                  )
                ],
              )
            ],
          )),
    );
  }
}
