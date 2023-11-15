
import 'package:expencetracker/info.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Modals/expense.dart';


class ExpenceItem extends StatefulWidget {
  const ExpenceItem({super.key, required this.expense});
  final Expense expense;

  @override
  State<ExpenceItem> createState() => _ExpenceItemState();
}

class _ExpenceItemState extends State<ExpenceItem> {


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.expense.title!,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Info(),));
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.circleInfo,
                        size: 22,
                        color: Colors.white,
                      ),)
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Text(
                    'Rs.${widget.expense.amount!.toStringAsFixed(1)}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Spacer(),
                  Row(
                    children: [widget.expense.category?.icon?? Container(color: Colors.cyanAccent,),
                    //  Icon(categories[widget.expense.category]!.icon as IconData?),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(widget.expense.formatteddate)
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
