import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({super.key, required this.fill});

  final double fill;

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FractionallySizedBox(
          widthFactor: 0.6,
          heightFactor: fill,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.white,
                  style: BorderStyle.solid,
                  strokeAlign: BorderSide.strokeAlignOutside),
              shape: BoxShape.rectangle,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(4)),
              color: isDarkMode
                  ? Colors.black45
                  : Theme.of(context).colorScheme.primary.withOpacity(0.65),
            ),
            child: const Text("|\n|\n|",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center),
          ),
        ),
      ),
    );
  }
}
