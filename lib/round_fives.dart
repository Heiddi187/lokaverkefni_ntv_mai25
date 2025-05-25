import 'package:flutter/material.dart';
import 'dice_build.dart';
import 'yahtzee_list.dart';
import 'round_sixes.dart';

class RoundFives extends StatefulWidget {
  const RoundFives({super.key});

  @override
  State<RoundFives> createState() => _RoundFivesState();
}

class _RoundFivesState extends State<RoundFives> {
  int score = 0;
  bool showScore = false;

  void scoreRound(List<int> diceValues) {
    int total = 0;
    for (var value in diceValues) {
      if (value == 5) {
        total += 5;
      }
    }
    setState(() {
      score = total;
      showScore = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Round Fives (count 5's)")),
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
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (ctx) => const RoundSixes()));
              },
              child: const Text("Next Round"),
            ),
          ],
        ],
      ),
    );
  }
}
