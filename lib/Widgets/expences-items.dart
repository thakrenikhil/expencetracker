import 'package:flutter/material.dart';
import '../Modals/expense.dart';

class ExpenceItem extends StatefulWidget {
  const ExpenceItem({
    super.key,
    required this.expense,
  });
  final Expense expense;

  @override
  State<ExpenceItem> createState() => _ExpenceItemState();
}

class _ExpenceItemState extends State<ExpenceItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ExpenseCard(Expense(
                    amount: widget.expense.amount!,
                    date: widget.expense.date,
                    title: widget.expense.title!,
                    category: widget.expense.category!,
                    id: widget.expense.id,
                    comment: widget.expense.comment))));
      },
      child: Card(
        borderOnForeground: true,
        color: Colors.grey[850],
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.expense.title!,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              overflow: TextOverflow.visible,
                            ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      'Rs.${widget.expense.amount!.toStringAsFixed(0)}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(widget.expense.formatteddate,
                        style: const TextStyle(fontSize: 12)),
                  ],
                )
              ],
            )),
      ),
    );
  }
}

class ExpenseCard extends StatefulWidget {
  const ExpenseCard(this.expense, {super.key});
  final Expense expense;

  @override
  State<ExpenseCard> createState() => _ExpenseCardState();
}

class _ExpenseCardState extends State<ExpenseCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      // elevation: 5,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title:',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
            Text(
              widget.expense.title!,
              style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              'Date:',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
            Text(
              widget.expense.formatteddate,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'Category:',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.work_history,
                  color: Colors.white,
                  size: 24,
                ),
                const SizedBox(width: 16),
                Text(
                  widget.expense.category!.caption,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Amount:',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
            Text(
              'Rs ${widget.expense.amount.toString()}',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              'Comments:',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
            Text(
              widget.expense.comment,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            // InkWell(onTap: (){
            //
            // },
            //   enableFeedback:true ,borderRadius: BorderRadius.circular(8),highlightColor: Colors.white,
            //   child: const Row(crossAxisAlignment: CrossAxisAlignment.center,
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       FaIcon(FontAwesomeIcons.trash,color: Colors.redAccent,),
            //       SizedBox(width: 8,),
            //       Text('Delete Expense')
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
