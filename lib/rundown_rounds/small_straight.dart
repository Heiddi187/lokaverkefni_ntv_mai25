import 'package:flutter/material.dart';
import '../dice/dice_build.dart';
import '../scoring/score_tracker.dart';
import 'large_straight.dart';
import '../screens/yahtzee_list.dart';

class SmallStraight extends StatefulWidget {
  const SmallStraight({super.key});

  @override
  State<SmallStraight> createState() => _SmallStraightState();
}

class _SmallStraightState extends State<SmallStraight> {
  int score = 0;
  bool showScore = false;

  void scoreRound(List<int> diceValues) {
    int score = 0;
    List<int> uniqueSorted = diceValues.toSet().toList()..sort();
    String values = uniqueSorted.join();
    if (values.contains("1234") ||
        values.contains("2345") ||
        values.contains("3456")) {
      score = 30;
    }
    addScoresToList("Small Straight", score);
    setState(() {
      showScore = true;
      this.score = score;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Round Small Straight"),
        leading: BackButton(
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (ctx) => YahtzeeList()));
          },
        ),
      ),
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
                  MaterialPageRoute(builder: (ctx) => const LargeStraight()),
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
