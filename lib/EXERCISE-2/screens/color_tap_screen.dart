
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_3_blabla_project/EXERCISE-2/models/colors_counter.dart';
import 'package:week_3_blabla_project/EXERCISE-2/step_3.dart';

class ColorTapsScreen extends StatelessWidget {
  const ColorTapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Color Taps')),
      body: Consumer<ColorCounters>(
        builder: (context, counters, child) {
          return Column(
            children: [
              ColorTap(
                type: CardType.red,
                tapCount: counters.redCount,
                onTap: counters.incrementRed,
              ),
              ColorTap(
                type: CardType.blue,
                tapCount: counters.blueCount,
                onTap: counters.incrementBlue,
              ),
            ],
          );
        },
      ),
    );
  }
}
