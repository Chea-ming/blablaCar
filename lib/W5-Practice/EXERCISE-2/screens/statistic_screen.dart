import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_3_blabla_project/W5-Practice/EXERCISE-2/models/colors_counter.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("StatisticsScreen Rebuilt");
    return Scaffold(
      appBar: AppBar(title: Text('Statistics')),
      body: Consumer<ColorCounters>(
        builder: (context, counters, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Red Taps: ${counters.redCount}',
                    style: TextStyle(fontSize: 24)),
                Text('Blue Taps: ${counters.blueCount}',
                    style: TextStyle(fontSize: 24)),
              ],
            ),
          );
        },
      ),
    );
  }
}
