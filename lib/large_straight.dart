import 'package:flutter/material.dart';
import 'dice_build.dart';
import 'yahtzee_list.dart';
import 'yahtzee.dart';

class LargeStraight extends StatefulWidget {
  const LargeStraight({super.key});

  @override
  State<LargeStraight> createState() => _LargeStraightState();
}

class _LargeStraightState extends State<LargeStraight> {
  int score = 0;
  bool showScore = false;

  void scoreRound(List<int> diceValues) {
    int score = 0;

    // Remove duplicates and sort the list
    List<int> uniqueSorted = diceValues.toSet().toList()..sort();

    // Convert to string for easier matching
    String values = uniqueSorted.join();

    // Check if it contains any of these small straight patterns
    if (values.contains("12345") || values.contains("23456")) {
      score = 40;
    }

    setState(() {
      showScore = true;
      this.score = score;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Round Large Straight")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DiceSet(onFinished: scoreRound),
          const SizedBox(height: 20),
          if (showScore) ...[
            Text(
              "You scored: $score points",
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const FullYahtzee()),
                );
              },
              child: const Text("Next Round"),
            ),
          ],
        ],
      ),
    );
  }
}
