import 'package:flutter/material.dart';
import 'dice_build.dart';
import 'yahtzee_list.dart';
import 'three_of_a_kind.dart';

class ChanceRound extends StatefulWidget {
  const ChanceRound({super.key});

  @override
  State<ChanceRound> createState() => _ChanceRoundState();
}

class _ChanceRoundState extends State<ChanceRound> {
  int score = 0;
  bool showScore = false;

  void scoreRound(List<int> diceValues) {
    int total = 0;
    for (var value in diceValues) {
      total += value;
    }
    setState(() {
      score = total;
      showScore = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Round Chance (highest total)")),
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
                  MaterialPageRoute(builder: (ctx) => const ThreeOfaKind()),
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
